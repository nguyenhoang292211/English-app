// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/vocabulary/detail_screen.dart';

class WordComponent extends StatelessWidget {
  const WordComponent(
      {Key? key,
      required this.size,
      required this.word,
      required this.goToFlashCard,
      required this.onPressToUnSave})
      : super(key: key);
  final size;
  final Vocabulary word;
  final VoidCallback goToFlashCard;
  final VoidCallback onPressToUnSave;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(VocabularyDetailScreen(
          vocabulary: word,
        ));
      },
      child: Container(
        height: 50,
        width: size.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: kmainPink, borderRadius: BorderRadius.circular(30)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${word.word}",
                style: const TextStyle(
                    color: kmainBrown,
                    fontFamily: kPoppins,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text("${word.mean}",
                  style: const TextStyle(
                      color: kmainBrown,
                      fontFamily: kPoppins,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: goToFlashCard,
                        child: const Image(
                          image:
                              AssetImage("./asset/images/flashcard_icon.png"),
                          fit: BoxFit.cover,
                          height: 31,
                          width: 31,
                        ),
                      ),
                      InkWell(
                        onTap: onPressToUnSave,
                        child: const Image(
                          image: AssetImage("./asset/images/Delete.png"),
                          fit: BoxFit.cover,
                          height: 31,
                          width: 31,
                        ),
                      )
                    ]),
              )
            ]),
      ),
    );
  }
}
