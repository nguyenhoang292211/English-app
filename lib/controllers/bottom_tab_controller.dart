import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';
import 'package:vocabulary_learning/screens/home/home_screen.dart';
import 'package:vocabulary_learning/screens/profile/profile_screen.dart';

class BottomTabController extends GetxController {
  var currentTabIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FlashCard(),
    ProfileScreen()
  ];

  List<Widget> get widgetOptions => this._widgetOptions;

  void updateIndex(int index) {
    currentTabIndex = index;
    update();
  }
}
