import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_description.dart';
import 'package:vocabulary_learning/screens/flashCard/flashcard_view.dart';

class End_FlashCard extends StatelessWidget {
  const End_FlashCard({Key? key}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     
    return Scaffold(
        backgroundColor: kGreenGrammar,
        body: Container(
            height: size.height,
            decoration: BoxDecoration(color: kGreenGrammar),
            child: Stack(children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 35,
                  child: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: kred),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Text("Result",
                          style: TextStyle(
                            color: kOrangeGrammar,
                            fontSize: 30,
                            fontFamily: "PoetsenOne",
                          ),
                          textAlign: TextAlign.center)
                    ],
                    alignment: WrapAlignment.start,
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: FlashCardViewDescription(
                            text:
                                "Congratulations! You have finished everything!"),
                      ),
                    )
                  ],
                ),
              ]),
              Positioned(
                bottom: 5,
                right: -5,
                child: Container(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/tree2.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                bottom: 5,
                left: -5,
                child: Container(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/fence_onboard.png"),
                          fit: BoxFit.fill)),
                ),
              )
            ])));
  }
}
