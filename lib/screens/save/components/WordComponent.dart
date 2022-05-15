import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class WordComponent extends StatelessWidget {
  const WordComponent({Key? key, required this.size, required this.word})
      : super(key: key);
  final size;
  final Vocabulary word;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: kmainPink, borderRadius: BorderRadius.circular(30)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${word.word}",
              style: TextStyle(
                  color: kmainBrown,
                  fontFamily: kPoppins,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text("${word.mean}",
                style: TextStyle(
                    color: kmainBrown,
                    fontFamily: kPoppins,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                      image: AssetImage("./asset/images/flashcard_icon.png"),
                      fit: BoxFit.cover,
                      height: 31,
                      width: 31,
                    ),
                    Image(
                      image: AssetImage("./asset/images/Delete.png"),
                      fit: BoxFit.cover,
                      height: 31,
                      width: 31,
                    )
                  ]),
            )
          ]),
    );
  }
}
