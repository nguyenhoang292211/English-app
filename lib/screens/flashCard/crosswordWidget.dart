import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class DraggGame extends StatefulWidget {
  DraggGame({Key? key}) : super(key: key);

  @override
  State<DraggGame> createState() => _DraggGameState();
}

class _DraggGameState extends State<DraggGame> {
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late bool gameOver;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          value: 'lion',
          name: 'Lion',
          img:
              'https://static.vecteezy.com/system/resources/previews/002/586/031/original/cute-lion-card-alphabet-with-animals-colorful-design-for-teaching-children-the-alphabet-learning-english-illustration-in-a-flat-cartoon-style-on-a-white-background-vector.jpg'),
      ItemModel(
          value: 'cat',
          name: 'Cat',
          img:
              'https://imagesvc.meredithcorp.io/v3/mm/image?q=60&c=sc&poi=%5B960%2C679%5D&w=2000&h=1000&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F12%2F16%2Fanime-cat-names-1204854078-2000.jpg'),
      ItemModel(value: 'dog', name: 'Dog', img: 'https://www.animeoutline.com/wp-content/uploads/2018/05/anime_dog_drawing.png')
    ];

    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: size.height,
          ),
          child: Container(
            height: size.height,
            decoration: BoxDecoration(color: kBlueGrammar),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                      text: 'Score ',
                    ),
                    TextSpan(text: '$score')
                  ]),
                ),
              ),
              if (!gameOver)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      children: <Widget>[
                        for (var i = 0; i < items.length; i++) ...[
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: Draggable(
                              data: i,
                              childWhenDragging: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(items[i].img),
                                radius: 30,
                              ),
                              feedback: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(items[i].img),
                                radius: 50,
                              ),
                              child: !items[i].score
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(items[i].img),
                                      radius: 30,
                                    )
                                  : Container(
                                      child: Text("V"),
                                    ),
                            ),
                          )
                        ]
                      ],
                    ),
                    Spacer(flex: 2),
                    Column(children: [
                      for (var j = 0; j < items.length; j++) ...[_buildDragTarget(j)]
                    ]),
                    const Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Game over",
                      )
                    ],
                  ),
                )
            ]),
          ),
        ),
      )),
    );
  }

  Widget _buildDragTarget(index) {
    return DragTarget(
      builder: (BuildContext context, candidateData, rejectedData) {
        if (items[index].score) {
          return Container(
            color: Colors.white,
            child: Text("Conrect"),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: items[index].accepting ? Colors.grey[400] : Colors.grey[200]),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width / 6,
            width: MediaQuery.of(context).size.width / 6,
            child: Text(items[index].name),
          );
        }
      },
      onWillAccept: (receivedItem) {
        // setState(() {
        //   emoji.accepting = true;
        // });
        print(145);
        print(index);
        print(receivedItem);
        return index == receivedItem;
      },
      onLeave: (receivedItem) {
        setState(() {
          items[index].accepting = false;
        });
      },
      onAccept: (receivedItem) {
        print("155");
        print(receivedItem);
        if (index == receivedItem) {
          // setState(() {
          //   items.remove(receivedItem);
          //   items2.remove(item);
          // });
          score += 10;
          setState(() {
            // emoji.accepting = false;
            items[index].score = true;
            for (int i = 0; i < items.length; i++) {
              if (items[i].score == false) return;
            }
            gameOver = true;
          });
        } else {
          setState(() {
            score -= 5;
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
