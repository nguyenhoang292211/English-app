// ignore_for_file: unnecessary_const

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/screens/home/components/grammar_home.dart';
import 'package:vocabulary_learning/screens/home/components/topic_card.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../models/topic.dart';

// ignore: unnecessary_new
const List topic = [
  {
    "name": "Animal",
    "color": Color.fromARGB(255, 243, 223, 152),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  },
  {
    "name": "Animal",
    "color": Color.fromARGB(248, 245, 180, 180),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  },
  {
    "name": "Animal",
    "color": Color.fromARGB(255, 185, 208, 218),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  },
  {
    "name": "Animal",
    "color": Color.fromARGB(255, 218, 182, 106),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  },
  {
    "name": "Animal",
    "color": Color.fromARGB(255, 159, 206, 145),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  },
  {
    "name": "Animal",
    "color": Color.fromARGB(255, 163, 165, 196),
    "image": 'asset/images/elephant.png',
    "id": "acb"
  }
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final topicController = Get.put<TopicController>(TopicController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 241, 255, 179),
                    const Color.fromARGB(255, 242, 255, 207),
                    const Color.fromARGB(255, 109, 252, 96).withOpacity(0.28),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.2, 0.45, 0.9])),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good morning,",
                        style: TextStyle(
                          fontFamily: "PoetsenOne",
                          fontSize: 27,
                          color: kblack,
                        ),
                      ),
                      Text("Helen",
                          style: TextStyle(
                              fontFamily: "PoetsenOne",
                              fontSize: 32,
                              color: kmainOrange))
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.greenAccent[400],
                    child: const Text(
                      'HN',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Poppins"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Stack(
                children: [
                  Positioned(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 10, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      height: 100,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 255, 143),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: const Color.fromARGB(255, 80, 78, 78)
                                  .withOpacity(0.2),
                              offset: const Offset(2, 3),
                            )
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Vocabulary",
                                style: TextStyle(
                                    fontFamily: "PoetsenOne",
                                    fontSize: 27,
                                    color: kblack)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Everyday with 30min to know new\n words",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    color: kblack,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ),
                  )),
                  Positioned(
                    right: -5,
                    top: 0,
                    child: Image.asset(
                      'asset/images/fox_home.png',
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              vocabularySection(size, context),
              const SizedBox(
                height: 25,
              ),
              const GrammarHome()
            ],
          )),
    );
  }

  Column vocabularySection(Size size, BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "Topics",
            style: TextStyle(
              fontFamily: "PoetsenOne",
              fontSize: 27,
              color: kmainBrown,
            ),
          ),
          Text(
            "Show all >",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: kmainBrown,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      SizedBox(
        height: size.height * 0.44,
        child: Obx(() => GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: topicController.topics.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return TopicCard(
                topic: topicController.topics[index],
                color: topicController.getColorByIndex(index),
                onTap: () {
                  topicController
                      .goToDetailTopic(topicController.topics[index]);
                },
              );
            })),
      ),
    ]);
  }
}
