import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/question_section.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LearningController learningController = Get.put(LearningController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
        child: Column(children: [
          renderAppBar(),
          const SizedBox(
            height: 20,
          ),
          renderProgressBar(context),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => Expanded(
                child: PageView.builder(
              //physics: NeverScrollableScrollPhysics,
              controller: learningController.pageController,
              itemCount: learningController.count.value,
              onPageChanged: learningController.swipePage,
              pageSnapping: false,
              itemBuilder: (context, index) => QuestionSection(),
            )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "SKIP",
                  style: TextStyle(
                    color: kmainOrange,
                    fontSize: 25,
                    fontFamily: 'PoetsenOne',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset("asset/images/ArrowRight.png",
                  height: 30, fit: BoxFit.cover),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ]),
      ),
    );
  }

  Row renderProgressBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 80,
          animation: true,
          lineHeight: 15.0,
          animationDuration: 1000,
          percent: 0.2,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: kfirstGradientBack,
        ),
        const Text(
          '5/10',
          style: TextStyle(
              color: kfirstGradientBack,
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Row renderAppBar() {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        InkWell(
          child: Image.asset(
            "asset/images/x.png",
            height: 26,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Get.back();
          },
        ),
        const SizedBox(
          width: 100,
        ),
        const Text(
          'Animal',
          style: TextStyle(
              color: kmainBrown, fontSize: 28, fontFamily: 'PoetsenOne'),
        ),
      ],
    );
  }
}
