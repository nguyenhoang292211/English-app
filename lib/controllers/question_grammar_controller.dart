import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/models/question_grammar.dart';
import 'package:vocabulary_learning/screens/grammar/score_screen.dart';
 
class QuestionGrammarController extends GetxController with SingleGetTickerProviderMixin {

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

    RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;


  GrammarController grammarController = Get.put(GrammarController());
  
  bool _isAnswer = false;
  bool get isAnswer => this._isAnswer;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectAns;
  int get selectedAns => this._selectAns;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

   late PageController _pageController;
  PageController get pageController => this._pageController;

  RxList<QuestionGrammar> lQuestion = RxList<QuestionGrammar>([]);
  @override
  void onInit() {
    lQuestion.bindStream(grammarController.getListQuestionGrammar());
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
   _animationController.forward();
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose () {
    super.onClose();
    _pageController.dispose();
    _animationController.dispose();
  }

  void updateNumberQuestion (int index) {
    _questionNumber++;
  }

   void checkAn (QuestionGrammar question, int selectIndex) {
    _isAnswer = true;
    _correctAns = question.answer!;
    _selectAns = selectIndex;

    if(_correctAns == _selectAns) _numOfCorrectAns++;
    // Get.defaultDialog(
    //           titleStyle: TextStyle(fontSize: 0),
    //           backgroundColor: kModalError,
    //           // titleStyle: TextStyle(color: Colors.white),
    //           // middleTextStyle: TextStyle(color: Colors.white),
    //           // textConfirm: "Confirm",
    //           // textCancel: "Cancel",
    //           // cancelTextColor: Colors.white,
    //           // confirmTextColor: Colors.white,
    //           // buttonColor: Colors.red,
    //           //cancel: Text("No", style: TextStyle(fontFamily: "PoetsenOne", fontSize: 26),),
    //           confirm: Text("Yes", style: TextStyle(fontFamily: "PoetsenOne", fontSize: 26, color: kConfirmText),),
              
    //           barrierDismissible: true,
    //           radius: 20,
    //           content: Column(
    //             children: [
    //               Container(child:Text("Hello 1")),
    //               Container(child:Text("Hello 2")),
    //               Container(child:Text("Hello 3")),
    //             ],
    //           )
    //         );
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), (){
      _isAnswer = false;
        if(_questionNumber.value < lQuestion.length) {
           _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();

      _animationController.forward(); 
        } else Get.to(ScoreScreen());
        });
  }

  void nextQuestion () {
    if (_questionNumber.value != lQuestion.length) {
      _isAnswer = false;
       _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }
  }
  
}