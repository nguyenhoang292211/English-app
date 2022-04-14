import 'package:flutter/material.dart';
import 'package:vocabulary_learning/models/grammar.dart';

class GrammarComponent extends StatelessWidget {
  const GrammarComponent(
      {Key? key, required this.onPress, required this.grammar, required this.color})
      : super(key: key);

  final Grammar grammar;
  final Function onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {this.onPress();},
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
    BoxShadow(
        color: color.withOpacity(0.5),
        spreadRadius: 1.0,
        blurRadius: 1.0,
        offset: Offset(3.0, 0)),
        
  ],
        ),
        child: Column(children: [
          Text(
            grammar.title!,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          Text(
            grammar.document!,
            maxLines: 5,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          )
        ]),
      ),
    );
  }
}
