import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';

class MaxScoreComponent extends StatelessWidget {
  const MaxScoreComponent({Key? key, required this.maxScrore})
      : super(key: key);
  final String maxScrore;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'max score',
          style: TextStyle(
              fontFamily: kPoetsenOne, fontSize: 20, color: Colors.black),
        ),
        Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kBlue, borderRadius: BorderRadius.circular(100)),
            child: Text(
              maxScrore,
              style: TextStyle(
                  fontFamily: kPoetsenOne, fontSize: 40, color: Colors.black),
            )),
      ],
    );
  }
}
