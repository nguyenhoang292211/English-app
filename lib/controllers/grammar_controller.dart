
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/models/grammar.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_deatail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GrammarController extends GetxController {

   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxList<Grammar> grammars = RxList<Grammar>([]);
  RxList<Grammar> grammarsSearch = RxList<Grammar>([]);
  String collection = "grammar";
  @override
  onReady() {
    super.onReady();
    grammars.bindStream(getAllGrammar());
    grammarsSearch.bindStream(getAllGrammar());
  }

  @override
  void onInit() {
    super.onInit();

    grammars.bindStream(getAllGrammar());
    grammarsSearch.bindStream(getAllGrammar());

  }

  Stream<List<Grammar>> getAllGrammar() => firebaseFirestore.collection(collection).snapshots()
  .map((query) => query.docs.map((item) => Grammar.fromMap(item.data())).toList());
  

    List<Grammar> _lGrammarMain = grammar_data.map((e) =>Grammar(id: e['id'],
     title: e['title'],
      document: e['document'], 
      questions: e['questions'])).toList();

      List<Grammar> _lGrammar = grammar_data.map((e) =>Grammar(id: e['id'],
     title: e['title'],
      document: e['document'], 
      questions: e['questions'])).toList();

    List<Grammar> get lGrammarMain => this._lGrammarMain;
    List<Grammar> get lGrammar => this._lGrammar;

    void searchGrammar(String textSearch) {

      List<Grammar> lTemp = [];
       grammarsSearch.clear();
      grammars.forEach((grammar) {
        grammar.title!.toLowerCase().contains(textSearch.toLowerCase())?grammarsSearch.add(grammar):null;
      });
     
  
      //this.grammars.bindStream();
      update();
    }

    void goToDetailGrammar (Grammar grammar) {
      print("index" + grammar.id.toString());
      Get.to(GrammarDetail());
    }

    Color getColorByIndex(int index) {
      if ((index + 1) % 7 == 0) return kBlueGrammar;
      if ((index + 1) % 7 == 1) return kNudeGrammar;
      if ((index + 1) % 7 == 2) return kGreenGrammar;
      if ((index + 1) % 7 == 3) return kYellowGrammar;
      if ((index + 1) % 7 == 4) return kOrangeGrammar;
      if ((index + 1) % 7 == 5) return kPurpleGrammar;
      if ((index + 1) % 7 == 6) return kPinkGrammar;
      return Colors.black;
    }
}