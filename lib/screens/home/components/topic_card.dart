import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/screens/home/topic/topic_screen.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Get.to(TopicScreen());
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 10, bottom: 10),
            child: Container(
                height: size.height * 0.4,
                width: size.width * 0.46,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 209, 248),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: const Color.fromARGB(64, 19, 18, 18)
                            .withOpacity(0.3),
                        offset: const Offset(3, 3),
                      )
                    ])),
          )),
          Positioned(
            top: 0,
            child: Image.asset(
              'asset/images/fox_hi.png',
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              bottom: size.width * 0.05,
              child: const Text("Animal",
                  style: TextStyle(
                      fontFamily: "PoetsenOne", fontSize: 20, color: kblack)))
        ],
      ),
    );
  }
}
