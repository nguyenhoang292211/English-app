import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/secondary_button.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:vocabulary_learning/screens/flashCard/flash_card_screen.dart';

const itemSize = 120.0;

class AllVocabulary extends StatefulWidget {
  // final flashCardCtrl = Get.put(FlashCardController());
  final List<Vocabulary> _flashcards = [];
  int _currentIndex = 0;
  AllVocabulary({Key? key}) : super(key: key);

  @override
  State<AllVocabulary> createState() => _AllVocabularyState();
}

class _AllVocabularyState extends State<AllVocabulary> {
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
        body: Column(children: [
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 0, 8),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: kfirstGradientBack),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const Text("Flash card",
                    style: TextStyle(
                      color: kfirstGradientBack,
                      fontSize: 30,
                      fontFamily: "PoetsenOne",
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                  width: 20,
                )
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
                    // SliverAppBar(
                    //   title: Text('Character'),
                    //   pinned: true,
                    //   backgroundColor: Colors.transparent,
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Placeholder(fallbackHeight: 100.0),
                    // ),
                    // SliverPersistentHeader(
                    //   delegate: MyCustomHeader(),
                    // ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      final mVocabulary =
                          flashCardController.listSelectedCard[index];

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
                              transform: Matrix4.identity()..scale(scale, 1.0),
                              child: FlipCard(
                                direction: FlipDirection.VERTICAL,
                                front: BuildCard(
                                  image: mVocabulary.image.toString(),
                                  title: mVocabulary.word.toString(),
                                  content: mVocabulary.definition.toString(),
                                ),
                                back: BuildCard(
                                    image: mVocabulary.image.toString(),
                                    title: mVocabulary.mean.toString(),
                                    content: mVocabulary.translatedDefinition
                                        .toString()),
                              )));
                    }, childCount: flashCardController.listSelectedCard.length))
                  ],
                )),
          )
        ]),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kfirstGradientBack,
            icon: Icon(Icons.card_giftcard),
            onPressed: () {
              Get.to(FlashCard());
            },
            label: Text("Flash card")),
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  const BuildCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: itemSize,
        child: Container(
          decoration: BoxDecoration(boxShadow: [kDefaultShadow]),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            elevation: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(children: [
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: kred,
                          borderRadius: BorderRadius.circular(60 / 2),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 140,
                              child: Text(
                                title,
                                style: TextStyle(fontSize: 17),
                              )),
                          Container(
                            decoration:
                                BoxDecoration(color: kfirstGradientBack),
                            height: 1,
                            width: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            content,
                            style: TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  // TODO: implement maxExtent
  double get maxExtent => 100.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Text(" ");
  }
}
