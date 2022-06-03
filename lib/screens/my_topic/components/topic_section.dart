import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:string_to_hex/string_to_hex.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/my_topic_controller.dart';
import 'package:vocabulary_learning/models/my_topic.dart';
import 'package:vocabulary_learning/screens/my_topic/flashCard.dart';

class TopicSection extends StatelessWidget {
  final MyTopic topic;
  TopicSection({Key? key, required this.topic}) : super(key: key);
  final myTopicCtrl = Get.put<MyTopicController>(MyTopicController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.only(bottom: 12, left: 7, right: 7),
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: const Color.fromARGB(64, 160, 28, 28).withOpacity(0.3),
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
                  color: Color(StringToHex.toColor(topic.color)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(topic.name,
                  style: const TextStyle(
                      color: kmainBrown,
                      fontSize: 22,
                      fontFamily: "PoetsenOne",
                      decoration: TextDecoration.none)),
              Expanded(
                child: Container(),
              ),
              InkWell(
                  onTap: () {
                    Get.to(FlashCardMyTopic(vocabs: topic.vocabularies!));
                  },
                  child: const Image(
                    image: AssetImage("asset/images/flashcard.png"),
                    height: 45,
                    fit: BoxFit.fitHeight,
                  )),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    myTopicCtrl.deleteTopic(topic.docID!).then((value) {
                      if (value == false) {
                        Get.snackbar(
                          'Delete fail!',
                          'Please try again!',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Color.fromARGB(255, 240, 196, 0),
                          borderRadius: 100,
                          duration: Duration(seconds: 2),
                          colorText: kwhite,
                          isDismissible: true,
                          maxWidth: size.width * 0.9,
                          margin: EdgeInsets.only(bottom: 10),
                          shouldIconPulse: true,
                          snackStyle: SnackStyle.FLOATING,
                          barBlur: 0.7,
                        );
                      } else {
                        Get.snackbar(
                          'Success!',
                          'Your topic have been deleted.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Color.fromARGB(255, 0, 122, 37),
                          borderRadius: 20,
                          duration: Duration(seconds: 2),
                          colorText: kwhite,
                          isDismissible: true,
                          maxWidth: size.width * 0.9,
                          margin: EdgeInsets.only(bottom: 10),
                          shouldIconPulse: true,
                          snackStyle: SnackStyle.FLOATING,
                          barBlur: 0.7,
                        );
                      }
                    });
                  },
                  child: const Image(
                    image: AssetImage("asset/images/garbage.jpg"),
                    height: 30,
                    fit: BoxFit.fitHeight,
                  )),
            ],
          ),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: topic.vocabularies!.length,
              itemBuilder: (BuildContext context, int index) {
                return renderVocabItem(
                    size, context, topic.vocabularies![index]);
              })
        ],
      ),
    );
  }

  Widget renderVocabItem(Size size, BuildContext context, MyVocab vocab) {
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
          children: [
            Text(vocab.word!,
                style: const TextStyle(
                    color: kfirstGradientBack,
                    fontFamily: 'PoetsenOne',
                    fontSize: 20)),
            const SizedBox(
              height: 10,
            ),
            Text(vocab.mean!,
                style: const TextStyle(
                  color: kblack,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 7,
            ),
            Text(vocab.type!,
                style: const TextStyle(
                    color: kPurpleGrammar,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            Text(
              vocab.translation!,
              style: const TextStyle(
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
      margin: const EdgeInsets.symmetric(vertical: 3),
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
              children: [
                Text(
                  vocab.word!,
                  style: const TextStyle(
                      color: kblack,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  vocab.mean!,
                  style: const TextStyle(
                      color: kblack,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      overflow: TextOverflow.fade),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
