import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/screens/warOnline/overview_competitor.dart';
import 'package:vocabulary_learning/screens/warOnline/war_background.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';

class MainWar extends StatefulWidget {
  MainWar({Key? key}) : super(key: key);

  @override
  State<MainWar> createState() => _MainWarState();
}

class _MainWarState extends State<MainWar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WarBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: CircleAvatar(
            radius: 86,
            backgroundColor: kredLight,
            child: CircleAvatar(radius: 80, backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')),
          ),
        ),
        MainButton(text: "2345", width: size.width * 0.3, onPressed: () => {}),
        SizedBox(height: 30,),
         MainButton(text: "Start now", width: size.width * 0.4, onPressed: () {
              showInfoLoading("Waiting to find competitor");
                  var future = new Future.delayed(const Duration(milliseconds: 2000), () {
                    dismissLoadingWidget();
                    Get.to(OverViewCompetitor());
                  });
         }),
      ],
    ));
  }
}
