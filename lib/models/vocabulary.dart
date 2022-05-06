class Vocabulary {
  String? id;
  String? word;
  String? mean;
  String? translatedDefinition;
  String? img;
  String? topicId;
  String? spelling;
  String? definition;

  Vocabulary(
      {this.id,
      this.word,
      this.mean,
      this.translatedDefinition,
      this.img,
      this.topicId,
      this.spelling,
      this.definition});

  factory Vocabulary.fromMap(map) {
    return Vocabulary(
        id: map['id'],
        word: map['word'],
        mean: map['mean'],
        translatedDefinition: map['translated-definition'],
        img: map['image'],
        topicId: map['topic'],
        spelling: map['spelling'],
        definition: map['definition'],
        );
  }
}
