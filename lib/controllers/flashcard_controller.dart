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
  RxList<Vocabulary> listVocabulary = RxList<Vocabulary>(dtaFake);
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

  void resetData() {
    currentIndex = 0.obs;
    listSelectedCard = listVocabulary;
    listState = List<CardState>.generate(
        listVocabulary.length, (int index) => CardState.empty).obs;
    log("dkfjdkfjdkf");
    log(listState.toString());
    update();
  }

  void setNextCard() {
    if (currentIndex.value < listSelectedCard.length - 1) {
      currentIndex.value = (currentIndex.value + 1 < listSelectedCard.length)
          ? currentIndex.value + 1
          : 0;
      update();
    } else {
      currentIndex.value = 0;
      update();
      Get.off(End_FlashCard());
    }
  }

  // void setBackIndex() {
  //   currentIndex.value =
  //       (currentIndex.value - 1 >= 0) ? currentIndex.value - 1 : 0;
  //   update();
  // }

  void getData(topicId) async {
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

  void setIndex(index) {
    if (index > currentIndex.value) {
      currentIndex.value = index;
      //Default status update
      if (listState[index - 1] == CardState.empty) {
        listState[index - 1] = CardState.gotIt;
      }
      quantityStudyAgainWord = getQuantityStudyAgain().obs;
      update();
    } else {
      if (currentIndex.value == listSelectedCard.length - 1 && index == 0) {
        currentIndex.value = listSelectedCard.length;
        if (listState[listSelectedCard.length - 1] == CardState.empty) {
          listState[listSelectedCard.length - 1] = CardState.gotIt;
        }
        quantityStudyAgainWord = getQuantityStudyAgain().obs;
      } else {
        currentIndex.value = index;
      }
      update();
      //normal

      //when the last element

    }
  }

  void setIndexWithState(index, updateState) {
    currentIndex.value = index;
    listState[index] = updateState;
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
  bool isLastIndex(){
    return currentIndex.value == listState.length;
  }
}
