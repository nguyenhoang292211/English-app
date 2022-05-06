import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';

class AllVocabulary extends StatefulWidget {
  // final flashCardCtrl = Get.put(FlashCardController());
  final List<Vocabulary> _flashcards = [];
  int _currentIndex = 0;
  AllVocabulary({Key? key}) : super(key: key);

  @override
  State<AllVocabulary> createState() => _AllVocabularyState();
}

class _AllVocabularyState extends State<AllVocabulary> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: GetBuilder<FlashCardController>(
          init: FlashCardController(),
          builder: (flashCardCtrl) {
            return Container(
                padding: EdgeInsets.only(top: 3),
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(color: kwhite),
                child: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                    Column(children: [
                      SizedBox(
                        height: 50,
                        child: Container(
                          color: kGreenFlashCard,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(6, 2, 8, 8),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios, color: kmainBrown),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              const Text("Flash card",
                                  style: TextStyle(
                                    color: kmainBrown,
                                    fontSize: 30,
                                    fontFamily: "PoetsenOne",
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: kGreenFlashCard,
                        child: SizedBox(
                          child: Container(
                            height: 30,
                            width: size.width,
                            child: DecoratedBox(decoration: BoxDecoration(color: kwhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)))),
                          ),
                        ),
                      ),
                      Container(
                        color: kwhite,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: flashCardCtrl.listVocabulary.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildCard(mVocabulary: flashCardCtrl.listVocabulary[index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ]),
                  ]),
                ));
          }),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        flashCardController.setVocabularies(widget._flashcards.obs);
          Get.to(FlashCard());
      }, label: Text("Flash card")),
    );
  }

  // Widget buildCard(int index) {
  //   final size = MediaQuery.of(context).size;
  //   return Card(
  //     elevation: 1.5,
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             width: 60,
  //             height: 60,
  //             decoration: BoxDecoration(color: kred, borderRadius: BorderRadius.circular(60 / 2), image: DecorationImage(fit: BoxFit.cover, image: NetworkImage())),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class BuildCard extends StatelessWidget {
  final Vocabulary mVocabulary;
  const BuildCard({Key? key, required this.mVocabulary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: const Color.fromARGB(255, 80, 78, 78).withOpacity(0.2),
          offset: const Offset(2, 3),
        )
      ]),
      child: Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: kred, borderRadius: BorderRadius.circular(60 / 2), image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(mVocabulary.img.toString()))),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          mVocabulary.word.toString(),
                          style: TextStyle(fontSize: 17),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      mVocabulary.translatedDefinition.toString(),
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
