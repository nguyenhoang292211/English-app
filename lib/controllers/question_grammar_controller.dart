// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/colection.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/constants/storage.dart';
import 'package:vocabulary_learning/constants/type.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/models/grammar.dart';
import 'package:vocabulary_learning/models/question_grammar.dart';
import 'package:vocabulary_learning/models/score_grammar.dart';
import 'package:vocabulary_learning/screens/grammar/score_screen.dart';
import 'package:vocabulary_learning/screens/score/score_all_controller.dart';
import 'package:vocabulary_learning/utils/storeData.dart';

class QuestionGrammarController extends GetxController
    with SingleGetTickerProviderMixin {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late Map<String, dynamic> userCurrent;

  ScoreAllController scoreAllController = Get.put(ScoreAllController());
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  GrammarController grammarController = Get.put(GrammarController());

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectAns;
  int get selectedAns => _selectAns;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  List<String> _listQuesionToScore = [];
  List<String> get listQuesionToScore => _listQuesionToScore;
  List<bool> _listAnswerToScore = [];
  List<bool> get listAnswerToScore => _listAnswerToScore;

  late PageController _pageController;
  PageController get pageController => _pageController;

  RxList<QuestionGrammar> _lQuestion = RxList<QuestionGrammar>([]);
  RxList<QuestionGrammar> get lQuestion => _lQuestion;
  @override
  void onInit() {
    if (getItemFromLocalStorage(STORAGE.USER) != null) {
      userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
    }
    print(
        "------------------------ ${grammarController.grammarSelected.value.title}");
    _lQuestion.bindStream(grammarController
        .getListQuestionGrammar(grammarController.grammarSelected.value));
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    _pageController = PageController();
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
    if (getItemFromLocalStorage(STORAGE.USER) != null) {
      userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
    }
    print(
        "------------------------ ${grammarController.grammarSelected.value.title}");
    _lQuestion.bindStream(grammarController
        .getListQuestionGrammar(grammarController.grammarSelected.value));
    update();
  }

  void setGrammarSelectedById(String grammarId) async {
    Grammar grammarSelected = await firebaseFirestore
        .collection(COLECTION.GRAMMAR)
        .doc(grammarId)
        .get()
        .then((doc) => Grammar.fromMap(doc));

    grammarController.grammarSelected.value = grammarSelected;
    _lQuestion
        .bindStream(grammarController.getListQuestionGrammar(grammarSelected));
    update();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
    _animationController.dispose();
  }

  void updateNumberQuestion(int index) {
    _questionNumber++;
    update();
  }

  void checkAn(QuestionGrammar question, int selectIndex) {
    _isAnswer = true;
    _correctAns = question.answer!;
    _selectAns = selectIndex;
    if (lQuestion.value.indexOf(question) == 0) {
      _listAnswerToScore = [];
      _listQuesionToScore = [];
    }
    listQuesionToScore.add(question.question.toString());
    if (_correctAns == _selectAns) {
      _numOfCorrectAns++;
      listAnswerToScore.add(true);
    } else {
      listAnswerToScore.add(false);
    }
    Get.defaultDialog(
        title: "",
        titleStyle: const TextStyle(fontSize: 0),
        backgroundColor: kModalError,
        confirm: InkWell(
          onTap: () {
            Get.back(result: true);
          },
          child: const Text(
            "Yes",
            style: TextStyle(
                fontFamily: "PoetsenOne", fontSize: 26, color: kConfirmText),
          ),
        ),
        barrierDismissible: true,
        radius: 15,
        content: Column(
          children: [
            Text(
                (_correctAns == _selectAns)
                    ? "Great!! You so good!"
                    : "Opp!, You are wrong!!",
                style: const TextStyle(
                    color: kred, fontFamily: kPoetsenOne, fontSize: 25))
          ],
        )).then((value) => {
          if (value)
            {
              Future.delayed(const Duration(seconds: 3), () {
                _isAnswer = false;
                if (_questionNumber.value < lQuestion.length) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease);
                  _animationController.reset();

                  _animationController.forward();
                } else {
                  saveScoreGrammar();
                  Get.off(const ScoreScreen());
                }
              })
            }
        });
    _animationController.stop();
    update();
  }

  void saveScoreGrammar() {
    if (getItemFromLocalStorage(STORAGE.USER) != null) {
      userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
      ScoreGame scoreGame = ScoreGame(
          idContest: grammarController.grammarSelected.value.id,
          questions: listQuesionToScore,
          title: grammarController.grammarSelected.value.title,
          corrects: listAnswerToScore,
          idUser: userCurrent['id'],
          gameType: GAME_TYPE.GRAMMAR,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      scoreAllController.saveToScore(scoreGame);
    }

    _listAnswerToScore = [];
    _listQuesionToScore = [];
    update();
  }

  void nextQuestion() {
    if (_questionNumber.value != lQuestion.length) {
      _isAnswer = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }
    update();
  }
}
