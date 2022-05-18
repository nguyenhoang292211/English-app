// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:vocabulary_learning/screens/save/SaveController.dart';
import 'package:vocabulary_learning/screens/save/components/Header.dart';
import 'package:vocabulary_learning/screens/save/components/ListWordWithTopic.dart';
import 'package:get/get.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaveController>(
        init: SaveController(),
        builder: (saveController) {
          return ListView(children: [
            Obx(
              () => HeaderSave(
                numberTopics: '5',
                numberWords:
                    "${saveController.userModel.value.savedVocabs != null ? saveController.userModel.value.savedVocabs!.length : 0}",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {},
                child: Obx(() => ListWordWithTopic(
                    topicName: "Vocabularys",
                    words: saveController.vocabularys.value)))
          ]);
        });
  }
}
