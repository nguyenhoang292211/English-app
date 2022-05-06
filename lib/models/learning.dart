class Learning {
  String? id;
  List<Answer> answers;
  String topic;
  int rightAnswer;
  String explaination;
  String vocabulary;
  String question;

  Learning(
      {this.id,
      required this.answers,
      required this.topic,
      required this.rightAnswer,
      required this.explaination,
      required this.vocabulary,
      required this.question});

  factory Learning.fromMap(map) {
    final answers = map['answers'] as List<dynamic>;
    final t = Learning(
        id: map['id'],
        answers: answers.map((item) => Answer.fromMap(item)).toList(),
        rightAnswer: map['right-answer'],
        explaination: map['explaination'],
        vocabulary: map['vocabulary'],
        topic: map['topic'],
        question: map['question']);

    return t;
  }
}

class Answer {
  late int orderNum;
  late String content;
  late String translate;

  Answer(
      {required this.content, required this.translate, required this.orderNum});

  factory Answer.fromMap(map) {
    return Answer(
        orderNum: map['order'],
        content: map['content'],
        translate: map['translate']);
  }
}
