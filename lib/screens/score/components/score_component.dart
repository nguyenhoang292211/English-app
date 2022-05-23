import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';

class ScoreComponent extends StatelessWidget {
  const ScoreComponent(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.score,
      required this.date})
      : super(key: key);
  final VoidCallback onPress;
  final String title;
  final String score;
  final String date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$title: $score score",
                  style: TextStyle(fontFamily: kPoetsenOne, fontSize: 15),
                ),
                Text("${date}",
                    style: TextStyle(fontFamily: kPoetsenOne, fontSize: 15))
              ],
            ),
            Container(
              height: 2,
              width: size.width * 0.8,
              decoration: BoxDecoration(color: kBlueLine),
            )
          ],
        ),
      ),
    );
  }
}
