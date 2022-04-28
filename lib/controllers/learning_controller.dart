import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LearningController extends GetxController
    with SingleGetTickerProviderMixin {
  late PageController _pageController;
  PageController get pageController => this._pageController;

  void swipePage(int index) {
    _pageController.nextPage(
        duration: Duration(milliseconds: 5000), curve: Curves.ease);
  }

  RxInt count = 4.obs;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }
}
