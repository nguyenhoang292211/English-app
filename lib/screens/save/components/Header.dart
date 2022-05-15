import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/font.dart';

class HeaderSave extends StatelessWidget {
  const HeaderSave(
      {Key? key, required this.numberTopics, required this.numberWords})
      : super(key: key);
  final String numberTopics;
  final String numberWords;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('asset/images/bgWhite.png'),
          fit: BoxFit.cover,
        ),
        const Positioned(
            top: 0,
            right: 10,
            child: Image(
              image: AssetImage('asset/images/fox_sleep.png'),
              fit: BoxFit.cover,
              height: 95,
              width: 95,
            )),
        Positioned(
            left: 30,
            top: 30,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Your saved",
                        style: TextStyle(
                            fontFamily: kPoetsenOne,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("vocabulary",
                          style: TextStyle(
                              fontFamily: kPoetsenOne,
                              color: kmainOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 5),
                            //   child: Text(
                            //     "$numberTopics topics",
                            //     style: const TextStyle(
                            //         fontSize: 14,
                            //         color: kfirstGradientBack,
                            //         fontFamily: kPoppins,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text("-",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kfirstGradientBack,
                                      fontFamily: kPoppins,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text("$numberWords words",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: kfirstGradientBack,
                                        fontFamily: kPoppins,
                                        fontWeight: FontWeight.w500)))
                          ],
                        ))
                  ]),
            ))
      ],
    );
  }
}
