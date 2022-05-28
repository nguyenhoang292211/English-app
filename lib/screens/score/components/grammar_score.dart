// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/models/score_grammar.dart';
import 'package:vocabulary_learning/screens/score/components/score_component.dart';
import 'package:vocabulary_learning/screens/score/detail/grammars/grammar_detail_score.dart';
import 'package:vocabulary_learning/utils/utils.dart';

class GrammarScoreAll extends StatelessWidget {
  GrammarScoreAll({Key? key, required this.scoreGames}) : super(key: key);
  List<ScoreGame> scoreGames;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size.width * 0.95,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlueGray, borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: size.width * 0.85,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            const Text(
              'Grammar:',
              style: TextStyle(fontSize: 20, fontFamily: kPoetsenOne),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: scoreGames.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemBuilder: (BuildContext context, int index) {
                return (ScoreComponent(
                    onPress: () {
                      Get.to(GrammarDetailScore(
                          questions: scoreGames[index].questions?.toList(),
                          corrects: scoreGames[index].corrects?.toList(),
                          grammarId: scoreGames[index].idContest));
                    },
                    title: "${scoreGames[index].title}",
                    score: getScore(scoreGames[index].corrects ?? []),
                    date: dateFormDatetime(
                        scoreGames[index].updatedAt ?? DateTime.now())));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
