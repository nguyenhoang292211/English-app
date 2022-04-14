class Grammar {
   String? id;
   String? title;
   String? document;
   List<dynamic>? questions;

  Grammar({
     this.id,
     this.title,
     this.document,
     this.questions
  });

   factory Grammar.fromMap(map) {
    return Grammar(
      id: map['id'],
      title: map['title'],
      document: map['document'],
      questions: map['questions']
    );
  }

}

const List grammar_data = [{

  "id": "001",
  "title": "Present perfect tense",
  "document": "Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.",
  "questions": ["1"]
},
{
  "id": "002",
  "title": "Present Continuous",
  "document": "Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.",
  "questions": ["1"]
},

{
  "id": "003",
  "title": "Present Perfect",
  "document": "Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.",
  "questions": ["1"]
},

{
  "id": "004",
  "title": "Present Perfect Continuous",
  "document": "",
  "questions": ["1"]
},

{
  "id": "005",
  "title": "Simple Past",
  "document": "",
  "questions": ["1"]
},

{
  "id": "006",
  "title": "Past Continuous",
  "document": "",
  "questions": ["1"]
},

{
  "id": "007",
  "title": "Past Perfect",
  "document": "",
  "questions": ["1"]
},

];