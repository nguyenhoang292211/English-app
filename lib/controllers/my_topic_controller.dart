import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:objectid/objectid.dart';
import 'package:vocabulary_learning/constants/storage.dart';
import 'package:vocabulary_learning/models/my_topic.dart';
import 'package:vocabulary_learning/utils/storeData.dart';

class MyTopicController extends GetxController
    with SingleGetTickerProviderMixin {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxInt vocabNum = 1.obs;
  late Map<String, dynamic> userCurrent;
  RxList<MyTopic> listTopics = RxList<MyTopic>([]);
  MyTopic seletedTopic = MyTopic(name: '');
  MyTopic createdTopic = MyTopic(name: "", color: "0xffFFD6D6");
  late RxList<MyVocab> createdVocabs = RxList<MyVocab>([]);
  RxBool saveSuccess = false.obs;
  RxBool isLoading = false.obs;
  RxBool cantCreateTopic = false.obs;
  @override
  void onInit() {
    super.onInit();
    listTopics.bindStream(getMyTopic());
    update();
  }

  void initTopic() async {
    // userCurrent = await json.decode(getItemFromLocalStorage(STORAGE.USER));
    if (createdVocabs.isEmpty) {
      final vocab = MyVocab(id: generateId());
      createdVocabs.add(vocab);
      // createdTopic.userId = userCurrent['id'];
    }

    createdTopic.id = generateId();
  }

  Stream<List<MyTopic>> getMyTopic() => firebaseFirestore
      .collection('my_topic')
      .snapshots()
      .map((query) => query.docs
          .map((item) => MyTopic.fromMap(item.data(), item.id))
          .toList());

  /* ------------------------------- SAVE TOPIC ------------------------------- */
  Future<bool> saveTopic() async {
    try {
      // ...
      if (createdTopic.name.isEmpty || createdTopic.vocabularies.isBlank!) {
        cantCreateTopic = true.obs;
        update();
        return false;
      }
      createdTopic.vocabularies = createdVocabs;
      print("==========Created topic==========");
      print(createdTopic);
      final vocabs = [];
      createdTopic.vocabularies?.forEach((item) {
        final vocab = <String, dynamic>{
          "id": item.id,
          "word": item.word,
          "mean": item.mean,
          "type": item.type,
          "translation": item.translation
        };
        vocabs.add(vocab);
      });

      final data = <String, dynamic>{
        "id": createdTopic.id,
        "name": createdTopic.name,
        "color": createdTopic.color,
        "userId": createdTopic.userId,
        "vocabularies": vocabs
      };
      isLoading = true.obs;
      print("==========data==========");

      print(data);
      await firebaseFirestore.collection("my_topic").add(data).then((value) {
        createdTopic.docID = value.id;
        listTopics.add(createdTopic);
        saveSuccess = true.obs;
      }).catchError((err) {
        saveSuccess = false.obs;
      });

      isLoading = false.obs;
      update();

      return true;
    } on NullThrownError catch (e) {
      //Handle exception of type SomeException
      print("Null Exception===>>>" + e.toString());
      return false;
    } catch (e) {
      //Handle all other exceptions
      print("Exception===>>>" + e.toString());
      return false;
    }
  }

  Future<bool> deleteTopic(String docID) async {
    return firebaseFirestore
        .collection("my_topic")
        .doc(docID)
        .delete()
        .then((value) {
      print("User Deleted");
      listTopics.removeWhere((element) => element.docID == docID);
      update();

      return true;
    }).catchError((error) {
      print("Failed to delete user: $error");
      return false;
    });
  }

  void resetCreatedTopic() {
    createdTopic = MyTopic(name: "", color: "0xffFFD6D6");
    createdVocabs.clear();
  }

  void setVocabNum(int number) {
    vocabNum = number.obs;
  }

  String generateId() {
    final id = ObjectId();
    return id.hexString;
  }

  void addMyVocab() {
    final vocab = MyVocab(id: generateId());
    createdVocabs.add(vocab);
  }

  void removeMyVocab(MyVocab vocab) {
    createdVocabs.removeWhere((element) => element.id == vocab.id);
  }

  void updateColor(String color) {
    createdTopic.color = color;
    update();
  }
}
