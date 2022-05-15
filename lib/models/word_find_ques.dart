import 'package:vocabulary_learning/models/word_find_char.dart';

class WordFindQues {
  String? id;
  String? topic;
  String question;
  String pathImage;
  String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = <WordFindChar>[]; // Hints
  List<String> arrayBtns = <String>[]; // List button under hints

  WordFindQues(
      {required this.pathImage,
      required this.question,
      required this.answer,
      required this.arrayBtns,
      this.id = '',
      this.topic = ''});

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => isDone = true;

//Check puzzle is correct or not
  bool fieldCompleteCorrect() {
    // lets declare class WordFindChar 1st
    // check all field already got value
    // fix color red when value not full but show red color
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue == "").isEmpty;

    if (!complete) {
      // no complete yet
      isFull = false;
      return complete;
    }

    isFull = true;
    // if already complete, check correct or not

    String answeredString =
        puzzles.map((puzzle) => puzzle.currentValue).join("");

    // if same string, answer is correct..yeay
    return answeredString == answer;
  }

  WordFindQues clone() {
    return WordFindQues(
      answer: answer,
      pathImage: pathImage,
      question: question,
      arrayBtns: [],
    );
  }

  factory WordFindQues.fromMap(map) {
    return WordFindQues(
        answer: map['answer'],
        pathImage: map['pathImage'],
        id: map['id'],
        topic: map['topic'],
        arrayBtns: [],
        question: map['question']);
  }

  // lets generate sample question
}
