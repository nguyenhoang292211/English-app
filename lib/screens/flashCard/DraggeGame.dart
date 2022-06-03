import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/controllers/flashcard_controller.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class DraggGame extends StatefulWidget {
  DraggGame({Key? key}) : super(key: key);

  @override
  State<DraggGame> createState() => _DraggGameState();
}

class _DraggGameState extends State<DraggGame> {
  final flashCardCtrl = Get.put<FlashCardController>(FlashCardController());
  late List<ItemModel> items = [];
  late List<ItemModel> items2 = [];
  late int score;
  late bool gameOver;

  int detectedRange = 100;
  int moveDistance = 3;
  bool isShowUpdateScore = false;
  String updateScore = '';

  final ScrollController _scroller = ScrollController();
  final _listViewKey = GlobalKey();
  initGame() {
    gameOver = false;
    score = 0;
    late List<Vocabulary> _flashcards = flashCardCtrl.listVocabulary;
    for (int i = 0; i < _flashcards.length; i++) {
      items.add(ItemModel(
        value: _flashcards[i].word.toString(),
        name: _flashcards[i].word.toString(),
        img: _flashcards[i].image.toString(),
      ));
    }
    items.shuffle();
    if (items.length > 5) {
      items = items.sublist(0, 5);
    }
    items2 = [...items];
    items2.shuffle();
  }

  @override
  void initState() {
    // TODO: implement initState
    initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(),
          child: Container(
            height: size.height,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/blue_sky_bg.png"), fit: BoxFit.fitHeight)),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 0, 8),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: kwhite),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const Text("Dragg and Drop",
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 30,
                            fontFamily: "PoetsenOne",
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 30,
                        width: 20,
                      )
                    ],
                  ),
                ),
                if (!gameOver)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: 'Score $score  ',
                            style: const TextStyle(
                              fontSize: 24,
                              color: kwhite,
                              fontFamily: 'PoetsenOne',
                            )),
                        if (isShowUpdateScore)
                          WidgetSpan(
                              child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: IntrinsicWidth(
                              child: Text(updateScore,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: kwhite,
                                    fontFamily: 'PoetsenOne',
                                  )),
                            ),
                          )),
                      ]),
                    ),
                  ),
                if (!gameOver)
                  SingleChildScrollView(
                    //  scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SingleChildScrollView(
                          key: _listViewKey,
                          controller: _scroller,
                          child: Column(
                            children: <Widget>[
                              for (var i = 0; i < items.length; i++) ...[
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Listener(
                                    onPointerMove: (PointerMoveEvent event) {
                                      RenderBox render = _listViewKey.currentContext?.findRenderObject() as RenderBox;
                                      Offset position = render.localToGlobal(Offset.zero);
                                      double topY = position.dy;
                                      double bottomY = topY + render.size.height;
                                      // if (event.position.dy > MediaQuery.of(context).size.height -100) {
                                      //   // 120 is height of your draggable.
                                      //   _scroller.jumpTo(_scroller.offset + 40);
                                      // }
                                      if (event.position.dy < topY + detectedRange) {
                                        var to = _scroller.offset - moveDistance;
                                        to = (to < 0) ? 0 : to;
                                        _scroller.jumpTo(to);
                                      }
                                      if (event.position.dy > bottomY - detectedRange) {
                                        _scroller.jumpTo(_scroller.offset + moveDistance);
                                      }
                                    },
                                    child: Draggable(
                                      data: i,
                                      childWhenDragging: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 59,
                                          backgroundColor: kwhite,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(items[i].img),
                                            radius: 55,
                                          ),
                                        ),
                                      ),
                                      feedback: !items[i].score
                                          ? CircleAvatar(
                                              backgroundColor: Colors.white,
                                              backgroundImage: NetworkImage(items[i].img),
                                              radius: 65,
                                            )
                                          : SizedBox(
                                              height: 10,
                                            ),
                                      child: !items[i].score
                                          ? Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 59,
                                                backgroundColor: kwhite,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: NetworkImage(items[i].img),
                                                  radius: 55,
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Image.asset(
                                                  'asset/images/check_mark.png',
                                                  fit: BoxFit.cover,
                                                  height: 113,
                                                  width: 113,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(children: [
                          // const Spacer(),
                          for (var j = 0; j < items.length; j++) ...[
                            Container(
                              child: _buildDragTarget(j),
                              margin: EdgeInsets.all(8),
                            )
                          ]
                        ]),
                        const Spacer(),
                      ],
                    ),
                  ),
                if (gameOver)
                  Center(
                    child: Column(
                      children: [
                        Image(image: const AssetImage('asset/images/score.png'), fit: BoxFit.fitHeight, height: size.height * 0.2),
                        const Text(
                          "Congratulation!",
                          style: TextStyle(color: kmainOrange, fontSize: 22, fontFamily: 'PoetsenOne', decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: size.width * 0.95,
                          height: size.height * 0.3,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/scoreAward.png"), fit: BoxFit.fitWidth)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Your score",
                                style: TextStyle(color: kfirstGradientBack, fontSize: 28, fontFamily: 'PoetsenOne', decoration: TextDecoration.none),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${score}',
                                    style: const TextStyle(color: kfirstGradientBack, fontSize: 35, fontFamily: 'PoetsenOne', decoration: TextDecoration.none),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 80,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        MainButton(
                            text: "Complete",
                            width: size.width * 0.4,
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.pop(context);
                            })
                      ],
                    ),
                  )
              ]),
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildDragTarget(index) {
    return DragTarget(
      builder: (BuildContext context, candidateData, rejectedData) {
        if (items2[index].score) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'asset/images/correct.png',
              fit: BoxFit.cover,
              height: 117,
              width: 117,
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: items2[index].accepting ? Colors.grey[400] : Colors.grey[200]),
            alignment: Alignment.center,
            height: 125,
            width: 125,
            child: Text(items2[index].name),
          );
        }
      },
      onWillAccept: (receivedItem) {
        setState(() {
          items2[index].accepting = true;
        });
        // return index == receivedItem;
        return true;
      },
      onLeave: (receivedItem) {
        setState(() {
          items2[index].accepting = false;
        });
      },
      onAccept: (receivedItem) {
        if (items2[index].name == items[int.parse(receivedItem.toString())].name) {
          score += 10;
          setState(() {
            updateScore = "+10";
            isShowUpdateScore = true;
            // emoji.accepting = false;
            items[int.parse(receivedItem.toString())].score = true;
            items2[index].score = true;
            for (int i = 0; i < items.length; i++) {
              if (items2[i].score == false) return;
            }
            gameOver = true;
          });
          Future.delayed(const Duration(seconds: 4), () {
            setState(() {
              isShowUpdateScore = false;
              updateScore = "";
            });
          });
        } else {
          score -= 5;

          setState(() {
            updateScore = "-5";
            isShowUpdateScore = true;
            items2[index].accepting = false;
          });

          Future.delayed(const Duration(seconds: 4), () {
            setState(() {
              isShowUpdateScore = false;
              updateScore = "";
            });
          });
        }
      },
    );
  }
}

//Model
class ItemModel {
  final String name;
  final String value;
  final String img;
  late bool score;
  bool accepting;
  ItemModel({required this.name, required this.value, required this.img, this.accepting = false, this.score = false});
}
