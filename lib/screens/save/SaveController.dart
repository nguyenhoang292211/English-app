import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_learning/constants/colection.dart';
import 'package:vocabulary_learning/constants/storage.dart';
import 'package:vocabulary_learning/models/user.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/utils/storeData.dart';

class SaveController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxList<Vocabulary> vocabularys = RxList<Vocabulary>([]);
  Map<String, dynamic> userCurrent =
      json.decode(getItemFromLocalStorage(STORAGE.USER));
  Rx<UserModel> userModel = UserModel().obs;

  UserModel? user;
  @override
  void onInit() {
    super.onInit();
    userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
    _initializeUserModel(userCurrent['id']);
    update();
  }

  @override
  onReady() {
    super.onReady();
    userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
    _initializeUserModel(userCurrent['id']);
    update();
  }

  void onPressSave(String vocabId) {
    UserModel userItem = userModel.value;
    List<dynamic> saves = userModel.value.savedVocabs!.toList();
    !saves.contains(vocabId) ? saves.add(vocabId) : saves.remove(vocabId);
    userItem.savedVocabs = saves;
    saveToVocabulary(userItem);
    update();
  }

  bool isSave(String vocabId) {
    List<dynamic> saves = userModel.value.savedVocabs!.toList();
    update();
    return saves.contains(vocabId) ? true : false;
  }

  void saveToVocabulary(UserModel userItem) {
    firebaseFirestore.collection(COLECTION.USER).doc(userCurrent['id']).set(
          userItem.toMap(),
          SetOptions(
            merge: true,
          ),
        );
    _initializeUserModel(userCurrent['id']);
    update();
  }

  Stream<List<Vocabulary>> getListVocabulary(List<dynamic>? saves) {
    return firebaseFirestore
        .collection(COLECTION.VOCABULARY)
        .where("id", whereIn: saves)
        .snapshots()
        .map((query) =>
            query.docs.map((item) => Vocabulary.fromMap(item.data())).toList());
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(COLECTION.USER)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
    vocabularys
        .bindStream(getListVocabulary(userModel.value.savedVocabs?.toList()));
  }
}
