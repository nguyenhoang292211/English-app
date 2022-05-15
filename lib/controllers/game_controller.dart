import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/models/word_find_ques.dart';
import 'package:vocabulary_learning/screens/home/topic/game/game_screen.dart';

class GameController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxList<WordFindQues> games = RxList<WordFindQues>([]);
  @override
  onReady() {
    super.onReady();
    games.bindStream(getAllGameQues());
  }

  @override
  void onInit() {
    super.onInit();
    games.bindStream(getAllGameQues());
  }

  Stream<List<WordFindQues>> getAllGameQues() =>
      firebaseFirestore.collection('game').snapshots().map((query) =>
          query.docs.map((item) => WordFindQues.fromMap(item.data())).toList());

  void goToGameScreen() {
    Get.to(WordFind());
  }
}
