import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/topic.dart';
import 'package:vocabulary_learning/screens/home/topic/topic_screen.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;
  final Color color;
  final Function onTap;
  const TopicCard(
      {Key? key, required this.topic, required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 8, bottom: 6),
            child: Container(
                height: size.height * 0.5,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: const Color.fromARGB(64, 160, 46, 46)
                            .withOpacity(0.3),
                        offset: const Offset(3, 3),
                      )
                    ])),
          )),
          Positioned(
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color.fromARGB(106, 66, 59, 59),
                      offset: Offset(3, 3),
                    )
                  ]),
              child: Image.network(
                topic.image ?? "",
                width: size.width * 0.3,
                height: size.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: size.width * 0.05,
              width: size.width * 0.5,
              child: Text("${topic.name}",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                      fontFamily: "PoetsenOne", fontSize: 20, color: kblack)))
        ],
      ),
    );
  }
}
