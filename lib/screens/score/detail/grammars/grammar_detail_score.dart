import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/screens/grammar/components/button_detail.dart';
import 'package:vocabulary_learning/screens/score/detail/components/question.dart';

class GrammarDetailScore extends StatelessWidget {
  const GrammarDetailScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 241, 255, 179),
                Color.fromARGB(255, 242, 255, 207),
                Color.fromARGB(255, 210, 255, 206),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.45, 0.9])),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemBuilder: (BuildContext context, int index) {
              return (QuestionAnswer(
                  isCorrest: false,
                  question: "Ngoc yen de thuong!",
                  onPress: () {}));
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonDetail(
              title: "play again",
              onPress: () {},
              color: kBlueLine,
            ),
          )
        ],
      ),
    )));
  }
}
