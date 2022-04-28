import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class VocabFlashcardItem extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabFlashcardItem({Key? key, required this.vocabulary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: frontSide(),
      back: backSide(),
    );
  }

  Container backSide() {
    return Container(
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
          const Text(
            'A very large animal with thick grey skin, large ears, two curved outer teeth called tusks and a long nose called a trunk.',
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
    );
  }

  Container frontSide() {
    return Container(
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
        const Text(
          "Elephant",
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
            const Text(
              "/'elIfənt/",
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
        const Text(
          "(n) con voi",
          style: TextStyle(color: kblack, fontFamily: 'Poppins', fontSize: 22),
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
    );
  }
}
