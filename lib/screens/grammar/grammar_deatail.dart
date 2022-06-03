import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/models/grammar.dart';
import 'package:vocabulary_learning/screens/grammar/components/button_detail.dart';
import 'package:vocabulary_learning/screens/grammar/components/header_grammar.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';
import 'package:vocabulary_learning/screens/question/question_screen.dart';

class GrammarDetail extends StatelessWidget {
  const GrammarDetail({Key? key, required this.grammar}) : super(key: key);
  final Grammar grammar;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topicController =
        Get.put<QuestionGrammarController>(QuestionGrammarController());
    return Scaffold(
      body: GetBuilder<GrammarController>(
          init: GrammarController(),
          builder: (grammarController) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(color: kfirstGradientBack),
                ),
                Positioned(
                  top: 20,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  child: HeaderGrammar(
                      headerString: grammar.title.toString(),
                      goBack: () {
                        Get.off(GrammarAllScreen());
                      }),
                ),
                Positioned(
                  top: size.height * 0.2,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.2,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Text(
                            grammar.document.toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins', fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: size.height * 0.05,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: ButtonDetail(
                      title: "Start test",
                      onPress: () {
                        Get.to(const QuestionScreen());
                      },
                      color: kmainBrown,
                    )),
                Positioned(
                  bottom: size.height * 0.05,
                  left: size.width * 0.05,
                  child: const Image(
                    image: AssetImage("./asset/images/fox_tree.png"),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
