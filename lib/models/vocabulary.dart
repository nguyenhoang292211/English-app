class Vocabulary {
  String? id;
  String? word;
  String? mean;
  String? translatedDefinition;
  String? image;
  String? topicId;
  String? spelling;
  String? definition;
  String? type;
  Vocabulary(
      {this.id,
      this.word,
      this.mean,
      this.translatedDefinition,
      this.image,
      this.topicId,
      this.spelling,
      this.definition,
      this.type});

  factory Vocabulary.fromMap(map) {
    return Vocabulary(
      id: map['id'],
      word: map['word'],
      definition: map['definition'],
      type: map['type'],
      mean: map['mean'],
      translatedDefinition: map['translated-definition'],
      image: map['image'],
      topicId: map['topic'],
      spelling: map['spelling'],
    );
  }
}
