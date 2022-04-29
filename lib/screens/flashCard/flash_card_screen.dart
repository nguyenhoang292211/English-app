import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
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
  final flashCardCtrl = Get.put(FlashCardController());

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
    flashCardCtrl.resetData();
    SwiperController swiperController = SwiperController();
    return Scaffold(
        backgroundColor: kGreenGrammar,
        body: GetBuilder<FlashCardController>(
            init: FlashCardController(),
            builder: (flashCardCtrl) {
              return Container(
                  padding: EdgeInsets.only(top: 10),
                  height: size.height,
                  decoration: const BoxDecoration(color: kGreenGrammar),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: kOrangeGrammar),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                const Text("Flash card",
                                    style: TextStyle(
                                      color: kOrangeGrammar,
                                      fontSize: 30,
                                      fontFamily: "PoetsenOne",
                                    ),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          flashCardCtrl.currentIndex.value ==
                                  flashCardCtrl.listSelectedCard.length
                              ? Container(
                                  height: size.height * 0.8,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color:
                                              kgrayTitleButton.withOpacity(0.5),
                                          offset: const Offset(3, 3),
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      flashCardCtrl.quantityStudyAgainWord > 0
                                          ? SecondaryButton(
                                              text:
                                                  "Study ${flashCardCtrl.quantityStudyAgainWord} word again",
                                              width: size.width * 0.7,
                                              onPressed: () {
                                                flashCardCtrl.studyAgain();
                                              },
                                              background: kGreenFlashCard,
                                            )
                                          : const Text(
                                              "Congratulations! You have finished everything!"),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SecondaryButton(
                                        text: "Study all again",
                                        width: size.width * 0.7,
                                        onPressed: () {
                                          flashCardCtrl.resetData();
                                        },
                                        background: kred,
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  height: size.height * 0.5,
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FlipCard(
                                          back: FlashCardViewBackSide(
                                            vocabulary: flashCardCtrl
                                                .listSelectedCard[index],
                                            state:
                                                flashCardCtrl.listState[index],
                                          ),
                                          front: FlashCardViewFrontSide(
                                            vocabulary: flashCardCtrl
                                                .listSelectedCard[index],
                                            state:
                                                flashCardCtrl.listState[index],
                                          ));
                                    },
                                    itemCount:
                                        flashCardCtrl.listSelectedCard.length,
                                    pagination: const SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                          color: kwhite,
                                          activeColor: ksecondGradientBack),
                                    ),
                                    itemWidth: size.width * 0.8,
                                    itemHeight: size.height * 0.4,
                                    controller: swiperController,
                                    onIndexChanged: (value) {
                                      flashCardCtrl.setIndex(value);
                                    },
                                    loop: false,
                                    viewportFraction: 0.6,
                                    scale: 0.9,
                                    layout: SwiperLayout.TINDER,
                                  ),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          !flashCardCtrl.isLastIndex()
                              ? Wrap(
                                  spacing:
                                      20, // to apply margin in the main axis of the wrap
                                  runSpacing:
                                      20, // to apply margin in the cross axis of the wrap
                                  children: <Widget>[
                                      SecondaryButton(
                                          text: "Study again",
                                          width: size.width * 0.8,
                                          onPressed: () {
                                            flashCardCtrl.updateState(
                                                CardState.studyAgain);
                                            swiperController.next();
                                          },
                                          background: kred),
                                      SecondaryButton(
                                          text: "Next",
                                          width: size.width * 0.8,
                                          onPressed: () {
                                            flashCardCtrl
                                                .updateState(CardState.gotIt);
                                            swiperController.next();
                                          },
                                          background: ksecondGradientBack),
                                    ])
                              : SizedBox(
                                  height: 1,
                                )
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
                                  image: AssetImage(
                                      "asset/images/fence_onboard.png"),
                                  fit: BoxFit.fill)),
                        ),
                      )
                    ],
                  ));
            }));
  }

  Widget buildCard(int index) => Container(
        color: kGreenGrammar,
        width: 150,
        height: 150,
        child: Center(child: Text('$index')),
      );
}
