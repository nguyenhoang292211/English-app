import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/input_field.dart';

class CreateTopicScreen extends StatefulWidget {
  CreateTopicScreen({Key? key}) : super(key: key);

  @override
  State<CreateTopicScreen> createState() => _CreateTopicScreenState();
}

class _CreateTopicScreenState extends State<CreateTopicScreen> {
  final listColor = [
    const Color(0xffFFD6D6),
    const Color.fromARGB(255, 231, 116, 116),
    const Color.fromARGB(255, 208, 253, 6),
    const Color.fromARGB(255, 0, 202, 118),
    const Color.fromARGB(255, 255, 145, 213),
    const Color.fromARGB(255, 0, 255, 76),
    const Color.fromARGB(255, 79, 126, 255),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
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
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      height: 70,
                      fit: BoxFit.fitHeight,
                    )),
              ]),
            ),
            const SizedBox(
              height: 20,
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
                                size: 18,
                                color: kgrayTitleButton,
                              ),
                              onTap: () {},
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "New topic",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: kfirstGradientBack,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                                onTap: () => {},
                                child: const Image(
                                  image: AssetImage("asset/images/save.png"),
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
                          height: 170,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kwhite,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: const Color.fromARGB(64, 14, 11, 11)
                                      .withOpacity(0.3),
                                  offset: const Offset(-1, 0),
                                ),
                                BoxShadow(
                                  blurRadius: 5,
                                  color: const Color.fromARGB(64, 14, 11, 11)
                                      .withOpacity(0.3),
                                  offset: const Offset(3, 3),
                                )
                              ]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Topic name',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(235, 178, 194, 194)),
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
                                      image:
                                          AssetImage("asset/images/color.png"),
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
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listColor.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            decoration: BoxDecoration(
                                                color: listColor[index],
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 30,
                                            width: 30,
                                          ),
                                        );
                                      }),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kwhite,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color:
                                          const Color.fromARGB(64, 14, 11, 11)
                                              .withOpacity(0.2),
                                      offset: const Offset(-1, 0),
                                    ),
                                    BoxShadow(
                                      blurRadius: 5,
                                      color:
                                          const Color.fromARGB(64, 14, 11, 11)
                                              .withOpacity(0.3),
                                      offset: const Offset(3, 3),
                                    )
                                  ]),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Vocabularies",
                                        style: TextStyle(
                                            fontFamily: "PoetsenOne",
                                            fontSize: 22,
                                            color: kmainBrown,
                                            decoration: TextDecoration.none),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.add_circle,
                                          size: 25,
                                          color: kmainOrange,
                                        ),
                                      )
                                    ],
                                  ),
                                  renderVocabItem()
                                ]),
                              )),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderVocabItem() {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(color: Color(0xffFCFFDF)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                InkWell(
                  child: Icon(
                    Icons.pin_outlined,
                    color: kredLight,
                    size: 20,
                  ),
                )
              ],
            ),
            Row(
              children: const [
                TextField(
                  // maxLength: 40
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Word',
                    // hintText: "Eg. Elephant",
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(235, 178, 194, 194)),
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kfirstGradientBack),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}