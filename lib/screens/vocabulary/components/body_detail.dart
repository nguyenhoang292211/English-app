// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/constants/font.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';

class BodyDetail extends StatefulWidget {
  BodyDetail({Key? key, required this.vocabulary}) : super(key: key);
  Vocabulary vocabulary;

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffD97568).withOpacity(0.5),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: const Offset(3.0, 0)),
            ],
            color: const Color(0xffD97568),
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "${widget.vocabulary.word} (${widget.vocabulary.mean})",
                style: const TextStyle(
                    fontFamily: kPoetsenOne,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "${widget.vocabulary.definition}",
                  style: const TextStyle(
                      fontFamily: kPoppins,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 2,
                width: size.width * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Note',
                        style: TextStyle(
                            fontFamily: kPoetsenOne,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: noteController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            fillColor: Color(0xffE7FCE9),
                            hintText: "Enter your note",
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white))),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
