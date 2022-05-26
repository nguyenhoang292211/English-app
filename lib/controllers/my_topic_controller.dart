import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:objectid/objectid.dart';
import 'package:vocabulary_learning/models/my_topic.dart';

class MyTopicController extends GetxController
    with SingleGetTickerProviderMixin {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxInt vocabNum = 1.obs;
  late RxList<MyTopic> _listTopics = RxList<MyTopic>([]);
  RxList<MyTopic> get listTopics => _listTopics;
  MyTopic seletedTopic = MyTopic(name: '');
  MyTopic createdTopic = MyTopic(name: "");
  late RxList<MyVocab> createdVocabs = RxList<MyVocab>([]);
  @override
  void onInit() {
    super.onInit();
    if (vocabNum.value == 1) {
      final vocab = MyVocab(id: generateId());
      createdVocabs.add(vocab);
    }
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
}
