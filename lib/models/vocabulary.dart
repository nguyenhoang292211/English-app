class Vocabulary {
  String? id;
  String? word;
  String? mean;
  String? translatedDefinition;
  String? img;
  String? topicId;
  String? spelling;

  Vocabulary(
      {this.id,
      this.word,
      this.mean,
      this.translatedDefinition,
      this.img,
      this.topicId,
      this.spelling});

  factory Vocabulary.fromMap(map) {
    return Vocabulary(
        id: map['id'],
        word: map['word'],
        mean: map['mean'],
        translatedDefinition: map['translated-definition'],
        img: map['img'],
        topicId: map['topic'],
        spelling: map['spelling']);
  }
}
