import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const IMAGE = "image";
  static const SAVE_VOCABS = "saved-vocabs";

  String? id;
  String? name;
  String? email;
  String? image;
  String? password;
  List<dynamic>? savedVocabs;

  UserModel({this.id, this.name, this.email, this.password, this.image});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    id = snapshot[ID];
    image = snapshot[IMAGE];
    savedVocabs = snapshot[SAVE_VOCABS];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'password': password,
      'saved-vocabs': savedVocabs,
    };
  }
}
