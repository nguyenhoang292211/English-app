import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart' as colors;

class SecondaryButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Color background;
  final Color textColor;
  final Function onPressed;
  const SecondaryButton(
      {Key? key,
      required this.text,
      required this.width,
      this.background = const Color(0xFFFF9900),
      this.height = 45,
      this.textColor = const Color(0xFFFFFFFF),
      this.fontSize = 19,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {onPressed()},
      style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shadowColor: Colors.brown.shade300,
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
            fontSize: fontSize, fontFamily: "Poppins", color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
