class ScoreGame {
  String? id;
  String? idContest;
  String? title;
  String? idUser;
  String? gameType;
  List<dynamic>? questions;
  List<dynamic>? corrects;
  DateTime? updatedAt;
  DateTime? createdAt;

  ScoreGame(
      {this.id,
      this.idContest,
      this.title,
      this.idUser,
      this.questions,
      this.corrects,
      this.gameType,
      this.createdAt,
      this.updatedAt});

  //data from server
  factory ScoreGame.fromMap(map) {
    DateTime created = map['createdAt'].toDate();
    DateTime updated = map['updatedAt'].toDate();
    return ScoreGame(
        id: map['id'],
        idContest: map['idContest'],
        idUser: map['idUser'],
        title: map['title'],
        questions: map['questions'],
        corrects: map['corrects'],
        gameType: map['gameType'],
        createdAt: created,
        updatedAt: updated);
  }

  //sending data from our server

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idContest': idContest,
      'idUser': idUser,
      'title': title,
      'questions': questions,
      'gameType': gameType,
      'corrects': corrects,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  ScoreGame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idContest = json['idContest'];
    idUser = json['idUser'];
    title = json['title'];
    questions = json['questions'];
    gameType = json['gameType'];
    corrects = json['corrects'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['idContest'] = idContest;
    data['idUser'] = idUser;
    data['title'] = title;
    data['questions'] = questions;
    data['gameType'] = gameType;
    data['corrects'] = corrects;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
