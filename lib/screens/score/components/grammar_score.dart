import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/screens/score/components/score_component.dart';

class GrammarScoreAll extends StatelessWidget {
  const GrammarScoreAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        width: size.width * 0.95,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlueGray, borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(10),
          width: size.width * 0.85,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Text(
              'Grammar:',
              style: TextStyle(fontSize: 20, fontFamily: kPoetsenOne),
            ),
            ScoreComponent(
                onPress: () {}, title: "title", score: "score", date: "date"),
            ScoreComponent(
                onPress: () {}, title: "title", score: "score", date: "date"),
            ScoreComponent(
                onPress: () {}, title: "title", score: "score", date: "date"),
            ScoreComponent(
                onPress: () {}, title: "title", score: "score", date: "date")
          ]),
        ),
      ),
    );
  }
}
