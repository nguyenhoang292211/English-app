// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/screens/score/components/content_component.dart';
import 'package:vocabulary_learning/screens/score/components/grammar_score.dart';
import 'package:vocabulary_learning/screens/score/components/max-score.dart';
import 'package:vocabulary_learning/screens/score/components/vocalulary_score_all.dart';
import 'package:vocabulary_learning/screens/score/score_all_controller.dart';

class ScoreAllScreen extends StatefulWidget {
  const ScoreAllScreen({Key? key}) : super(key: key);

  @override
  State<ScoreAllScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreAllScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScoreAllController>(
        init: ScoreAllController(),
        builder: (scoreController) {
          return Scaffold(
            body: Container(
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
                  const MaxScoreComponent(maxScrore: "100"),
                  const ContentComponent(),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(() => GrammarScoreAll(
                        scoreGames: scoreController.scoreGames.value,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
