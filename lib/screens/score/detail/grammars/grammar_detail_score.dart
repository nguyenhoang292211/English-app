import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/screens/grammar/components/button_detail.dart';
import 'package:vocabulary_learning/screens/question/question_screen.dart';
import 'package:vocabulary_learning/screens/score/detail/components/question.dart';

class GrammarDetailScore extends StatelessWidget {
  GrammarDetailScore({Key? key, this.questions, this.corrects, this.grammarId})
      : super(key: key);
  List<dynamic>? questions;
  List<dynamic>? corrects;
  String? grammarId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final QuestionGrammarController qController =
        Get.put(QuestionGrammarController());
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 241, 255, 179),
                Color.fromARGB(255, 242, 255, 207),
                Color.fromARGB(255, 210, 255, 206),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.45, 0.9])),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Image(
                            image: AssetImage("asset/images/ArrowLeft.png"),
                            height: 20,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: questions!.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemBuilder: (BuildContext context, int index) {
              return (QuestionAnswer(
                  isCorrest: corrects![index] ?? false,
                  question: "${questions![index]}",
                  onPress: () {
                    //Get
                  }));
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonDetail(
              title: "play again",
              onPress: () {
                qController.setGrammarSelectedById(grammarId!);
                Get.to(const QuestionScreen());
              },
              color: kBlueLine,
            ),
          )
        ],
      ),
    )));
  }
}
