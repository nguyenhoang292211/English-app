import 'package:flutter/material.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/save/components/HeaderTopicCustom.dart';
import 'package:vocabulary_learning/screens/save/components/WordComponent.dart';

class ListWordWithTopic extends StatelessWidget {
  const ListWordWithTopic(
      {Key? key, required this.topicName, required this.words})
      : super(key: key);
  final String topicName;
  final List<Vocabulary> words;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              return WordComponent(size: size, word: words[index]);
            })
      ],
    );
  }
}
