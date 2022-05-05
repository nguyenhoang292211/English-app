import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/controllers/grammar_controller.dart';
import 'package:vocabulary_learning/screens/grammar/grammar_all_screen.dart';

class GrammarHome extends StatelessWidget {
  const GrammarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: GetBuilder<GrammarController>(
          init: GrammarController(),
          builder: (gController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Grammar",
                  style: TextStyle(
                    fontFamily: "PoetsenOne",
                    fontSize: 27,
                    color: kmainBrown,
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: size.height * 0.1,
                      width: size.width,
                    )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                          height: size.height * 0.075,
                          width: size.width * 0.9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kfirstGradientBack,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: Text("You win this grammar topic",
                              style: TextStyle(
                                  fontFamily: "PoetsenOne",
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))),
                    ),
                    Positioned(
                        top: 0,
                        bottom: 0,
                        child: Image(
                            image: AssetImage(
                              "./asset/images/panda_gift.png",
                            ),
                            fit: BoxFit.cover,
                            height: size.height * 0.1))
                  ],
                ),
                InkWell(
                    onTap: () {
                      Get.to(GrammarAllScreen());
                    },
                    child: Container(
                      width: size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Show all>",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: kmainBrown,
                        ),
                      ),
                    )),
                Obx(() => ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: gController.grammarsSearch.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        Container(
                          height: size.height * 0.1,
                          width: size.width,
                        ),
                        Positioned(
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              gController.goToDetailGrammar(
                                  gController.grammarsSearch[index]);
                              // Get.toNamed(
                              //   "/grammar-detail",
                              //   arguments: {
                              //     "grammar": gController.grammarsSearch[index]
                              //   },
                              // );
                            },
                            child: Container(
                                height: size.height * 0.075,
                                width: size.width * 0.85,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: gController.getColorByIndex(index),
                                    borderRadius:
                                        new BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color:
                                            gController.getColorByIndex(index),
                                        offset: const Offset(3, 3),
                                      )
                                    ]),
                                child: Text(
                                    "${gController.grammars[index].title}",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: kGreenLight,
                                borderRadius: new BorderRadius.circular(40.0),
                              ),
                              child: Text("${index + 1}",
                                  style: TextStyle(
                                      fontFamily: "PoetsenOne",
                                      fontSize: 14,
                                      color: kfirstGradientBack,
                                      fontWeight: FontWeight.w400))),
                        ),
                      ]);
                    }))
              ],
            );
          }),
    );
  }
}
