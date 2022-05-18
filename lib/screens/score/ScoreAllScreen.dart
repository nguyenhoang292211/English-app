import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/screens/score/components/max-score.dart';

class ScoreAllScreen extends StatefulWidget {
  const ScoreAllScreen({Key? key}) : super(key: key);

  @override
  State<ScoreAllScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Image(
                      image: AssetImage("asset/images/ArrowLeft.png"),
                      height: 20,
                    ),
                  ],
                ),
              )),
          const MaxScoreComponent(maxScrore: "100")
        ],
      ),
    );
  }
}
