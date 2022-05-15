import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/screens/home/topic/topic_screen.dart';

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
                  right: 15, left: 15, top: 50, bottom: 10),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Your score",
                    style: TextStyle(
                      color: kmainBrown,
                      fontSize: 25,
                      fontFamily: 'PoetsenOne',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                          '${learningCtrl.correctAnswer}/${learningCtrl.learnings.length}')
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
