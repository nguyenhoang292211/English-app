// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HeaderDetailVocabulary extends StatelessWidget {
  HeaderDetailVocabulary({Key? key, required this.onBack}) : super(key: key);
  VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: onBack,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image(image: AssetImage("asset/images/ArrowLeft.png")),
            ))
      ],
    );
  }
}
