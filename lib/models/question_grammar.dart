class QuestionGrammar {
   String? id;
   String? question;
   List<dynamic>? options;
   int? answer;

    QuestionGrammar({  this.id, this.question, this.answer, this.options});

     factory QuestionGrammar.fromMap(map) {
    return QuestionGrammar(
      id: map['id'],
      question: map['question'],
      options: map['options'],
      answer: map['answer']
    );
  }

}