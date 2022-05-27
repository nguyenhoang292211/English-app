// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vocabulary_learning/controllers/auth_controller.dart';
import 'package:vocabulary_learning/controllers/bottom_tab_controller.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/screens/auth/signin_screen.dart';
import 'package:vocabulary_learning/screens/flashCard/crosswordWidget.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_deatail.dart';
import 'package:vocabulary_learning/screens/home/home_screen.dart';
import 'package:vocabulary_learning/screens/home/index.dart';
import 'package:vocabulary_learning/screens/home/topic/learning/learning_screen.dart';
import 'package:vocabulary_learning/screens/home/topic/topic_screen.dart';

import 'colors.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCBaSPkpnTCTvSYaRXitV-bXn9bq9ZBj0s",
      appId: "1:954274166254:android:2d20ac29e61ccda3034aff",
      messagingSenderId: "954274166254",
      projectId: "flutter-todo-b6ad9",
      storageBucket: "flutter-todo-b6ad9.appspot.com",
    ),
  ).then((value) {
    Get.put(AuthController());
    Get.put(FlashCardController());
  });

  //  final flashCardController = Get.put<FlashCardController>(FlashCardController());

  // WidgetsFlutterBinding.ensureInitialized();

  // var initializationSettingsAndroid = AndroidInitializationSettings('ic');
  // var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification:
  //         (int id, String? title, String? body, String? payload) async {});
  // var initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String? payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: ' + payload);
  //   }
  // });
  runApp(MyApp());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(BottomTabController());

  // final List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(),
  //   FlashCard(),
  //   const GrammarAllScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    final flashCardController =
        Get.put<FlashCardController>(FlashCardController());
    return GetMaterialApp(
        title: 'English Vobabulary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Poppins", primaryColor: kmainBrown),
        home: Splash()
        // GetBuilder<BottomTabController>(
        //   init: BottomTabController(),
        //   builder: (tabController) {
        //     return Scaffold(
        //         bottomNavigationBar: _buildBottomBar(),
        //         body:
        //             tabController.widgetOptions[tabController.currentTabIndex]);
        //   },
        // )
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
            Icons.pages_rounded,
            size: 30,
            color: ksecondGradientBack,
          ),
          title: const Text(
            "My topic",
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
