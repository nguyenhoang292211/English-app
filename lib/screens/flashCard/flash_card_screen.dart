import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
// import 'package:vocabulary_learning/constants/controllers.dart';
// import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard_view.dart';

class FlashCard extends GetWidget<FlashCardController> {
  final List<Vocabulary> _flashcards = [];
  int _currentIndex = 0;

  FlashCard();

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
    final flashCardCtrl = Get.put(FlashCardController());
    flashCardCtrl.resetData();
    SwiperController swiperController = SwiperController(); //Control swipe scroll

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffE7FCE9),
          body: GetBuilder<FlashCardController>(
              init: FlashCardController(),
              builder: (flashCardCtrl) {
                return Container(
                    padding: const EdgeInsets.only(top: 3),
                    height: size.height,
                    decoration: const BoxDecoration(color: Color(0xffE7FCE9)),
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios, color: kmainBrown),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                  ),
                                  const Text("Flash card",
                                      style: TextStyle(
                                        color: kmainBrown,
                                        fontSize: 30,
                                        fontFamily: "PoetsenOne",
                                      ),
                                      textAlign: TextAlign.center),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            flashCardCtrl.currentIndex.value == flashCardCtrl.listSelectedCard.length
                                ? Container(
                                    height: size.height * 0.8,
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(15), boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: kgrayTitleButton.withOpacity(0.5),
                                        offset: const Offset(3, 3),
                                      )
                                    ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        flashCardCtrl.quantityStudyAgainWord > 0
                                            ? SecondaryButton(
                                                text: "Study ${flashCardCtrl.quantityStudyAgainWord} word again",
                                                width: size.width * 0.7,
                                                onPressed: () {
                                                  flashCardCtrl.studyAgain();
                                                },
                                                background: kfirstGradientBack,
                                              )
                                            : const Text(
                                                "Congratulations! You have finished everything!",
                                                textAlign: TextAlign.center,
                                                maxLines: 4,
                                              ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SecondaryButton(
                                          text: "Study all again",
                                          width: size.width * 0.7,
                                          onPressed: () {
                                            flashCardCtrl.resetData();
                                          },
                                          background: kConfirmText,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    child: SizedBox(
                                      width: size.width ,
                                      height:  size.height * 0.64,
                                      child: Swiper(
                                        // layout: SwiperLayout.TINDER,

                                        itemBuilder: (BuildContext context, int index) {
                                          return FlipCard(
                                              front: FlashCardViewBackSide(
                                                vocabulary: flashCardCtrl.listSelectedCard[index],
                                                state: flashCardCtrl.listState[index],
                                              ),
                                              back: FlashCardViewFrontSide(
                                                vocabulary: flashCardCtrl.listSelectedCard[index],
                                                state: flashCardCtrl.listState[index],
                                              ));
                                        },
                                        itemCount: flashCardCtrl.listSelectedCard.length,
                                        pagination: const SwiperPagination(
                                          alignment: Alignment.bottomCenter,
                                          builder: DotSwiperPaginationBuilder(color: kwhite, activeColor: ksecondGradientBack),
                                        ),
                                        itemWidth: size.width * 0.8,
                                        itemHeight: size.height * 0.6,
                                        controller: swiperController,
                                        onIndexChanged: (value) {
                                          flashCardCtrl.setIndex(value);
                                        },
                                        loop: false,
                                        viewportFraction: 0.7,
                                        scale: 0.9,
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            !flashCardCtrl.isLastIndex()
                                ? Wrap(
                                    spacing: 20, // to apply margin in the main axis of the wrap
                                    runSpacing: 20, // to apply margin in the cross axis of the wrap
                                    children: <Widget>[
                                        SecondaryButton(
                                            text: "Study again",
                                            width: size.width * 0.8,
                                            onPressed: () {
                                              flashCardCtrl.updateState(CardState.studyAgain);
                                              swiperController.next();
                                            },
                                            background: kfirstGradientBack),
                                        SecondaryButton(
                                            text: "Next",
                                            width: size.width * 0.8,
                                            onPressed: () {
                                              flashCardCtrl.updateState(CardState.gotIt);
                                              swiperController.next();
                                            },
                                            background: const Color(0xffAADB98)),
                                      ])
                                : const SizedBox(
                                    height: 1,
                                  )
                            //   // ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 5,
                          child: Container(
                            height: size.width * 0.35,
                            width: size.width * 0.3,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/tree2.png"), fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: 2,
                          child: Container(
                            height: size.width * 0.25,
                            width: size.width * 0.5,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/sleep.png"), fit: BoxFit.cover)),
                          ),
                        )
                      ],
                    ));
              })),
    );
  }
}
