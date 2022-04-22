import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/screens/grammar/components/button_detail.dart';
import 'package:vocabulary_learning/screens/grammar/components/header_grammar.dart';

class GrammarDetail extends StatelessWidget {
  const GrammarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  GrammarController grammarController = Get.put(GrammarController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<GrammarController>(
          init: GrammarController(),
          builder: (grammarController) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: kfirstGradientBack),
                ),
                Positioned(
                  top: 0,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  child: HeaderGrammar(
                      headerString:
                          grammarController.grammarSelected.title.toString(),
                      goBack: () {
                        Get.back();
                      }),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  bottom: size.height * 0.2,
                  child: SingleChildScrollView(

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Text(
                            grammarController.grammarSelected.document.toString(),
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height*0.05,
                   left: size.width * 0.05,
                  right: size.width * 0.05,
                  child: ButtonDetail(title: "Start test")),
                 Positioned(
            bottom: size.height*0.05,
            left: size.width*0.05,
            child: Image(
              image: AssetImage("./asset/images/fox_tree.png"),
              ),
          ),
                
              ],
            );
          }),
    );
  }
}
