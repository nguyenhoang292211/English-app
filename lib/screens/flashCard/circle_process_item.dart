import 'package:flutter/cupertino.dart';
import 'package:vocabulary_learning/colors.dart' as colors;
class CircleProcessItem extends StatelessWidget {
  final Color color;
  const CircleProcessItem({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(30))),
          margin: const EdgeInsets.all(3),
    );
  }
}
