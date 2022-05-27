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
  late final RxList<MyTopic> _listTopics = RxList<MyTopic>([]);
  RxList<MyTopic> get listTopics => _listTopics;
  MyTopic seletedTopic = MyTopic(name: '');
  MyTopic createdTopic = MyTopic(name: "", color: "0xffFFD6D6");
  late RxList<MyVocab> createdVocabs = RxList<MyVocab>([]);
  RxBool saveSuccess = false.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void initTopic() async {
    // userCurrent = await json.decode(getItemFromLocalStorage(STORAGE.USER));

    final vocab = MyVocab(id: generateId());
    createdVocabs.add(vocab);
    createdTopic.id = generateId();
    // createdTopic.userId = userCurrent['id'];
  }

  void saveTopic() async {
    createdTopic.vocabularies = createdVocabs;
    print(createdVocabs);
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
    print(vocabs);
    final data = <String, dynamic>{
      "id": createdTopic.id,
      "name": createdTopic.name,
      "color": createdTopic.color,
      "userId": createdTopic.userId,
      "vocabularies": vocabs
    };
    print(data);
    isLoading = true.obs;
    await firebaseFirestore.collection("my_topic").add(data).then((value) {
      listTopics.add(createdTopic);
      saveSuccess = true.obs;
      print(value);
    }).catchError((err) {
      saveSuccess = false.obs;
    });
    isLoading = false.obs;
    update();
  }

  void resetCreatedTopic() {
    createdTopic = MyTopic(name: "", color: "0xffFFD6D6");
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
