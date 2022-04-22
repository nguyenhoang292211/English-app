import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vocabulary_learning/controllers/bottom_tab_controller.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/screens/home/home_screen.dart';

import 'colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp defaultApp = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCBaSPkpnTCTvSYaRXitV-bXn9bq9ZBj0s",
      appId: "1:954274166254:android:2d20ac29e61ccda3034aff",
      messagingSenderId: "954274166254",
      projectId: "flutter-todo-b6ad9",
    ),
  );

  //  final flashCardController = Get.put<FlashCardController>(FlashCardController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(BottomTabController());

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final flashCardController =
        Get.put<FlashCardController>(FlashCardController());
    return GetMaterialApp(
        title: 'English Vobabulary',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: "Poppins", primaryColor: kfirstGradientBack),
        home: GetBuilder<BottomTabController>(
          init: BottomTabController(),
          builder: (tabController) {
            return Scaffold(
                bottomNavigationBar: _buildBottomBar(),
                body: _widgetOptions[tabController.currentTabIndex]);
          },
        ));
  }

  Widget _buildBottomBar() {
    TextStyle bottomTextStyle = TextStyle(
        fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 18);

    return SalomonBottomBar(
      currentIndex: controller.currentTabIndex,
      onTap: (index) {
        controller.updateIndex(index);
        debugPrint(index.toString());
      },
      selectedItemColor: kfirstGradientBack,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.home,
            size: 32,
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
            Icons.favorite_border,
            size: 32,
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.person,
            size: 32,
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
