import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class NavigationButton extends StatelessWidget {
  final String image;
  final String text;
  final Color background;
  final Function onClick;
  const NavigationButton({Key? key, required this.image, required this.text, required this.background, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration:
            BoxDecoration(color: background, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.shade500.withOpacity(0.4), offset: const Offset(4, 4))]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 55,
              width: 55,
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kfirstGradientBack, fontSize: 24, fontFamily: 'PoetsenOne'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
