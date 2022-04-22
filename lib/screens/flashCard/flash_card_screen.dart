import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard_view.dart';

// class FlashCard extends StatefulWidget {
//   FlashCard({Key? key}) : super(key: key);

//   @override
//   State<FlashCard> createState() => _FlashCardState();
// }

class FlashCard extends GetWidget<FlashCardController> {
  final flashCardCtrl = Get.find<FlashCardController>();

  final List<Vocabulary> _flashcards = [];

  int _currentIndex = 0;

  AnimatedContainer dotIndicator(index, currentIndex) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: (currentIndex < index) ? kYellowGrammar : kOrangeGrammar,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kGreenGrammar,
      body: Container(
          height: size.height,
          decoration: const BoxDecoration(color: kGreenGrammar),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 35,
                    child: Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: kred),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const Text("Flash card",
                            style: TextStyle(
                              color: kOrangeGrammar,
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
                          width: 300,
                          height: 300,
                          child: GetBuilder<FlashCardController>(
                              init: FlashCardController(),
                              builder: (fController) {
                                return Obx(() => FlipCard(
                                    front: FlashCardView(
                                      text: fController
                                              .listSelectedCard.isNotEmpty
                                          ? fController
                                              .listSelectedCard[flashCardCtrl
                                                  .currentIndex.value]
                                              .word!
                                          : "",
                                    ),
                                    back: FlashCardView(
                                      text: fController
                                              .listSelectedCard.isNotEmpty
                                          ? fController
                                              .listSelectedCard[flashCardCtrl
                                                  .currentIndex.value]
                                              .mean!
                                          : "",
                                    )));
                              })),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              flashCardCtrl.listSelectedCard.length,
                              (index) => Obx(() => dotIndicator(
                                  index, flashCardCtrl.currentIndex.value)))),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  //   Padding(
                  //       padding: const EdgeInsets.all(30.0),
                  //       child: GetBuilder<FlashCardController>(
                  //           init: FlashCardController(),
                  //           builder: (fController) {
                  //             return ListView(children: [
                  //               Row(
                  //                   children: <Widget>[dotIndicator(0, 0)]
                  //               // SecondaryButton(
                  //               //     text: "Prev",
                  //               //     width: 150,
                  //               //     onPressed: fController.setNextCard,
                  //               //     background: ksecondGradientBack),
                  //               // SecondaryButton(
                  //               //     text: "Next",
                  //               //     width: 150,
                  //               //     onPressed: fController.setNextCard,
                  //               //     background: kred),
                  //             )]);
                  //           })),
                  Wrap(
                      spacing:
                          20, // to apply margin in the main axis of the wrap
                      runSpacing:
                          20, // to apply margin in the cross axis of the wrap
                      children: <Widget>[
                        SecondaryButton(
                            text: "Prev",
                            width: 150,
                            onPressed: flashCardCtrl.setBackIndex,
                            background: ksecondGradientBack),
                        SecondaryButton(
                            text: "Next",
                            width: 150,
                            onPressed: flashCardCtrl.setNextCard,
                            background: kred),
                      ])
                  //   // ),
                ],
              ),
              Positioned(
                bottom: 5,
                right: -5,
                child: Container(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/tree2.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                bottom: 5,
                left: -5,
                child: Container(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/fence_onboard.png"),
                          fit: BoxFit.fill)),
                ),
              )
            ],
          )),
    );
  }

  Widget buildCard(int index) => Container(
        color: kGreenGrammar,
        width: 150,
        height: 150,
        child: Center(child: Text('$index')),
      );
}
