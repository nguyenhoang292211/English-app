import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';

class ContentComponent extends StatelessWidget {
  const ContentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 175,
          width: size.width,
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image(
            image: AssetImage("asset/images/fox_tree.png"),
            height: 175,
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          top: 80,
          child: Container(
              height: 60,
              width: size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kGreenLight, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "The sercet of the getting ahead is getting started",
                style: TextStyle(
                  fontFamily: kPoetsenOne,
                  fontSize: 15,
                  color: Colors.black,
                ),
              )),
        )
      ],
    );
  }
}
