import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/bottom_tab_controller.dart';

class HomeIndexScreen extends StatelessWidget {
  HomeIndexScreen({Key? key}) : super(key: key);

  final controller = Get.put(BottomTabController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomTabController>(
      init: BottomTabController(),
      builder: (tabController) {
        return Scaffold(
            bottomNavigationBar: _buildBottomBar(),
            body: tabController.widgetOptions[tabController.currentTabIndex]);
      },
    );
  }

  Widget _buildBottomBar() {
    return SalomonBottomBar(
      currentIndex: controller.currentTabIndex,
      onTap: (index) {
        controller.updateIndex(index);
      },
      selectedItemColor: kfirstGradientBack,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.home_rounded,
            size: 30,
            color: ksecondGradientBack,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          selectedColor: kfirstGradientBack,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.favorite_border_rounded,
            size: 30,
            color: ksecondGradientBack,
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.palette_rounded,
            size: 30,
            color: ksecondGradientBack,
          ),
          title: const Text(
            "My Topic",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.person_outline,
            size: 30,
            color: ksecondGradientBack,
          ),
          title: const Text(
            "Profile",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
