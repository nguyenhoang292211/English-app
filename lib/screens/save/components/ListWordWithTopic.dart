import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/save/SaveController.dart';
import 'package:vocabulary_learning/screens/save/components/HeaderTopicCustom.dart';
import 'package:vocabulary_learning/screens/save/components/WordComponent.dart';

class ListWordWithTopic extends StatelessWidget {
  ListWordWithTopic({Key? key, required this.topicName, required this.words})
      : super(key: key);
  String topicName;
  List<Vocabulary> words;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SaveController saveController = Get.put(SaveController());
    return Column(
      children: [
        HeaderTopicCustom(topic: topicName, numberWord: words.length),
        ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: words.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (BuildContext context, int index) {
              return WordComponent(
                size: size,
                word: words[index],
                onPressToUnSave: () {
                  saveController.onPressSave(words[index].id.toString());
                },
                goToFlashCard: () {},
              );
            })
      ],
    );
  }
}
