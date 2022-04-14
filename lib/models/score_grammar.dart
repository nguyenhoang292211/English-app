
class ScoreGrammar {
  String? id;
  String? idGrammar;
  String? idUser;
  int? nCorrestQuestion;
  int? nQuestion;
  DateTime? updatedAt;
  DateTime? createdAt;

  ScoreGrammar({
    this.id,
    this.idGrammar,
    this.idUser,
    this.nCorrestQuestion,
    this.nQuestion,
    this.createdAt,
    this.updatedAt
  });

   //data from server
  factory ScoreGrammar.fromMap(map) {
    return ScoreGrammar(
      id: map['id'],
       idGrammar : map['idGrammar'],
      idUser: map['idUser'],
      nCorrestQuestion: map['nCorrestQuestion'],
      nQuestion: map['nQuestion'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt']
    );
  }

  //sending data from our server

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idGrammar': idGrammar,
      'idUser': idUser,
      'nCorrestQuestion': nCorrestQuestion,
      'nQuestion': nQuestion,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  ScoreGrammar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGrammar = json['idGrammar'];
    idUser = json['idUser'];
    nCorrestQuestion = json['nCorrestQuestion'];
    nQuestion = json['nQuestion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idGrammar'] = this.idGrammar;
    data['idUser'] = this.idUser;
    data['nCorrestQuestion'] = this.nCorrestQuestion;
    data['nQuestion'] = this.nQuestion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}