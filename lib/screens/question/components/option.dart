import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';

class option extends StatelessWidget {
  const option({
    Key? key,
    required this.text,
    required this.id,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final int id;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionGrammarController>(
        init: QuestionGrammarController(),
        builder: (qController) {
          Color getRightColor() {
            if (qController.isAnswer) {
              if (qController.correctAns == id) {
                return kGreenGrammar;
              } else if (qController.selectedAns == id &&
                  qController.correctAns != qController.selectedAns) {
                return kPinkGrammar;
              }
              return kmainBrown;
            }
            return kmainBrown;
          }

          Icon getRightIcon() {
            if (getRightColor() == kGreenGrammar)
              return Icon(
                Icons.done,
                color: Colors.white,
                size: 16,
              );
            else
              return Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              );
          }

          return InkWell(
            onTap: onPress,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: getRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${id + 1}. ${text}",
                    style: TextStyle(color: getRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: getRightColor() == kNudeGrammar
                            ? Colors.transparent
                            : getRightColor(),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: getRightColor(), width: 2)),
                    child:
                        getRightColor() == kmainBrown ? null : getRightIcon(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
