// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/screens/grammar/components/button_detail.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: // extendBodyBehindAppBar: true,
            AppBar(
          actions: [
            FlatButton(
                onPressed: () {
                  Get.to(const GrammarAllScreen());
                },
                child: const Text(
                  "End",
                  style: TextStyle(
                      color: Color.fromARGB(31, 10, 8, 8),
                      fontWeight: FontWeight.bold),
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GetBuilder<QuestionGrammarController>(
          init: QuestionGrammarController(),
          builder: (qController) {
            return Stack(children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(color: kScoreScreen),
              ),
              Positioned(
                top: size.height * 0.3,
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("./asset/images/scoreAward.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Obx(
                        () => Column(
                          children: [
                            Text(
                                "Correct: ${qController.numOfCorrectAns}/${qController.lQuestion.length}",
                                style: const TextStyle(
                                    color: Color(0xFF0DA300),
                                    fontFamily: "PoetsenOne",
                                    fontSize: 16)),
                            const Text("You so excellent!",
                                style: TextStyle(
                                    color: Color(0xFFDA0505),
                                    fontFamily: "PoetsenOne",
                                    fontSize: 20)),
                            const Text("Let’s try more to be perfect",
                                style: TextStyle(
                                    color: Color(0xFFDA0505),
                                    fontFamily: "PoetsenOne",
                                    fontSize: 20))
                          ],
                        ),
                      )),
                ),
              ),
              Positioned(
                  bottom: size.height * 0.05,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  child: ButtonDetail(
                    title: "Finish",
                    onPress: () {
                      Get.deleteAll();
                      Get.to(const GrammarAllScreen());
                    },
                    color: kmainBrown,
                  ))
            ]);
          },
        ));
  }
}
