import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard.dart';
import 'package:vocabulary_learning/screens/flashCard/result_screen.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';

var dtaFake = [
   Vocabulary(
        id: "voce_01",
        word: "family",
        mean: "1 Where u can go",
        translatedDefinition: "W -u -c- g",
        img: "http://hu.png",
        topicId: "hihih",
        spelling: "f-a-m-i-l-y"),
    Vocabulary(
        id: "voce_02",
        word: "developer",
        mean: "2 Where u can go",
        translatedDefinition: "W -u -c- g",
        img: "http://hu.png",
        topicId: "hihih",
        spelling: "f-a-m-i-l-y"),
    Vocabulary(
        id: "voce_03",
        word: "immediately",
        mean: "3 Where u can go",
        translatedDefinition: "W -u -c- g",
        img: "http://hu.png",
        topicId: "hihih",
        spelling: "f-a-m-i-l-y")
];

class FlashCardController extends GetxController {
  RxList<Vocabulary> listSelectedCard = RxList<Vocabulary>(dtaFake);
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // getData("hhZqdS6b6zsHdPjC7ZQD");
  }

  void setNextCard() {
    if (currentIndex.value < listSelectedCard.length - 1) {
      currentIndex.value = (currentIndex.value + 1 < listSelectedCard.length)
          ? currentIndex.value + 1
          : 0;
      update();
    } else {
      currentIndex.value=0;
      update();
      Get.off(End_FlashCard());
    }
  }

  void setBackIndex() {
    currentIndex.value =
        (currentIndex.value - 1 >= 0) ? currentIndex.value - 1 : 0;
    update();
  }

  void getData(topicId) async {
    log("60 from getDATA");
    showLoading();
    FirebaseFirestore.instance
        .collection('Vocabulary')
        .where('topic', isEqualTo: topicId)
        .snapshots()
        .listen((snapshot) {
      listSelectedCard.value =
          snapshot.docs.map((item) => Vocabulary.fromMap(item.data())).toList();
        
          update();
      // dismissLoadingWidget();
    });
  }
}
