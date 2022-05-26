import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_to_hex/string_to_hex.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/input_field.dart';
import 'package:vocabulary_learning/controllers/my_topic_controller.dart';
import 'package:vocabulary_learning/models/my_topic.dart';
import 'package:vocabulary_learning/models/topic.dart';

class CreateTopicScreen extends StatefulWidget {
  const CreateTopicScreen({Key? key}) : super(key: key);

  State<CreateTopicScreen> createState() => _CreateTopicScreenState();
}

class _CreateTopicScreenState extends State<CreateTopicScreen> {
  late int vocabNum = 1;
  late final Topic topicData;
  final myTopicCtrl = Get.put<MyTopicController>(MyTopicController());

  final topicTextCtrl = TextEditingController();
  late List<TextEditingController> myInputCtrl =
      List.generate(4, (i) => TextEditingController());
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTopicCtrl.dispose();
    for (var element in myInputCtrl) {
      element.dispose();
    }
    super.dispose();
  }

  final listColor = [
    "0xffFFD6D6",
    "0xFFE77474",
    "0xFFD0FD06",
    "0xFF00CA76",
    "0xFFFF91D5",
    "0xFF00FF4C",
    "0xFF4F7EFF",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder<MyTopicController>(
          init: MyTopicController(),
          builder: (myTopicCtrl) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 212, 255, 247),
                          const Color(0xffFEEDFF).withOpacity(0.28),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.2, 0.9])),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kfirstGradientBack),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Stack(textDirection: TextDirection.ltr, children: [
                        const Positioned(
                            left: 5,
                            top: 20,
                            child: Text(
                              "Make your own topic",
                              style: TextStyle(
                                  fontFamily: "PoetsenOne",
                                  fontSize: 25,
                                  color: kwhite,
                                  decoration: TextDecoration.none),
                            )),
                        Positioned(
                            right: 0,
                            child: Image.asset(
                              'asset/images/note.png',
                              height: 60,
                              fit: BoxFit.fitHeight,
                            )),
                      ]),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: kwhite,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: const Color.fromARGB(64, 14, 11, 11)
                                    .withOpacity(0.3),
                                offset: const Offset(-3, -3),
                              )
                            ]),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 22,
                                        color: kgrayTitleButton,
                                      ),
                                      onTap: () {
                                        myTopicCtrl.resetCreatedTopic();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "New topic",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          color: kfirstGradientBack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Expanded(child: Container()),
                                    InkWell(
                                        onTap: () {
                                          myTopicCtrl.createdTopic.name =
                                              topicTextCtrl.text;
                                          myTopicCtrl.saveTopic();
                                        },
                                        child: const Image(
                                          image: AssetImage(
                                              "asset/images/save.png"),
                                          height: 35,
                                          fit: BoxFit.fitHeight,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  height: 160,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kwhite,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: const Color.fromARGB(
                                                  64, 14, 11, 11)
                                              .withOpacity(0.3),
                                          offset: const Offset(-1, 0),
                                        ),
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: const Color.fromARGB(
                                                  64, 14, 11, 11)
                                              .withOpacity(0.3),
                                          offset: const Offset(3, 3),
                                        )
                                      ]),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: topicTextCtrl,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Topic name',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    235, 178, 194, 194)),
                                            labelStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: kfirstGradientBack),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: const [
                                            Image(
                                              image: AssetImage(
                                                  "asset/images/color.png"),
                                              height: 25,
                                              fit: BoxFit.fitHeight,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Color",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff128F07)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: size.width * 0.85,
                                          alignment: Alignment.center,
                                          height: 30,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: listColor.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return InkWell(
                                                    onTap: () {
                                                      myTopicCtrl.updateColor(
                                                          listColor[index]);
                                                    },
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: myTopicCtrl
                                                                          .createdTopic
                                                                          .color ==
                                                                      listColor[
                                                                          index]
                                                                  ? 3
                                                                  : 0,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  211,
                                                                  255,
                                                                  218)),
                                                          color: Color(StringToHex.toColor(
                                                              listColor[index])),
                                                          borderRadius: BorderRadius.circular(15)),
                                                      height: 30,
                                                      width: 30,
                                                    ));
                                              }),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Vocabularies",
                                      style: TextStyle(
                                          fontFamily: "PoetsenOne",
                                          fontSize: 25,
                                          color: kmainBrown,
                                          decoration: TextDecoration.none),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        myTopicCtrl.addMyVocab();
                                        myInputCtrl.addAll(List.generate(
                                            4,
                                            (index) =>
                                                TextEditingController()));
                                      },
                                      child: Ink(
                                        color: kmainYellow,
                                        child: const Icon(
                                          Icons.add_circle,
                                          size: 35,
                                          color: kmainOrange,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      width: size.width * 0.9,
                                      height: size.height * 0.72,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kwhite,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: const Color.fromARGB(
                                                      64, 14, 11, 11)
                                                  .withOpacity(0.2),
                                              offset: const Offset(-1, 0),
                                            ),
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: const Color.fromARGB(
                                                      64, 14, 11, 11)
                                                  .withOpacity(0.3),
                                              offset: const Offset(3, 3),
                                            )
                                          ]),
                                      child: Obx(() => ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: false,
                                          itemCount:
                                              myTopicCtrl.createdVocabs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            print(index);
                                            return renderVocabItem(
                                                myTopicCtrl
                                                    .createdVocabs[index],
                                                myInputCtrl
                                                    .getRange(index * 4,
                                                        index * 4 + 4)
                                                    .toList());
                                          })),
                                    ))
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void onSaveVocab(MyVocab vocab, String id) {
    for (var element in myTopicCtrl.createdVocabs) {
      if (element.id == id) {
        element.mean = vocab.mean;
        element.translation = vocab.translation;
        element.type = vocab.type;
        element.word = vocab.word;
      }
      print(myTopicCtrl.createdVocabs.length);
    }
  }

  Widget renderVocabItem(
      MyVocab item, List<TextEditingController> myInputCtrl) {
    print(item.id);
    final size = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: size.width * 0.85,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 237, 217)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    MyVocab vocab = MyVocab(
                        id: myTopicCtrl.generateId(),
                        word: myInputCtrl[0].text,
                        mean: myInputCtrl[1].text,
                        type: myInputCtrl[2].text,
                        translation: myInputCtrl[3].text);
                    onSaveVocab(vocab, item.id);
                  },
                  child: const Icon(
                    Icons.done_all_outlined,
                    color: kGreenBold,
                    size: 26,
                  ),
                ),
                InkWell(
                  onTap: () {
                    myTopicCtrl.removeMyVocab(item);
                    // for (var element in myInputCtrl) {
                    //   element.dispose();
                    // }
                  },
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: kredLight,
                    size: 25,
                  ),
                )
              ],
            ),
            TextField(
              controller: myInputCtrl[0],
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Word',
                // hintText: "Eg. Elephant",
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(235, 178, 194, 194)),
                labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: kfirstGradientBack),
              ),
            ),
            TextField(
              controller: myInputCtrl[1],
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Mean',
                // hintText: "Eg. Elephant",
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(235, 178, 194, 194)),
                labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: kfirstGradientBack),
              ),
            ),
            Container(
              width: 100,
              child: TextField(
                controller: myInputCtrl[2],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Type',
                  // hintText: "Eg. Elephant",
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(235, 178, 194, 194)),
                  labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kgrayTitleButton),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: myInputCtrl[3],
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Translation',
                // hintText: "Eg. Elephant",
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(235, 178, 194, 194)),
                labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kfirstGradientBack),
              ),
            ),
          ],
        ));
  }
}
