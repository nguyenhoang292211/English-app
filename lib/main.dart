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
      theme: ThemeData(fontFamily: "Poppins", primaryColor: kfirstGradientBack),
      home: Scaffold(
        bottomNavigationBar: _buildBottomBar(),
        body: _widgetOptions[controller.currentTabIndex.obs()],
      ),
    );
  }

  Widget _buildBottomBar() {
    return SalomonBottomBar(
      currentIndex: controller.currentTabIndex,
      onTap: (index) {
        controller.updateIndex(index);
        debugPrint(index.toString());
      },
      selectedItemColor: Colors.greenAccent.shade700,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.favorite_border),
          title: const Text("Likes"),
          selectedColor: Colors.pink,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(Icons.search),
          title: const Text("Search"),
          selectedColor: Colors.orange,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
