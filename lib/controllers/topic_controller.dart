import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/topic.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/learning_screen.dart';
import 'package:vocabulary_learning/screens/home/topic/topic_screen.dart';

class TopicController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxList<Topic> topics = RxList<Topic>([]);
  RxList<Vocabulary> vocabularys = RxList<Vocabulary>([]);

  late Topic _topicSelected = Topic();
  Topic get topicSelected => _topicSelected;

  String collectionTopic = "topic";
  String collectionVocab = "vocabulary";

  @override
  onReady() {
    super.onReady();
    topics.bindStream(getAllTopic());
    // grammarsSearch.bindStream(getAllGrammar());
  }

  @override
  void onInit() {
    super.onInit();

    topics.bindStream(getAllTopic());
    // grammarsSearch.bindStream(getAllGrammar());
  }

  Stream<List<Topic>> getAllTopic() =>
      firebaseFirestore.collection(collectionTopic).snapshots().map((query) =>
          query.docs.map((item) => Topic.fromMap(item.data())).toList());

  void goToDetailTopic(Topic topic) {
    _topicSelected = topic;
    vocabularys.bindStream(getListVocabs());
    Get.to(TopicScreen(vocabularies: vocabularys));
  }

  Stream<List<Vocabulary>> getListVocabs() => firebaseFirestore
      .collection(collectionVocab)
      .where("id", isEqualTo: _topicSelected.id)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => Vocabulary.fromMap(item.data())).toList());

  // void searchGrammar(String textSearch) {
  //   List<Grammar> lTemp = [];
  //   grammarsSearch.clear();
  //   grammars.forEach((grammar) {
  //     grammar.title!.toLowerCase().contains(textSearch.toLowerCase())
  //         ? grammarsSearch.add(grammar)
  //         : null;
  //   });
  //   update();
  // }

  // RxList<QuestionGrammar> _lQuestionGrammar = RxList<QuestionGrammar>([]);
  // RxList<QuestionGrammar> get lQuestionGrammar => this._lQuestionGrammar;

  // void goToDetailGrammar(Grammar grammar) {
  //   _grammarSelected = grammar;
  //   getAllQuestionBySelectedGrammar();
  //   Get.to(GrammarDetail());
  // }

  // void getAllQuestionBySelectedGrammar() {
  //   lQuestionGrammar.bindStream(getListQuestionGrammar());
  // }

  Color getColorByIndex(int index) {
    if ((index + 1) % 7 == 0) return kBlueGrammar;
    if ((index + 1) % 7 == 1) return kNudeGrammar;
    if ((index + 1) % 7 == 2) return kGreenGrammar;
    if ((index + 1) % 7 == 3) return kYellowGrammar;
    if ((index + 1) % 7 == 4) return kOrangeGrammar;
    if ((index + 1) % 7 == 5) return kPurpleGrammar;
    if ((index + 1) % 7 == 6) return kPinkGrammar;
    return Colors.black;
  }
}
