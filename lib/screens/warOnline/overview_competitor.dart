import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/models/war_question.dart';
import 'package:vocabulary_learning/screens/warOnline/war_question.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';

class OverViewCompetitor extends StatefulWidget {
  OverViewCompetitor({Key? key}) : super(key: key);

  @override
  State<OverViewCompetitor> createState() => _OverViewCompetitorState();
}

class _OverViewCompetitorState extends State<OverViewCompetitor> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
            
    return Container(
        padding: const EdgeInsets.only(top: 3),
        height: size.height,
        decoration: const BoxDecoration(
          color: Color(0xffE7FCE9),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 65, backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')),
                MainButton(text: "2345", width: size.width * 0.3, onPressed: () => {}),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'asset/images/vs.png',
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.modulate,
                )
              ],
            ),
            Row(
              children: [
                MainButton(text: "1256", width: size.width * 0.3, onPressed: ()  {
                    showInfoLoading("Waiting to find competitor");
                  var future = new Future.delayed(const Duration(milliseconds: 2000), () {
                    dismissLoadingWidget();
                    Get.to(WarQuestionWidget());
                  });
                }),
                CircleAvatar(radius: 65, backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')),
              ],
            ),
          ],
        ));
  }
}
