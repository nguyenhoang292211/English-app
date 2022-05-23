import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/screens/question/components/HeaderQuestion.dart';
import 'package:vocabulary_learning/screens/question/components/process_bar.dart';
import 'package:vocabulary_learning/screens/question/components/question_card.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  final String skip = "Skip";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    QuestionGrammarController questionGrammarController =
        Get.put(QuestionGrammarController());
    return Scaffold(
        backgroundColor: kNudeQuestion,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const HeaderQuestion(),
              const ProcessBar(),
              Obx(
                () => Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: const NeverScrollableScrollPhysics(),
                    controller: questionGrammarController.pageController,
                    itemCount: questionGrammarController.lQuestion.length,
                    onPageChanged:
                        questionGrammarController.updateNumberQuestion,
                    itemBuilder: (context, index) => QuestionCard(
                      questionGrammar:
                          questionGrammarController.lQuestion[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
