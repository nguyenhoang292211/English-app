import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Color background;
  final Color textColor;
  final Function onPressed;
  const MainButton(
      {Key? key,
      required this.text,
      required this.width,
      this.background = const Color(0xFFFF9900),
      this.height = 60,
      this.textColor = const Color(0xFFFFFFFF),
      this.fontSize = 23,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {onPressed()},
      style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shadowColor: kgrayTitleButton,
          elevation: 8,
          fixedSize: Size(width, height),
          primary: background,
          onPrimary: const Color.fromARGB(255, 35, 194, 3),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onSurface: Colors.brown.shade300),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontFamily: "PoetsenOne", color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
