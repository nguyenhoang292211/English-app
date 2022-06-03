import 'dart:convert';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:vocabulary_learning/models/note.dart';

import '../../constants/colection.dart';
import '../../constants/storage.dart';
import '../../utils/storeData.dart';

class VocabularyController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late Map<String, dynamic> userCurrent;
  var uuid = const Uuid();

  Future<String?> getNoteByVocabIdAndUserId(String vocabId) {
    userCurrent = json.decode(getItemFromLocalStorage(STORAGE.USER));
    return firebaseFirestore
        .collection(COLECTION.NOTE)
        .doc("${userCurrent['id']}${vocabId}")
        .get()
        .then((doc) {
      print(Note.fromMap(doc).note);
      if (doc != null) {
        return Note.fromMap(doc).note;
      } else {
        return "";
      }
    }).catchError((error) {
      return "";
    });
  }

  void saveToNote(String vocabId, String txtNote) {
    Note note = Note(
        id: "${userCurrent['id']}$vocabId",
        userId: userCurrent['id'],
        note: txtNote,
        vocabId: vocabId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    firebaseFirestore.collection(COLECTION.NOTE).doc(note.id).set(
          note.toMap(),
          SetOptions(
            merge: true,
          ),
        );
  }
}
