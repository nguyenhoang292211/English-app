// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';

class ResultLearningScreen extends StatelessWidget {
  ResultLearningScreen({Key? key}) : super(key: key);
  late TopicController topicController = Get.put(TopicController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, "topic");
        return false;
      },
      child: GetBuilder<LearningController>(
          init: LearningController(),
          builder: (learningCtrl) {
            return Container(
              width: size.width,
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 40, bottom: 10),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 252, 247, 176),
                        Color.fromARGB(255, 242, 255, 207),
                        Color.fromARGB(255, 148, 255, 138),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 0.45, 0.9])),
              child: Column(
                children: [
                  Image(
                      image: const AssetImage('asset/images/score.png'),
                      fit: BoxFit.fitHeight,
                      height: size.height * 0.2),
                  Text(
                    learningCtrl.correctAnswer < 2
                        ? "Oh, don't worrry.Try and you'll be better!"
                        : learningCtrl.correctAnswer <
                                learningCtrl.learnings.length - 2
                            ? "I can see your effort,let's try continously."
                            : "Congratulation!",
                    style: const TextStyle(
                        color: kmainOrange,
                        fontSize: 22,
                        fontFamily: 'PoetsenOne',
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.95,
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/images/scoreAward.png"),
                            fit: BoxFit.fitWidth)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Your score",
                          style: TextStyle(
                              color: kfirstGradientBack,
                              fontSize: 28,
                              fontFamily: 'PoetsenOne',
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${learningCtrl.correctAnswer}/${learningCtrl.learnings.length}',
                              style: const TextStyle(
                                  color: kfirstGradientBack,
                                  fontSize: 35,
                                  fontFamily: 'PoetsenOne',
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  MainButton(
                      text: "Complete",
                      width: size.width * 0.3,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      })
                ],
              ),
            );
          }),
    );
  }
}
