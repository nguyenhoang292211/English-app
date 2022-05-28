// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/vocabulary/components/action_image.dart';
import 'package:vocabulary_learning/screens/vocabulary/components/body_detail.dart';
import 'package:vocabulary_learning/screens/vocabulary/components/header.dart';
import 'package:vocabulary_learning/screens/vocabulary/vocabulary_controller.dart';

class VocabularyDetailScreen extends StatelessWidget {
  VocabularyDetailScreen({Key? key, required this.vocabulary})
      : super(key: key);
  Vocabulary vocabulary;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7FCE9),
      body: GetBuilder<VocabularyController>(
          init: VocabularyController(),
          builder: (vocalController) => ListView(
                children: [
                  HeaderDetailVocabulary(onBack: () {
                    Get.back();
                  }),
                  ActionImage(vocabulary: vocabulary),
                  BodyDetail(vocabulary: vocabulary)
                ],
              )),
    );
  }
}
