import 'package:flutter/material.dart';
import 'package:vocabulary_learning/screens/my_topic/components/topic_section.dart';

import '../../colors.dart';

class MyTopicScreen extends StatelessWidget {
  const MyTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 212, 255, 247),
                  const Color(0xffFEEDFF).withOpacity(0.28),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 0.9])),
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Container(
                height: 90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kfirstGradientBack),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Stack(textDirection: TextDirection.ltr, children: [
                  const Positioned(
                      left: 5,
                      top: 20,
                      child: Text(
                        "Make your own topic",
                        style: TextStyle(
                            fontFamily: "PoetsenOne",
                            fontSize: 25,
                            color: kwhite,
                            decoration: TextDecoration.none),
                      )),
                  Positioned(
                      right: 0,
                      child: Image.asset(
                        'asset/images/note.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      )),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "My topic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kblack,
                        fontSize: 24,
                        fontFamily: "PoetsenOne",
                        decoration: TextDecoration.none),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: kOrangeGrammar,
                        elevation: 6,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: kwhite,
                        size: 25,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TopicSection(),
              const SizedBox(
                height: 12,
              ),
              TopicSection(),
            ])),
      ),
    );
  }
}
