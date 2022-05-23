import 'package:flutter/material.dart';

class ButtonDetail extends StatelessWidget {
  const ButtonDetail(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.color})
      : super(key: key);
  final String title;
  final Function onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: size.height * 0.1,
              width: size.width,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: const Offset(3.0, 0)),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "PoetsenOne", fontSize: 28, color: Colors.white),
          )
        ],
      ),
    );
  }
}
