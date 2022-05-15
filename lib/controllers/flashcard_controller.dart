import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard.dart';
import 'package:vocabulary_learning/screens/flashCard/result_screen.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';

enum CardState { empty, studyAgain, gotIt }

class FlashCardController extends GetxController {
  static FlashCardController instance = Get.find();
  RxList<Vocabulary> listVocabulary = RxList<Vocabulary>();
  RxList<Vocabulary> listSelectedCard = RxList<Vocabulary>();
  RxList<CardState> listState = RxList<CardState>([]);
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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

    resetData();
    update();
  }

  void resetData() {
    currentIndex = 0.obs;
    listSelectedCard = listVocabulary;

    listState = List<CardState>.generate(listVocabulary.length, (index) {
      return CardState.empty;
    }).obs;
    update();
  }

  void setIndex(index) {
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
    quantityStudyAgainWord = getQuantityStudyAgain().obs;
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
  // void saveWord(String id, String )
}
