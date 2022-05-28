import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/constants/firebase.dart';
import 'package:vocabulary_learning/constants/storage.dart';
import 'package:vocabulary_learning/models/accumulation.dart';
import 'package:vocabulary_learning/models/user.dart';
import 'package:vocabulary_learning/screens/auth/signin_screen.dart';
import 'package:vocabulary_learning/screens/home/index.dart';
import 'package:vocabulary_learning/screens/my_topic/create_topic_screen.dart';
import 'package:vocabulary_learning/screens/my_topic/my_topic_screen.dart';
import 'package:vocabulary_learning/screens/onboard/onboard_screen.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';
import 'package:vocabulary_learning/utils/storeData.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  Rx<String> errPassword = "".obs;

  String usersCollection = "users";
  String accumulationCollection = 'accumulation';

  Rx<UserModel> userModel = UserModel().obs;
  UserModel userCurrent = UserModel();

  bool showCalendar = false;
  RxList<Accumulation> dateAccumulation = RxList<Accumulation>([]);

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  Stream<List<Accumulation>> getDateAccumulation(email) =>
      firebaseFirestore.collection(accumulationCollection).where("email", isEqualTo: email).snapshots().map((query) => query.docs.map((item) => Accumulation.fromMap(item.data())).toList());

  _setInitialScreen(User? user) async {
    if (user != null) {
      print("39 ========= user ==================");

      print(user);
      String _userId = user.uid;

      _initializeUserModel(_userId);
      dateAccumulation.bindStream(getDateAccumulation(user.email));
      if (dateAccumulation.length > 0) {
        if (dateAccumulation[0].dateAccumulation!.indexOf(DateTime.now().toIso8601String().substring(0, 10)) < 0) {
          var listOnlineDay = [...dateAccumulation[0].dateAccumulation!, DateTime.now().toIso8601String().substring(0, 10)];
          updateDateLearning(listOnlineDay);
        }
      }
      print(dateAccumulation);
      Get.offAll(() => HomeIndexScreen());
    } else {
      // Get.offAll(() => CreateTopicScreen());
      Get.offAll(() => SigninScreen());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result) {
        String _userId = result.user!.uid;

        _initializeUserModel(_userId);
        userCurrent.id = _userId;
        userCurrent.email = email.text.trim();
        userCurrent.password = password.text.trim();
        dateAccumulation.bindStream(getDateAccumulation(email.text.trim()));
        if (dateAccumulation[0].dateAccumulation!.indexOf(DateTime.now().toIso8601String().substring(0, 10)) < 0) {
          var listOnlineDay = [...dateAccumulation[0].dateAccumulation!, DateTime.now().toIso8601String().substring(0, 10)];
          updateDateLearning(listOnlineDay);
        }
        print(dateAccumulation);
        var user = json.encode({"id": _userId, "email": email.text.trim(), "password": password.text.trim()});
        addItemsToLocalStorage(STORAGE.USER, user);
        _clearControllers();
        Get.offAll(() => HomeIndexScreen());
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    showLoading();
    //Validate input
    if (password.text.trim().length < 6) {
      errPassword = "Password must have least 6 character".obs;
      update();
      dismissLoadingWidget();
      return;
    }
    if (password.text.trim() != passwordConfirm.text.trim()) {
      errPassword = "Password not match".obs;
      update();
      dismissLoadingWidget();
      return;
    }
    errPassword = "".obs;
    update();
    try {
      await auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    clearLocalStorage();
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({"name": name.text.trim(), "id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore.collection(usersCollection).doc(userId).get().then((doc) => UserModel.fromSnapshot(doc));

    update();
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void updateImageUrl(urlImage) async {
    var result = await firebaseFirestore.collection(usersCollection).doc(userModel.value.id).update({'image': urlImage}).then((value) {});

    print(result);
    userModel.value.image = urlImage;
    update();
  }

  void useCalendar(bool isShow) {
    showCalendar = isShow;
    print(isShow);
    update();
  }

  void updateDateLearning(List<String> mDateAccumulation) async {
    final userInfo = await firebaseFirestore.collection(accumulationCollection).where("email", isEqualTo: userCurrent.email).limit(1).get().then((QuerySnapshot snapshot) {
      return snapshot.docs[0].reference;
    });

    var batch = firebaseFirestore.batch();
    batch.update(userInfo, {'dateAccumulation': mDateAccumulation});
    batch.commit();
  }
}
