import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/save/SaveController.dart';

class VocabFlashcardItem extends StatelessWidget {
  final Vocabulary vocabulary;
  final SaveController saveController = Get.put(SaveController());
  VocabFlashcardItem({Key? key, required this.vocabulary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: frontSide(),
      back: backSide(),
    );
  }

  Icon getSaveIcon() {
    if (saveController.isSave(vocabulary.id.toString()) == true)
      return Icon(Icons.favorite_rounded,
          color: Color.fromARGB(255, 255, 146, 95), size: 28);
    else {
      return Icon(Icons.favorite_border_outlined,
          color: Color.fromARGB(255, 255, 146, 95), size: 28);
    }
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
          Image.network(
            vocabulary.image!,
            height: 100,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            vocabulary.definition!,
            overflow: TextOverflow.fade,
            style: const TextStyle(
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
        Text(
          vocabulary.word!,
          style: const TextStyle(
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
              vocabulary.spelling!,
              style: const TextStyle(
                color: Color.fromARGB(255, 41, 38, 38),
                fontSize: 20,
                fontFamily: 'SourceCodePro',
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "(" + vocabulary.type!.substring(0, 1) + ") " + vocabulary.mean!,
          style: const TextStyle(
              color: kblack, fontFamily: 'Poppins', fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => IconButton(
                iconSize: 24,
                color: Colors.blueGrey.shade200,
                highlightColor: Colors.lightGreen.shade800,
                icon: Icon(
                    (saveController.isSave(vocabulary.id.toString()) == true)
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_outlined,
                    color: Color.fromARGB(255, 255, 146, 95),
                    size: 28),
                onPressed: () {
                  saveController.onPressSave(vocabulary.id.toString());
                },
              ),
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
