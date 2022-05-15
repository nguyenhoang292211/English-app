import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/customSnackBar.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/controllers/game_controller.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_all_vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';
import 'package:vocabulary_learning/screens/home/components/topic_background.dart';
import 'package:vocabulary_learning/screens/home/topic/components/navigation_button.dart';
import 'package:vocabulary_learning/screens/home/topic/components/vocabulary_flashcard_item.dart';
import 'package:vocabulary_learning/screens/home/topic/game/game_screen.dart';

class TopicScreen extends StatelessWidget {
  // final flashCardCtrl = Get.put<FlashCardController>(FlashCardController());
  final List<Vocabulary> vocabularies;
  final flashCardCtrl = Get.put<FlashCardController>(FlashCardController());
  final topicCtrl = Get.put<TopicController>(TopicController());

  TopicScreen({Key? key, required this.vocabularies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final learningCtrl = Get.put<LearningController>(LearningController());
    final gameCtrl = Get.put<GameController>(GameController());

    final size = MediaQuery.of(context).size;
    flashCardController.setVocabularies(vocabularies);
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
                  style: TextStyle(color: kblack, fontSize: 22, fontFamily: 'PoetsenOne'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${topicCtrl.topicSelected.name}',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
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
                  learningCtrl.gotoLearningScreen(topicCtrl.topicSelected.id);
                }),
            const SizedBox(
              height: 12,
            ),
            NavigationButton(
                image: "asset/images/game_icon.png",
                text: 'Game',
                background: const Color(0xffFAFC95),
                onClick: () {
                  gameCtrl.goToGameScreen();
                }),
            const SizedBox(
              height: 12,
            ),
            NavigationButton(
                image: "asset/images/flashcard_icon.png",
                text: 'Flash card',
                background: const Color(0xffAADB98),
                onClick: () {
                  Get.to(AllVocabulary());
            
                })
          ],
        ),
      ),
    );
  }

  Container renderFlashCards(Size size) {
    return Container(
      height: size.height * 0.42,
      child: Obx(() => Swiper(
            itemBuilder: (BuildContext context, int index) {
              return VocabFlashcardItem(
                vocabulary: vocabularies[index],
              );
            },
            itemCount: vocabularies.length,
            pagination: const SwiperPagination(
              alignment: Alignment.topRight,
              builder: SwiperPagination.fraction,
              margin: EdgeInsets.only(
                top: 20,
                right: 25,
              ),
            ),
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.87,
            scale: 0.6,
            itemHeight: size.height * 0.33,
          )),
    );
  }
}
