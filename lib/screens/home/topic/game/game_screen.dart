import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/game_controller.dart';
import 'package:vocabulary_learning/models/word_find_char.dart';
import 'package:vocabulary_learning/models/word_find_ques.dart';
import 'package:word_search/word_search.dart';

class WordFind extends StatefulWidget {
  WordFind({Key? key}) : super(key: key);

  @override
  _WordFindState createState() => _WordFindState();
}

class _WordFindState extends State<WordFind> {
  // sent size to our widget
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();
  final gameCtrl = Get.put<GameController>(GameController());

  // make list question for puzzle
  // make class 1st
  late List<WordFindQues> listQuestions;

  @override
  void initState() {
    super.initState();
    // listQuestions = [
    //   WordFindQues(
    //     question: "What is name of this game?",
    //     answer: "mario",
    //     pathImage:
    //         "https://images.pexels.com/photos/163077/mario-yoschi-figures-funny-163077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     arrayBtns: [],
    //   ),
    //   WordFindQues(
    //     question: "What is this animal?",
    //     answer: "cat",
    //     pathImage:
    //         "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     arrayBtns: [],
    //   ),
    //   WordFindQues(
    //     question: "What is this animal name?",
    //     answer: "wolf",
    //     pathImage:
    //         "https://as1.ftcdn.net/v2/jpg/02/48/64/04/1000_F_248640483_5KAZi0GqcWrBu6GOhFEAxk1quNEuOzHJ.jpg",
    //     arrayBtns: [],
    //   )
    //   // let me find online image 1st
    // ];
    listQuestions = gameCtrl.games.value;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                        color: const Color.fromARGB(255, 246, 255, 192),
                        // lets make our word find widget
                        // sent list to our widget
                        child: Obx(
                          () => WordFindWidget(
                            constraints.biggest,
                            gameCtrl.games.map((ques) => ques.clone()).toList(),
                            key: globalKey,
                          ),
                        ));
                  },
                ),
              ),
              Container(
                height: size.height * 0.1,
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        elevation: 5,
                        primary: kmainOrange,
                      ),
                      onPressed: () {
                        // reload btn test
                        globalKey.currentState?.generatePuzzle(
                          loop: listQuestions
                              .map((ques) => ques.clone())
                              .toList(),
                        );
                      },
                      child: const Text(
                        "Reload",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        elevation: 5,
                        primary: kBlueGrammar,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Quit",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: kgrayTitleButton,
                            fontWeight: FontWeight.w500),
                      ),
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

class WordFindWidget extends StatefulWidget {
  Size size;
  List<WordFindQues> listQuestions;
  WordFindWidget(this.size, this.listQuestions, {required Key key})
      : super(key: key);

  @override
  _WordFindWidgetState createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  late Size size;
  late List<WordFindQues> listQuestions;
  int indexQues = 0; // current index question
  int hintCount = 0; // number of the selected word

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  void generatePuzzle({
    List<WordFindQues>? loop,
    bool next = false,
    bool left = false,
  }) {
    // lets finish up generate puzzle
    if (loop != null) {
      indexQues = 0;
      listQuestions = <WordFindQues>[];
      listQuestions.addAll(loop);
    } else {
      if (next && indexQues < listQuestions.length - 1) {
        indexQues++;
      } else if (left && indexQues > 0) {
        indexQues--;
      } else if (indexQues >= listQuestions.length - 1) {
        return;
      }

      setState(() {});

      if (listQuestions[indexQues].isDone) return;
    }

    WordFindQues currentQues = listQuestions[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = WSSettings(
      width: 16, // total random word row we want use
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearch wordSearch = WordSearch();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    // check if got error generate random word
    if (newPuzzle.errors.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle.expand((list) => list).toList();
      currentQues.arrayBtns.shuffle(); // make shuffle so user not know answer

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindChar(
              correctValue: currentQues.answer.split("")[index],
              currentIndex: -1,
              currentValue: '');
        });
      }
    }

    print(currentQues.puzzles.length);

    hintCount = 0; //number hint per ques we hit
    setState(() {});
  }

  generateHint() async {
    // let dclare hint
    WordFindQues currentQues = listQuestions[indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == -1)
        .toList();

    if (puzzleNoHints.length > 0) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == -1) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      // check if complete

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      // my wrong..not refresh.. damn..haha
      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == "");

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // lets make ui
    // let put current data on question
    WordFindQues currentQues = listQuestions[indexQues];
    // print(currentQues);

    return GetBuilder<GameController>(
        init: GameController(),
        builder: (gameCtrl) {
          return Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => generateHint(),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.lightbulb_outline_rounded,
                                size: 30,
                                color: kmainOrange,
                              ),
                              Text(
                                "Hint",
                                style: TextStyle(
                                    // ignore: unnecessary_const
                                    color: kmainOrange,
                                    fontSize: 20,
                                    fontFamily: 'PoetsenOne'),
                              )
                            ],
                          ),
                        ),
                        gameCtrl.games.length != indexQues + 1
                            ? Row(
                                children: [
                                  InkWell(
                                    onTap: () => generatePuzzle(left: true),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      size: 35,
                                      color: Color.fromARGB(255, 255, 122, 89),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => generatePuzzle(next: true),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 35,
                                      color: Color.fromARGB(255, 255, 122, 89),
                                    ),
                                  ),
                                ],
                              )
                            : InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "Finish",
                                  style: TextStyle(
                                      color: kmainBrown,
                                      fontSize: 20,
                                      fontFamily: 'PoetsenOne'),
                                )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      currentQues.question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        color: kmainBrown,
                        fontFamily: 'PoetsenOne',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                          maxWidth: size.width / 2 * 1.5,
                          // maxHeight: size.width / 2.5,
                        ),
                        child: Image.network(
                          currentQues.pathImage,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 50, top: 10, left: 10, right: 10),
                    alignment: Alignment.center,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          runSpacing: 5.0,
                          children: currentQues.puzzles.map((puzzle) {
                            // later change color based condition
                            Color color;

                            if (currentQues.isDone) {
                              color = Colors.green.shade300;
                            } else if (puzzle.hintShow) {
                              color = const Color.fromARGB(255, 132, 134, 255);
                            } else if (currentQues.isFull) {
                              color = Colors.red;
                            } else {
                              color = const Color.fromARGB(230, 184, 218, 226);
                            }

                            return InkWell(
                              onTap: () {
                                if (puzzle.hintShow || currentQues.isDone)
                                  return;

                                currentQues.isFull = false;
                                puzzle.clearValue();
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: constraints.biggest.width / 7 - 5,
                                height: constraints.biggest.width / 7 - 5,
                                margin: const EdgeInsets.all(3),
                                child: Text(
                                  (puzzle.currentValue).toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PoetsenOne'),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    alignment: Alignment.center,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 8,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 16, // later change
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        bool statusBtn = currentQues.puzzles.indexWhere(
                                (puzzle) => puzzle.currentIndex == index) >=
                            0;

                        return LayoutBuilder(
                          builder: (context, constraints) {
                            Color color = statusBtn
                                ? const Color.fromARGB(255, 109, 109, 109)
                                : kfirstGradientBack;

                            return Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // margin: ,
                              alignment: Alignment.center,
                              child: FlatButton(
                                height: constraints.biggest.height - 10,
                                child: Text(
                                  currentQues.arrayBtns[index].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PoetsenOne',
                                      color: kwhite),
                                ),
                                onPressed: () {
                                  if (!statusBtn) setBtnClick(index);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ));
        });
  }
}
