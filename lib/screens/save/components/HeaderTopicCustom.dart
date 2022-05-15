import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class HeaderTopicCustom extends StatelessWidget {
  const HeaderTopicCustom(
      {Key? key, required this.topic, required this.numberWord})
      : super(key: key);
  final String topic;
  final int numberWord;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 250,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("./asset/images/topicSave.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            topic,
            style: const TextStyle(
                color: kfirstGradientBack,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Column(
          children: [
            Text(
              "$numberWord words",
              style: const TextStyle(
                  color: kfirstGradientBack,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}
