import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/grammar.dart';
import 'package:vocabulary_learning/models/question_grammar.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_deatail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GrammarController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxList<Grammar> grammars = RxList<Grammar>([]);
  RxList<Grammar> grammarsSearch = RxList<Grammar>([]);

  Rx<Grammar> _grammarSelected = Grammar().obs;
  Rx<Grammar> get grammarSelected => this._grammarSelected;

  String collectionGrammar = "grammar";
  String collectionQuestion = "QuestionGrammar";
  @override
  onReady() {
    super.onReady();
    grammars.bindStream(getAllGrammar());
    grammarsSearch.bindStream(getAllGrammar());
  }

  @override
  void onInit() {
    super.onInit();

    grammars.bindStream(getAllGrammar());
    grammarsSearch.bindStream(getAllGrammar());
  }

  Stream<List<Grammar>> getAllGrammar() =>
      firebaseFirestore.collection(collectionGrammar).snapshots().map((query) =>
          query.docs.map((item) => Grammar.fromMap(item.data())).toList());

  Stream<List<QuestionGrammar>> getListQuestionGrammar(Grammar grammar) =>
      firebaseFirestore
          .collection(collectionQuestion)
          .where("id", whereIn: grammar.questions)
          .snapshots()
          .map((query) => query.docs
              .map((item) => QuestionGrammar.fromMap(item.data()))
              .toList());

  void searchGrammar(String textSearch) {
    List<Grammar> lTemp = [];
    grammarsSearch.clear();
    grammars.forEach((grammar) {
      grammar.title!.toLowerCase().contains(textSearch.toLowerCase())
          ? grammarsSearch.add(grammar)
          : null;
    });
    update();
  }

  RxList<QuestionGrammar> _lQuestionGrammar = RxList<QuestionGrammar>([]);
  RxList<QuestionGrammar> get lQuestionGrammar => this._lQuestionGrammar;

  void goToDetailGrammar(Grammar grammar) {
    _grammarSelected.value = grammar;
    print("_grammarSelected: ${_grammarSelected.value.title.toString()}");
    getAllQuestionBySelectedGrammar(grammar);
    update();
    Get.to(GrammarDetail(
      grammar: grammar,
    ));
  }

  Grammar getSelected() {
    update();
    return _grammarSelected.value;
  }

  void getAllQuestionBySelectedGrammar(Grammar grammar) {
    _lQuestionGrammar.bindStream(getListQuestionGrammar(grammar));
  }

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
