import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color.fromARGB(64, 160, 28, 28).withOpacity(0.3),
              offset: const Offset(3, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xffFFE2E2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Animal",
                  style: TextStyle(
                      color: kmainBrown,
                      fontSize: 25,
                      fontFamily: "PoetsenOne",
                      decoration: TextDecoration.none)),
              Expanded(
                child: Container(),
              ),
              InkWell(
                  onTap: () => {},
                  child: const Image(
                    image: AssetImage("asset/images/flashcard.png"),
                    height: 45,
                    fit: BoxFit.fitHeight,
                  )),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () => {},
                  child: const Image(
                    image: AssetImage("asset/images/Edit.png"),
                    height: 30,
                    fit: BoxFit.fitHeight,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          renderVocabItem(size, context),
          const SizedBox(
            height: 4,
          ),
          renderVocabItem(size, context),
          const SizedBox(
            height: 4,
          ),
          renderVocabItem(size, context),
        ],
      ),
    );
  }

  Widget renderVocabItem(Size size, BuildContext context) {
    var expanded = true;
    AlertDialog alertDialog = AlertDialog(
      actions: [
        TextButton(
          child: const Text(
            'Close',
            style: TextStyle(
                color: kmainOrange,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      scrollable: true,
      content: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kwhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Generous",
                style: TextStyle(
                    color: kfirstGradientBack,
                    fontFamily: 'PoetsenOne',
                    fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text("Tốt bụng",
                style: TextStyle(
                    color: kblack,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
            SizedBox(
              height: 7,
            ),
            Text("(noun)",
                style: TextStyle(
                    color: kPurpleGrammar,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            Text(
              "A very large animal with thick grey skin, large ears, two curved outer teeth called tusks and a long nose called a trunk.",
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: kgrayTitleButton,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
              maxLines: 8,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(color: const Color(0xffFFE2E2)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => alertDialog);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Gernerous",
                  style: TextStyle(
                      color: kblack,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Text(
                  "Tốt bụng",
                  style: TextStyle(
                      color: kblack, fontFamily: 'Poppins', fontSize: 18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
