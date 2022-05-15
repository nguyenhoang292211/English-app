import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {

  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const IMAGE="image";

   String? id;
   String? name;
    String? email;
String? image;
  UserModel({ this.id,  this.name,  this.email, this.image});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    id = snapshot[ID];
    image= snapshot[IMAGE];
  }
}
