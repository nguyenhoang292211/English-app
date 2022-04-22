import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';

class FlashCardViewDescription extends StatelessWidget {
  final String text;
  const FlashCardViewDescription({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Container(
          child: Stack(children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                SecondaryButton(
                    text: "Again",
                    width: 150,
                    background: ksecondGradientBack,
                    onPressed: () => {Get.to(FlashCard())})
              ],
            )),
            Positioned(
              bottom: 5,
              right: -15,
              child: Container(
                  height: 150,
                  width: 120,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/fox_hi.png"),
                          fit: BoxFit.cover))),
            ),
          ]),
        ));
  }
}
