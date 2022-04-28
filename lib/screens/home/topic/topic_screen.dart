import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';
import 'package:vocabulary_learning/screens/home/components/topic_background.dart';
import 'package:vocabulary_learning/screens/home/topic/components/navigation_button.dart';
import 'package:vocabulary_learning/screens/home/topic/components/vocabulary_flashcard_item.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/learning_screen.dart';
import 'package:vocabulary_learning/screens/question/question_screen.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen({Key? key}) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TopicBackground(
      child: Padding(
        padding: const EdgeInsets.only(top: 45, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: kgrayTitleButton,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Topic:',
                  style: TextStyle(
                      color: kblack, fontSize: 22, fontFamily: 'PoetsenOne'),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Animal',
                  style: TextStyle(
                    color: kmainBrown,
                    fontSize: 27,
                    fontFamily: 'PoetsenOne',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            renderFlashCards(size),
            const SizedBox(
              height: 25,
            ),
            NavigationButton(
                image: "asset/images/learn_icon.png",
                text: 'Learning',
                background: const Color(0xffF8C7BD),
                onClick: () {
                  Get.to(const LearningScreen());
                }),
            const SizedBox(
              height: 12,
            ),
            NavigationButton(
                image: "asset/images/game_icon.png",
                text: 'Game',
                background: const Color(0xffFAFC95),
                onClick: () {
                  Get.to(GrammarAllScreen());
                }),
            const SizedBox(
              height: 12,
            ),
            NavigationButton(
                image: "asset/images/flashcard_icon.png",
                text: 'Flash card',
                background: const Color(0xffAADB98),
                onClick: () {
                  Get.to(FlashCard());
                })
          ],
        ),
      ),
    );
  }

  Container renderFlashCards(Size size) {
    return Container(
      height: size.height * 0.42,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return const VocabFlashcardItem();
        },
        itemCount: 5,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter, builder: SwiperPagination.dots),
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.87,
        scale: 0.6,
        itemHeight: size.height * 0.33,
      ),
    );
  }
}
