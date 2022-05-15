import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/learning_controller.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/question_section.dart';

class LearningScreen extends GetWidget<LearningController> {
  late TopicController topicController = Get.put(TopicController());

  LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LearningController learningCtrl = Get.put(LearningController());
    Size size = MediaQuery.of(context).size;

    return GetBuilder<LearningController>(
      init: LearningController(),
      builder: (learningCtrl) {
        return Scaffold(
          body: Container(
            padding:
                EdgeInsets.only(top: size.height * 0.025, left: 15, right: 15),
            child: Column(children: [
              renderAppBar(learningCtrl),
              const SizedBox(
                height: 20,
              ),
              renderProgressBar(context, learningCtrl),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: learningCtrl.pageController,
                      itemCount: learningCtrl.learnings.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(learningCtrl.learnings.length);
                        return QuestionSection(
                            learning: learningCtrl.learnings[index]);
                      })),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.65,
                  ),
                  learningCtrl.currentPage.value < learningCtrl.learnings.length
                      ? InkWell(
                          onTap: () => learningCtrl.nextQuestion(),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: kmainOrange,
                              fontSize: 25,
                              fontFamily: 'PoetsenOne',
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            learningCtrl.finishLearning();
                          },
                          child: const Text(
                            "Finish",
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
                  learningCtrl.currentPage.value < learningCtrl.learnings.length
                      ? Image.asset("asset/images/ArrowRight.png",
                          height: 23, fit: BoxFit.cover)
                      : const SizedBox(
                          width: 2,
                        ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              )
            ]),
          ),
        );
      },
    );
  }

  Row renderProgressBar(BuildContext context, LearningController learningCtrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 80,
          animation: true,
          lineHeight: 15.0,
          animateFromLastPercent: true,
          animationDuration: 500,
          percent:
              learningCtrl.currentPage.value / learningCtrl.learnings.length,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: kfirstGradientBack,
        ),
        Obx(() => Text(
              '${learningCtrl.currentPage}/${learningCtrl.learnings.length}',
              style: const TextStyle(
                  color: kfirstGradientBack,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
            )),
      ],
    );
  }

  Row renderAppBar(LearningController learningCtrl) {
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
            learningCtrl.resetPage();
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
