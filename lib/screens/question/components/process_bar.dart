import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';

class ProcessBar extends StatelessWidget {
  const ProcessBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: kGreenGrammar.withOpacity(0.5), width: 2),
            borderRadius: BorderRadius.circular(50)
           ),
          child: GetBuilder<QuestionGrammarController>(
            init: QuestionGrammarController(),
            builder: (controller) {
              return Stack(
                children: [
                  LayoutBuilder(builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration (
                      //gradient: kPrimaryGradient,
                      color: kGreenGrammar,
                      borderRadius: BorderRadius.circular(50)
                    ),
                  )),
                  Positioned.fill(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("${(controller.animation.value * 60).round()} sec", style: TextStyle(color: kfirstGradientBack, fontWeight: FontWeight.bold, fontFamily: "PoetsenOne"),),
                     Icon(Icons.history_rounded, size: 18,)
                    ],),
                  ))
                ],
              );
            })
          );
  }
}