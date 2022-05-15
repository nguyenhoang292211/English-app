import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/controllers/topic_controller.dart';
import 'package:vocabulary_learning/models/learning.dart';
import 'package:vocabulary_learning/screens/grammar/score_screen.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/learning_screen.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/result_screen.dart';

class LearningController extends GetxController
    with SingleGetTickerProviderMixin {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TopicController topicController = Get.put(TopicController());
  String learningCollection = "learning";
  RxInt currentPage = 1.obs;
  RxInt correctAnswer = 0.obs;

  late RxInt questionNumber = _learnings.length.obs;

  late RxBool _isLoading;
  RxBool get isLoading => _isLoading;

  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void swipePage(int index) {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc);
  }

  late RxList<Learning> _learnings = RxList<Learning>([]);
  RxList<Learning> get learnings => _learnings;

  // @override
  // void onReady() {
  //   super.onReady();
  //   print("On ready");
  //   _learnings
  //       .bindStream(getLearningPerTopic(topicController.topicSelected.id));
  //   // _learnings = [].obs as RxList<Learning>;
  //   _pageController = PageController();
  //   questionNumber = _learnings.length.obs;
  // }

  @override
  void onInit() {
    _learnings
        .bindStream(getLearningPerTopic(topicController.topicSelected.id));
    // _learnings = [].obs as RxList<Learning>;

    questionNumber = _learnings.length.obs;
    super.onInit();
    update();
  }

  void gotoLearningScreen(String topicId) {
    _isLoading = true.obs;
    Get.to(LearningScreen());
    _isLoading = false.obs;
  }

  void resetPage() {
    currentPage = 1.obs;
    correctAnswer = 0.obs;
  }

  Stream<List<Learning>> getLearningPerTopic(String id) => firebaseFirestore
      .collection(learningCollection)
      .where("topic", isEqualTo: id)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => Learning.fromMap(item.data())).toList());

  void nextQuestion() {
    if (currentPage < learnings.length) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCubic);
      currentPage++;
      update();
    }

    // Reset the counter
    // _animationController.reset();

    // Then start it again
    // Once timer is finish go to the next qn
    // _animationController.forward().whenComplete(nextQuestion);
    // } else {
  }

  void finishLearning() {
    currentPage = 1.obs;
    Get.to(ResultLearningScreen());
  }

  void switchPage(context) {
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
      Navigator.pop(context);
    });
  }

  void previousPage() {
    if (currentPage > 1) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic);
      currentPage = currentPage - 1;
      update();
    }
  }
}
