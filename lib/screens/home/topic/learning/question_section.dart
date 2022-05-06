import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/models/learning.dart';

class QuestionSection extends StatelessWidget {
  final Learning learning;
  QuestionSection({Key? key, required this.learning}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
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
            child: Text(learning.question,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    color: kgrayTitleButton,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 20,
          ),
          renderAnswerItem(context, learning.answers[0]),
          renderAnswerItem(context, learning.answers[1]),
          renderAnswerItem(context, learning.answers[2]),
          renderAnswerItem(context, learning.answers[3]),
        ],
      ),
    );
  }

  InkWell renderAnswerItem(BuildContext context, Answer answer) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      hoverColor: const Color(0xff87ff89),
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 60,
        width: MediaQuery.of(context).size.width * 0.88,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xff1DCE00)),
            color: Colors.transparent),
        alignment: Alignment.center,
        child: Text(answer.content,
            style: const TextStyle(
                color: kfirstGradientBack,
                fontSize: 19,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
