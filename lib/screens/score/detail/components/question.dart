import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';

class QuestionAnswer extends StatelessWidget {
  const QuestionAnswer(
      {Key? key,
      required this.question,
      required this.isCorrest,
      required this.onPress})
      : super(key: key);
  final String question;
  final bool isCorrest;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        alignment: Alignment.center,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            color: isCorrest ? kScoreScreen : kRedBackground,
            border: Border.all(
                color: isCorrest ? kGreenBold : kCancelText, width: 4),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width * 0.8,
                child: Text(
                  question,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: kPoppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                image: AssetImage(
                    isCorrest ? "asset/images/tick.png" : "asset/images/x.png"),
                height: 35,
              )
            ]),
      ),
    );
  }
}
