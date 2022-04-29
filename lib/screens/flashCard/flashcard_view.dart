import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class FlashCardViewBackSide extends StatelessWidget {
  final Vocabulary vocabulary;
  final CardState state;
  const FlashCardViewBackSide(
      {Key? key, required this.vocabulary, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: kgrayTitleButton.withOpacity(0.5),
                  offset: const Offset(3, 3),
                )
              ]),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/elephant.png',
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                vocabulary.mean.toString(),
                style: TextStyle(
                  color: kgrayTitleButton,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
              const SizedBox(
                height: 5,
              ),
              IconButton(
                iconSize: 34,
                color: Colors.blueGrey.shade200,
                highlightColor: Colors.lightGreen.shade800,
                icon: Icon(Icons.g_translate_rounded,
                    color: Colors.blueAccent.shade400, size: 32),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FlashCardViewFrontSide extends StatelessWidget {
  final Vocabulary vocabulary;
  final CardState state;
  const FlashCardViewFrontSide(
      {Key? key, required this.vocabulary, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: kgrayTitleButton.withOpacity(0.5),
                offset: const Offset(3, 3),
              )
            ]),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            vocabulary.word.toString(),
            style: TextStyle(
              color: kred,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.headset,
                  color: Colors.blue.shade800,
                  size: 25,
                ),
                onTap: () {},
              ),
              Text(
                vocabulary.spelling.toString(),
                style: TextStyle(
                  color: Color.fromARGB(255, 41, 38, 38),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            vocabulary.translatedDefinition.toString(),
            style:
                TextStyle(color: kblack, fontFamily: 'Poppins', fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 24,
                color: Colors.blueGrey.shade200,
                highlightColor: Colors.lightGreen.shade800,
                icon: const Icon(Icons.favorite_border_outlined,
                    color: Color.fromARGB(255, 255, 146, 95), size: 28),
                onPressed: () {},
              ),
              const Text(
                "Save",
                style: TextStyle(
                    color: kmainOrange, fontFamily: 'Poppins', fontSize: 17),
              ),
            ],
          )
        ]),
      ),
      (state != CardState.empty)
          ? Positioned(
              top: 12,
              right: 12,
              child: (state == CardState.studyAgain)
                  ? renderStudyAgainLabel()
                  : renderGotItLabel())
          : SizedBox(
              height: 2,
            )
    ]);
  }
}

Container renderStudyAgainLabel() {
  return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: kred),
      width: 150,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_circle_left_rounded, color: kwhite),
            SizedBox(width: 5), 
            Text(
              'Study again',
              style: TextStyle(color: kwhite),
            )
          ],
        ),
      ));
}

Container renderGotItLabel() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kConfirmText),
      width: 110,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: kwhite,
            ),
            SizedBox(width: 5),
            Text(
              'Got it',
              style: TextStyle(color: kwhite),
            )
          ],
        ),
      ));
}
