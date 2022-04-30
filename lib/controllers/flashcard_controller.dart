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
enum CardState { empty, studyAgain, gotIt }

class FlashCardController extends GetxController {
  RxList<Vocabulary> listVocabulary = RxList<Vocabulary>();
  RxList<Vocabulary> listSelectedCard = RxList<Vocabulary>();
  RxList<CardState> listState = RxList<CardState>();
  var currentIndex = 0.obs;
  var quantityStudyAgainWord = 0.obs;

  @override
  onReady() {
    super.onReady();
    resetData();
  }

  @override
  void onInit() {
    super.onInit();
    resetData();
  }

  void setVocabularies(vocabularies) {
    listVocabulary = vocabularies;
  }

  void resetData() {
    currentIndex = 0.obs;
    listSelectedCard = listVocabulary;
    listState = List<CardState>.generate(
        listVocabulary.length, (int index) => CardState.empty).obs;
    update();
  }

  void setIndex(index) {
    // if (index > currentIndex.value) {
    //   currentIndex.value = index;
    //   //Default status update
    //   if (listState[index - 1] == CardState.empty) {
    //     listState[index - 1] = CardState.gotIt;
    //   }
    //   quantityStudyAgainWord = getQuantityStudyAgain().obs;
    //   update();
    // } else {
    //   if (currentIndex.value == listSelectedCard.length - 1 && index == 0) {
    //     currentIndex.value = listSelectedCard.length;
    //     if (listState[listSelectedCard.length - 1] == CardState.empty) {
    //       listState[listSelectedCard.length - 1] = CardState.gotIt;
    //     }
    //     quantityStudyAgainWord = getQuantityStudyAgain().obs;
    //   } else {
    //     currentIndex.value = index;
    //   }
    //   update();

    // }
    if (currentIndex.value == listSelectedCard.length - 1 && index == 0) {
      //The last element in array
      currentIndex.value = listSelectedCard.length;
      if (listState[listSelectedCard.length - 1] == CardState.empty) {
        listState[listSelectedCard.length - 1] = CardState.gotIt;
      }
    } else {
      currentIndex.value = index;
      if (listState[index - 1] == CardState.empty) {
        listState[index - 1] = CardState.gotIt;
      }
    }
    update();
  }

  void updateState(updateState) {
    listState[currentIndex.value] = updateState;
    update();
  }

  void studyAgain() {
    //Reset
    RxList<Vocabulary> tmpSelected = listSelectedCard;
    RxList<CardState> tmpState = listState;
    listSelectedCard = RxList<Vocabulary>();
    listState = RxList<CardState>();
    currentIndex = 0.obs;
    for (int i = 0; i < tmpSelected.length; i++) {
      if (tmpState[i] == CardState.studyAgain) {
        listSelectedCard.add(tmpSelected[i]);
        listState.add(CardState.studyAgain);
      }
    }
    update();
  }

  int getQuantityStudyAgain() {
    return listState.where((s) => s == CardState.studyAgain).toList().length;
  }

  bool isLastIndex() {
    return currentIndex.value == listState.length;
  }
}
