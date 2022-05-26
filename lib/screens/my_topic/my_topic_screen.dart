import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/controllers/my_topic_controller.dart';
import 'package:vocabulary_learning/screens/my_topic/components/topic_section.dart';
import 'package:vocabulary_learning/screens/my_topic/create_topic_screen.dart';

import '../../colors.dart';

class MyTopicScreen extends StatelessWidget {
  const MyTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<MyTopicController>(
            init: MyTopicController(),
            builder: (myTopicCtrl) {
              return Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 212, 255, 247),
                          Color.fromARGB(255, 234, 214, 235).withOpacity(0.28),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.2, 0.9])),
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kfirstGradientBack),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child:
                            Stack(textDirection: TextDirection.ltr, children: [
                          const Positioned(
                              left: 5,
                              top: 15,
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
                                height: 60,
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
                              onPressed: () {
                                myTopicCtrl.initTopic();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateTopicScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: kOrangeGrammar,
                                elevation: 6,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15),
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
              );
            }));
  }
}
