import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
class GrammarDetail extends StatelessWidget {
  const GrammarDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kfirstGradientBack
            ),
          )
        ],
      ),
    );
  }
}