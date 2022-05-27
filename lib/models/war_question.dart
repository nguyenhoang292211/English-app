
class WarQuestion {
  String? id;
  List<WarAnswer> answers;
  int rightAnswer;
  String explaination;
  String question;

  WarQuestion(
      {this.id,
      required this.answers,
      required this.rightAnswer,
      required this.explaination,
      required this.question});

  factory WarQuestion.fromMap(map) {
    final answers = map['answers'] as List<dynamic>;
    final t = WarQuestion(
        id: map['id'],
        answers: answers.map((item) => WarAnswer.fromMap(item)).toList(),
        rightAnswer: map['right-answer'],
        explaination: map['explaination'],
        question: map['question']);
    print('Voca :' + t.id!);
    return t;
  }
}

class WarAnswer {
  late int orderNum;
  late String content;

  WarAnswer(
      {required this.content, required this.orderNum});

  factory WarAnswer.fromMap(map) {
    return WarAnswer(
        orderNum: map['order'],
        content: map['content'],);
  }
}
