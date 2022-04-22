import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 45),
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: kblack.withOpacity(0.25),
                  offset: const Offset(4, 4),
                )
              ]),
          alignment: Alignment.center,
          child: const Text(
              'A very large animal with thick grey skin, large ears, two curved outer teeth called tusks and a long nose called a trunk.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: kgrayTitleButton,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400)),
        ),
        const SizedBox(
          height: 20,
        ),
        renderAnswerItem(context),
        renderAnswerItem(context),
        renderAnswerItem(context),
        renderAnswerItem(context),
      ],
    );
  }

  InkWell renderAnswerItem(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 65,
        width: MediaQuery.of(context).size.width * 0.88,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xff1DCE00)),
            color: Colors.transparent),
        alignment: Alignment.center,
        child: const Text("Elephant",
            style: TextStyle(
                color: kfirstGradientBack,
                fontSize: 19,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
