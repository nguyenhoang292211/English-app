import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/models/grammar.dart';
import 'package:vocabulary_learning/models/question_grammar.dart';
import 'package:vocabulary_learning/screens/grammar/components/SearchComponent.dart';
import 'package:vocabulary_learning/screens/grammar/components/grammar_component.dart';
import 'package:vocabulary_learning/screens/grammar/components/winner_component.dart';

class GrammarAllScreen extends StatefulWidget {
  const GrammarAllScreen({Key? key}) : super(key: key);

  @override
  State<GrammarAllScreen> createState() => _GrammarAllScreenState();
}

class _GrammarAllScreenState extends State<GrammarAllScreen> {
  String query = "";
  late List<Grammar> lGrammar;
  late List<Grammar> lGrammarSearch;

  @override
  Widget build(BuildContext context) {
    // GrammarController grammarController = Get.put(GrammarController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE7FCE9),
      body: SafeArea(
        // decoration: BoxDecoration(color: Color(0xFFE7FCE9)),
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GetBuilder<GrammarController>(
              init: GrammarController(),
              builder: (gController) {
                return ListView(
                  children: [
                    WinnerComponent(size: size),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchComponent(
                        onChanged: gController.searchGrammar, text: query),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: gController.grammarsSearch.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemBuilder: (BuildContext context, int index) {
                            return GrammarComponent(
                                grammar: gController.grammarsSearch[index],
                                color: gController.getColorByIndex(index),
                                onPress: () {
                                  gController.goToDetailGrammar(
                                      gController.grammarsSearch[index]);
                                });
                          },
                        )),
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   physics: ScrollPhysics(),
                    //   itemCount: gController.grammars.length,
                    //   gridDelegate:
                    //       const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 2,
                    //           mainAxisSpacing: 20,
                    //           crossAxisSpacing: 20),
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return GrammarComponent(grammar: gController.grammars[index], color: gController.getColorByIndex(index), onPress: () {gController.goToDetailGrammar(gController.grammars[index]);});
                    //   },
                    // )
                  ],
                );
              },
            )),
      ),
    );
  }

  void searchTopic(query) {}
}
