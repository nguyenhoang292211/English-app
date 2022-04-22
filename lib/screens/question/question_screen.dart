import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/question_grammar_controller.dart';
import 'package:vocabulary_learning/screens/question/components/HeaderQuestion.dart';
import 'package:vocabulary_learning/screens/question/components/process_bar.dart';
import 'package:vocabulary_learning/screens/question/components/question_card.dart';
class QuestionScreen extends StatelessWidget {

    const QuestionScreen({ Key? key }) : super(key: key);
     final String skip = "Skip";
    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      QuestionGrammarController questionGrammarController = Get.put(QuestionGrammarController());
      return Scaffold(
        backgroundColor: kNudeQuestion,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
            
            HeaderQuestion(),
            ProcessBar(),
            
            // Stack(
            //   children: [
            //     Container(height: size.height*0.4,),
            //     Positioned(
            //       top: 0,
            //       child: Padding(
            //                   padding: const EdgeInsets.symmetric(vertical: 10),
            //                   child: Row(children: [Text("01/10", style: TextStyle(
            //                   fontFamily: "PoetsenOne", fontSize: 20, color: kPinkGrammar
            //                   ),)],),
            //                 ),
            //     ),

            //     Positioned(
            //       top: size.height*0.1,
            //       left: 0,
            //       right: 0,
            //       child: Image(image: AssetImage("./asset/images/table.png"), height: size.height*0.3, width: size.width,),
            //     ),

            //     Positioned(
            //       top: size.height*0.2,
            //       right: size.width*0.2,
            //       left: size.width*0.2,
            //       child: Text("I miss you so much I miss you so muchI miss you so muchI miss you so muchI miss you so muchI miss you so much", style: TextStyle(
            //         color: Colors.white, fontFamily: "Poppins"
            //       ),)),

            //       Positioned(
            //         top: 0,
            //         right: 0,
            //         child: Image(image: AssetImage("./asset/images/sleep.png"),)),
            //   //   Positioned(
                  
            //   //     child: 
            //   //     Expanded(
            //   //   child: PageView.builder(
            //   //     // Block swipe to next qn
            //   //     physics: NeverScrollableScrollPhysics(),
            //   //     controller: questionGrammarController.pageController,
            //   //    itemCount: questionGrammarController.lQuestion.length,
            //   //    onPageChanged: questionGrammarController.updateNumberQuestion,
            //   //     itemBuilder: (context, index) => QuestionCard(
            //   //       questionGrammar: questionGrammarController.lQuestion[index],
            //   //        ),
            //   //   ),
            //   // ),
            //   //     )
            //   ],
            // ), 
            Obx(
                () => Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: questionGrammarController.pageController,
                 itemCount: questionGrammarController.lQuestion.length,
                 onPageChanged: questionGrammarController.updateNumberQuestion,
                  itemBuilder: (context, index) => QuestionCard(
                    questionGrammar: questionGrammarController.lQuestion[index],
                     ),
                ),
              ),)
            ],
          ),
        )
      );
    }
  }
