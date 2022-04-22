
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/models/question_grammar.dart';
import 'package:vocabulary_learning/screens/question/components/option.dart';
class QuestionCard extends StatelessWidget {
  const QuestionCard({ Key? key, required this.questionGrammar}) : super(key: key);

  final QuestionGrammar questionGrammar;
  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
      QuestionGrammarController questionGrammarController = Get.put(QuestionGrammarController());
       return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(height: size.height*0.2,),
                Positioned(
                  top: 0,
                  child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(children: [Text("01/10", style: TextStyle(
                              fontFamily: "PoetsenOne", fontSize: 20, color: kPinkGrammar
                              ),)],),
                            ),
                ),

               
                Stack(
                  alignment: Alignment.center,
                  children: [
                

                Image(image: AssetImage("./asset/images/table.png"), height: size.height*0.25, width: size.width,),
                
                 Text(questionGrammar.question!, style: TextStyle(
                    color: Colors.white, fontFamily: "Poppins"
                  ),),

                 
                  ],
                ),
                 Positioned(
                    top: 0,
                    right: 0,
                    child: Image(image: AssetImage("./asset/images/sleep.png"),)),
              
              ],
            ), 
            ...List.generate(this.questionGrammar.options!.length, (index) => 
            option(text: this.questionGrammar.options![index], id: index, onPress: () => questionGrammarController.checkAn(this.questionGrammar, index)
            ))],
        ),
      );
  }
}