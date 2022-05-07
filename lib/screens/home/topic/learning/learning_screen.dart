import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/question_section.dart';

class LearningScreen extends StatelessWidget {
  late TopicController topicController = Get.put(TopicController());
  late LearningController learningController = Get.put(LearningController());

  LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            height: 10,
          ),
          GetBuilder<LearningController>(
              init: LearningController(),
              builder: (learningCtrl) {
                return Expanded(
                    child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: learningCtrl.pageController,
                  itemCount: learningCtrl.questionNumber.value,
                  pageSnapping: false,
                  itemBuilder: (context, index) =>
                      QuestionSection(learning: learningCtrl.learnings[index]),
                ));
              }),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 5,
              ),
              learningController.currentPage.value > 1
                  ? InkWell(
                      highlightColor: const Color(0xff297bff),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => learningController.previousPage(),
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          color: Color(0xff297bff),
                          fontSize: 25,
                          fontFamily: 'PoetsenOne',
                        ),
                      ),
                    )
                  : SizedBox(width: size.width * 0.1),
              SizedBox(
                width: size.width * 0.55,
              ),
              learningController.currentPage.value <
                      learningController.questionNumber.value
                  ? InkWell(
                      onTap: () => learningController.nextQuestion(),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: kmainOrange,
                          fontSize: 25,
                          fontFamily: 'PoetsenOne',
                        ),
                      ),
                    )
                  : SizedBox(
                      width: size.width * 0.1,
                    ),
              const SizedBox(
                width: 10,
              ),
              learningController.currentPage.value <
                      learningController.questionNumber.value
                  ? Image.asset("asset/images/ArrowRight.png",
                      height: 23, fit: BoxFit.cover)
                  : const SizedBox(
                      width: 2,
                    ),
            ],
          ),
          const SizedBox(
            height: 60,
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
          animateFromLastPercent: true,
          animationDuration: 500,
          percent: learningController.currentPage.value / 6,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: kfirstGradientBack,
        ),
        Text(
          '${learningController.currentPage}/${learningController.questionNumber}',
          style: const TextStyle(
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
            learningController.resetPage();
            Get.back();
          },
        ),
        const SizedBox(
          width: 100,
        ),
        Text(
          topicController.topicSelected.name!,
          style: const TextStyle(
              color: kmainBrown, fontSize: 28, fontFamily: 'PoetsenOne'),
        ),
      ],
    );
  }
}
