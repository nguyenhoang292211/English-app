import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart' as colors;
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
import 'package:vocabulary_learning/screens/flashCard/circle_process_item.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard_view.dart';
import 'package:vocabulary_learning/colors.dart';
class FlashCard extends StatefulWidget {
  FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghostbusters!"),
    Flashcard(
        question: "Who teaches you how to write sexy code?",
        answer: "Ya boi Kilo Loco!")
  ];

  int _currentIndex = 0;

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.kGreenGrammar,
      body: Container(
          height: size.height,
          decoration:
              BoxDecoration(color: colors.kGreenGrammar),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 35,
                child: Wrap(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: colors.kred),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text("Flash card",
                        style: TextStyle(
                          color: colors.kOrangeGrammar,
                          fontSize: 30,
                          fontFamily: "PoetsenOne",
                        ),
                        textAlign: TextAlign.center)
                  ],
                  alignment: WrapAlignment.spaceAround,
                ),
              ),
              const SizedBox(height: 20),
              // Center(
              //   child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      height: 250,
                      child: FlipCard(
                          front: FlashCardView(
                            text: _flashcards[_currentIndex].question,
                          ),
                          back: FlashCardView(
                            text: _flashcards[_currentIndex].answer,
                          ))),
                      
                ],
              ),
              SecondaryButton(
                  text: "Prev",
                  width: 150,
                  onPressed: showPreviousCard,
                  background: ksecondGradientBack),
              SecondaryButton(
                  text: "Next",
                  width: 150,
                  onPressed: showNextCard,
                  background: kred),
             

              // ),
             
            ],
          )),
    );
  }

  Widget buildCard(int index) => Container(
        color: colors.AppColor.greenPastelBackground,
        width: 150,
        height: 150,
        child: Center(child: Text('$index')),
      );
}
