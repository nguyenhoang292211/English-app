import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/models/learning.dart';

class QuestionSection extends StatelessWidget {
  final Learning learning;

  QuestionSection({Key? key, required this.learning}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: kblack.withOpacity(0.25),
                      offset: const Offset(4, 4),
                    )
                  ]),
              alignment: Alignment.center,
              child: Text(learning.question,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      color: kgrayTitleButton,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 20,
            ),
            renderAnswerItem(context, learning.answers[0]),
            renderAnswerItem(context, learning.answers[1]),
            renderAnswerItem(context, learning.answers[2]),
            renderAnswerItem(context, learning.answers[3]),
          ],
        ),
      ),
    );
  }

  Container renderAnswerItem(BuildContext context, Answer answer) {
    final size = MediaQuery.of(context).size;
    AlertDialog alertDialog = AlertDialog(
      scrollable: true,
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: learning.rightAnswer != answer.orderNum
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffFFF7CA)),
              width: size.width * 0.85,
              height: size.height * 0.65,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'asset/images/wrong.png',
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          "Opp!\n You are wrong",
                          style: TextStyle(
                              color: kred,
                              fontSize: 20,
                              fontFamily: "PoetsenOne"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Right answer",
                      style: TextStyle(
                          color: kblack,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${learning.answers[learning.rightAnswer].content} : ${learning.answers[learning.rightAnswer].translate}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 55, 226, 2),
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Translate",
                      style: TextStyle(
                          color: kblack,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      learning.explaination,
                      style: const TextStyle(
                          color: kgrayTitleButton,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Your answer",
                      style: TextStyle(
                          color: kblack,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${answer.content} : ${answer.translate}',
                      style: const TextStyle(
                          color: kred,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffFFF7CA)),
              width: size.width * 0.7,
              child: Row(
                children: [
                  Image.asset(
                    'asset/images/right.png',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "Right! Good job",
                    style: TextStyle(
                        color: Color(0xff04BF00),
                        fontSize: 18,
                        fontFamily: "PoetsenOne"),
                  )
                ],
              ),
            ),
    );

    return Container(
      child: GetBuilder<LearningController>(
        init: LearningController(),
        builder: (learningCtrl) {
          return InkWell(
            hoverColor: const Color(0xff87ff89),
            onTap: () {
              showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => alertDialog);
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xff1DCE00)),
                  color: Colors.transparent),
              alignment: Alignment.center,
              child: Text(answer.content,
                  style: const TextStyle(
                      color: kfirstGradientBack,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
            ),
          );
        },
      ),
    );
  }
}
