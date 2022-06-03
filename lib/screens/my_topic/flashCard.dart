import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/my_topic.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_all_vocabulary.dart';

const itemSize = 120.0;

class FlashCardMyTopic extends StatefulWidget {
  List<MyVocab> vocabs = [];
  int _currentIndex = 0;
  FlashCardMyTopic({Key? key, required this.vocabs}) : super(key: key);

  @override
  State<FlashCardMyTopic> createState() => _FlashCardMyTopicState();
}

class _FlashCardMyTopicState extends State<FlashCardMyTopic> {
  final scrollController = ScrollController();

  void onListen() {
    // print('scroll controller ${scrollController.offset}');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffAADB98),
        body: Column(
          children: [
            SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: kfirstGradientBack),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const Text("Flash card",
                      style: TextStyle(
                        color: kfirstGradientBack,
                        fontSize: 27,
                        fontFamily: "PoetsenOne",
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 3),
                  height: size.height - 200,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xffE7FCE9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        final mVocabulary = widget.vocabs[index];
                        final itemPositionOffset = index * itemSize;
                        final difference =
                            scrollController.offset - itemPositionOffset;
                        final percent = 1 - (difference / itemSize);

                        double opacity = percent;
                        double scale = percent;
                        if (opacity > 1.0) opacity = 1.0;
                        if (opacity < 0.0) opacity = 0.0;
                        if (percent > 1.0) scale = 1.0;

                        return Opacity(
                            opacity: opacity,
                            child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..scale(scale, 1.0),
                                child: FlipCard(
                                  direction: FlipDirection.VERTICAL,
                                  front: BuildCard(
                                    image:
                                        'https://www.pngitem.com/pimgs/m/733-7339127_dot-icon-png-transparent-png.png',
                                    title: mVocabulary.word.toString(),
                                    content: mVocabulary.translation.toString(),
                                  ),
                                  back: BuildCard(
                                      image:
                                          'https://i2.wp.com/whateverbrightthings.com/wp-content/uploads/2017/09/Dot-Icon-Gold.png?ssl=1',
                                      title: mVocabulary.mean.toString(),
                                      content: mVocabulary.type.toString()),
                                )));
                      }, childCount: widget.vocabs.length))
                    ],
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kfirstGradientBack,
            icon: Icon(Icons.card_giftcard),
            onPressed: () {
              Get.back();
            },
            label: const Text("Go back")),
      ),
    );
  }
}
