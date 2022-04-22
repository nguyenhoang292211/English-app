import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';

import 'package:vocabulary_learning/components/input_field.dart';

import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/screens/auth/signin_screen.dart';
import 'package:vocabulary_learning/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                kfirstGradientBack,
                ksecondGradientBack.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.3, 1])),
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: -15,
              child: Container(
                height: size.height * 0.2,
                width: size.height * 0.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/tree2.png"),
                        fit: BoxFit.fill)),
              )),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text("PANDA",
                      style: TextStyle(
                          color: kmainOrange,
                          fontSize: 40,
                          fontFamily: "PoetsenOne"),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "english",
                    style: TextStyle(
                        color: kwhite, fontSize: 35, fontFamily: "PoetsenOne"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Join with us now!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kwhite,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              Container(
                height: size.height * 0.8,
                width: size.width,
                child: Column(children: [
                  Text("Sign in",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 35,
                          fontFamily: "PoetsenOne"),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: "Email",
                    icon: Icons.person,
                    onChange: (value) {},
                    isEmailText: true,
                    widthSize: 0.8,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  InputField(
                    hintText: "Full name",
                    icon: Icons.auto_fix_normal_outlined,
                    onChange: (value) {},
                    widthSize: 0.8,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  InputField(
                    hintText: "Password",
                    icon: Icons.lock,
                    onChange: (value) {},
                    widthSize: 0.8,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  InputField(
                    hintText: "Password confirm",
                    icon: Icons.lock,
                    onChange: (value) {},
                    widthSize: 0.8,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  MainButton(
                      text: "Sign in",
                      width: size.width * 0.85,
                      onPressed: () {}),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 16, color: kwhite),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SigninScreen());
                        },
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kOrangeGrammar),
                        ),
                      )
                    ],
                  ),
                ]),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
