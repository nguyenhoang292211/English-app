import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/screens/score/components/score_component.dart';

class VocabularyScoreAll extends StatelessWidget {
  const VocabularyScoreAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Center(
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
                  'Vocabulary:',
                  style: TextStyle(fontSize: 20, fontFamily: kPoetsenOne),
                ),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                ScoreComponent(
                    onPress: () {},
                    title: "title",
                    score: "score",
                    date: "date"),
                SizedBox(
                  height: 180,
                )
              ]),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image(
            image: AssetImage("asset/images/tree2.png"),
            height: 175,
          ),
        ),
      ],
    );
  }
}
