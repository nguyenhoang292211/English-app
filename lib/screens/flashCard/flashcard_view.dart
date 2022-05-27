import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class FlashCardViewBackSide extends StatelessWidget {
  final Vocabulary vocabulary;
  final CardState state;
  final int index;
  const FlashCardViewBackSide(
      {Key? key, required this.vocabulary, required this.state,required  this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(

 margin: const EdgeInsets.fromLTRB(8, 0,8,0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white) ,
            color: (( index % 2) == 0 ?  Color(0xFF40DFEF) : Color(0xFFE78EA9) ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: kwhite,
                // offset: const Offset(3, 3),
                spreadRadius: 3
                
              )
            ]),
                  alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                vocabulary.image!,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  vocabulary.word.toString(),
                  style: const TextStyle(
                    color: kgrayTitleButton,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                width: 50,
                height: 2,
                child: ColoredBox(color: kConfirmText),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  vocabulary.definition.toString(),
                  style: const TextStyle(
                    color: kgrayTitleButton,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
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
        (state != CardState.empty)
            ? Positioned(
                top: 12,
                right: 12,
                child: (state == CardState.studyAgain)
                    ? renderStudyAgainLabel()
                    : renderGotItLabel())
            : const SizedBox(
                height: 2,
              )
      ],
    );
  }
}

class FlashCardViewFrontSide extends StatelessWidget {
  final Vocabulary vocabulary;
  final CardState state;
  final int index;
  const FlashCardViewFrontSide(
      {Key? key, required this.vocabulary, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        margin: const EdgeInsets.fromLTRB(8, 0,8,0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white) ,
            color: (( index % 2) == 0 ?  Color(0xFF40DFEF) : Color(0xFFE78EA9) ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: kwhite,
                // offset: const Offset(3, 3),
                spreadRadius: 3
                
              )
            ]),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              vocabulary.word.toString(),
              style: const TextStyle(
                color: kred,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
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
                style: const TextStyle(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 6, 10),
            child: Text(
              vocabulary.translatedDefinition.toString(),
              textAlign: TextAlign.center,
              maxLines: 4,
              style: const TextStyle(
                  color: kblack, fontFamily: 'Poppins', fontSize: 22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 24,
                color: Colors.blueGrey.shade200,
                highlightColor: Color.fromRGBO(85, 139, 47, 1),
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
