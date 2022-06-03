import 'dart:convert';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_learning/constants/colection.dart';
import 'package:uuid/uuid.dart';
import 'package:vocabulary_learning/constants/storage.dart';
import 'package:vocabulary_learning/constants/type.dart';
import 'package:vocabulary_learning/models/score_grammar.dart';
import 'package:vocabulary_learning/models/user.dart';
import 'package:vocabulary_learning/utils/storeData.dart';

class ScoreAllController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxList<ScoreGame> scoreGames = RxList<ScoreGame>([]);
  late Map<String, dynamic> userCurrent;
  Rx<UserModel> userModel = UserModel().obs;
  @override
  onReady() {
    super.onReady();
    userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));

    scoreGames
        .bindStream(getAllScoreGrammar(userCurrent['id'], GAME_TYPE.GRAMMAR));
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));

    scoreGames
        .bindStream(getAllScoreGrammar(userCurrent['id'], GAME_TYPE.GRAMMAR));

    update();
  }

  Stream<List<ScoreGame>> getAllScoreGrammar(String userId, String type) =>
      firebaseFirestore
          .collection(COLECTION.SCORE_GAME)
          .where('idUser', isEqualTo: userId)
          .where('gameType', isEqualTo: type)
          .snapshots()
          .map((query) => query.docs
              .map((item) => ScoreGame.fromMap(item.data()))
              .toList());

  var uuid = const Uuid();
  void saveToScore(ScoreGame scoreGame) {
    firebaseFirestore
        .collection(COLECTION.SCORE_GAME)
        .doc(uuid.v4())
        .set(scoreGame.toMap());
  }
}
