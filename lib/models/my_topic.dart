class MyTopic {
  String? docID;
  String? id;
  String? userId;
  String? color;
  List<MyVocab>? vocabularies;
  String name;
  MyTopic(
      {this.id,
      this.userId,
      this.color,
      this.vocabularies,
      this.docID,
      required this.name});

  factory MyTopic.fromMap(map, id) {
    final vocabs = map['vocabularies'] as List<dynamic>;

    return MyTopic(
      docID: id,
      id: map['id'],
      userId: map['userId'],
      color: map['color'],
      name: map['name'],
      vocabularies: vocabs.isNotEmpty
          ? vocabs.map((item) => MyVocab.fromMap(item)).toList()
          : [],
    );
  }
}

class MyVocab {
  String id;
  String? word;
  String? mean;
  String? type;
  String? translation;

  MyVocab(
      {required this.id, this.word, this.mean, this.translation, this.type});

  factory MyVocab.fromMap(map) {
    return MyVocab(
      id: map['id'],
      word: map['word'],
      translation: map['translation'],
      type: map['type'],
      mean: map['mean'],
    );
  }
}
