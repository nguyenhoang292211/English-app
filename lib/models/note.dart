class Note {
  String? id;
  String? userId;
  String? vocabId;
  String? note;
  DateTime? updatedAt;
  DateTime? createdAt;

  Note(
      {this.id,
      this.userId,
      this.vocabId,
      this.note,
      this.createdAt,
      this.updatedAt});

  //data from server
  factory Note.fromMap(map) {
    DateTime created = map['createdAt'].toDate();
    DateTime updated = map['updatedAt'].toDate();
    return Note(
        id: map['id'],
        userId: map['userId'],
        vocabId: map['vocabId'],
        note: map['note'],
        createdAt: created,
        updatedAt: updated);
  }

  //sending data from our server

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'vocabId': vocabId,
      'note': note,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
