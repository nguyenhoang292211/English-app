import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';

class HeaderQuestion extends StatelessWidget {
  const HeaderQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Get.deleteAll();
                Get.off(GrammarAllScreen());
              },
              child:
                  const Image(image: AssetImage("asset/images/ArrowLeft.png"))),
          const Text("Skip",
              style: TextStyle(
                  fontFamily: "PoetsenOne", fontSize: 16, color: kmainBrown)),
        ],
      ),
    );
  }
}
