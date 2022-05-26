import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/constants/firebase.dart';
import 'package:vocabulary_learning/constants/storage.dart';
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
  Rx<UserModel> userModel = UserModel().obs;
  UserModel userCurrent = UserModel();
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      print("39 ========= user ==================");

      print(user);
      String _userId = user.uid;

      _initializeUserModel(_userId);
      Get.offAll(() => HomeIndexScreen());
    } else {
      Get.offAll(() => SigninScreen());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;

        _initializeUserModel(_userId);
        userCurrent.id = _userId;
        userCurrent.email = email.text.trim();
        userCurrent.password = password.text.trim();
        var user = json.encode({
          "id": _userId,
          "email": email.text.trim(),
          "password": password.text.trim()
        });
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
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
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
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
        {"name": name.text.trim(), "id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
    update();
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void updateImageUrl(urlImage) async {
    print("108");
    print(userModel.value.id);
    var result = await firebaseFirestore
        .collection(usersCollection)
        .doc(userModel.value.id)
        .update({'image': urlImage}).then((value) {});

    print(result);
    userModel.value.image = urlImage;
    update();
  }
}
