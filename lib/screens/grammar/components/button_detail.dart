import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/screens/question/question_screen.dart';

class ButtonDetail extends StatelessWidget {
  const ButtonDetail({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {Get.to(QuestionScreen());},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
           
            child: Container(
              height: size.height*0.1,
              width: size.width,
              decoration: BoxDecoration(
                color: kmainBrown,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: kmainBrown.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(3.0, 0)),
                ],
              ),
            ),
          ),
         
          Text(this.title, style: TextStyle(
            fontFamily: "PoetsenOne", fontSize: 28, color: Colors.white
          ),)
        ],
      ),
    );
  }
}
