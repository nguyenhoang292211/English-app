import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/models/learning.dart';

class WarSection extends StatelessWidget {
  final Learning learning;

  WarSection({Key? key, required this.learning}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(15), boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: kblack.withOpacity(0.25),
                  offset: const Offset(4, 4),
                )
              ]),
              alignment: Alignment.center,
              child: Text(learning.question, overflow: TextOverflow.clip, style: const TextStyle(color: kgrayTitleButton, fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 20,
            ),
            renderAnswerItem(context, learning.answers[0]),
            renderRightAnswerItem(context, learning.answers[1]),
            renderAnswerItem(context, learning.answers[2]),
            renderAnswerItem(context, learning.answers[3]),
          ],
        ),
      ),
    );
  }

  Container renderAnswerItem(BuildContext context, Answer answer) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: GetBuilder<LearningController>(
        init: LearningController(),
        builder: (learningCtrl) {
          return InkWell(
            hoverColor: const Color(0xff87ff89),
            onTap: () {
              // showDialog<String>(
              //     barrierDismissible: false,
              //     context: context,
              //     builder: (BuildContext context) => alertDialog);
              if (learning.rightAnswer == answer.orderNum) {
                learningCtrl.correctAnswer++;
              }
              learningCtrl.switchPage(context);

              // Navigator.of(context, rootNavigator: true).pop(alertDialog);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 60,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: const Color(0xff1DCE00)), color: Colors.transparent),
              alignment: Alignment.center,
              child: Text(answer.content, style: const TextStyle(color: kfirstGradientBack, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
            ),
          );
        },
      ),
    );
  }

  Container renderRightAnswerItem(BuildContext context, Answer answer) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: GetBuilder<LearningController>(
        init: LearningController(),
        builder: (learningCtrl) {
          return InkWell(
            hoverColor: const Color(0xff87ff89),
            onTap: () {
              // showDialog<String>(
              //     barrierDismissible: false,
              //     context: context,
              //     builder: (BuildContext context) => alertDialog);
              if (learning.rightAnswer == answer.orderNum) {
                learningCtrl.correctAnswer++;
              }
              learningCtrl.switchPage(context);

              // Navigator.of(context, rootNavigator: true).pop(alertDialog);
            },
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: const Color(0xff1DCE00)), color: const Color(0xff1DCE00)),
                alignment: Alignment.center,
                child: Text(answer.content, style: const TextStyle(color: kfirstGradientBack, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: CircleAvatar(radius: 20, backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: CircleAvatar(radius: 20, backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')),
              ),
            ]),
          );
        },
      ),
    );
  }
}
