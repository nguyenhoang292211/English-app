import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/colors.dart' as colors;
import 'package:vocabulary_learning/components/input_field.dart';

import 'package:vocabulary_learning/components/main_button.dart';
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
                const EdgeInsets.only(left: 15, right: 15, top: 60, bottom: 0),
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
                height: size.height * 0.6,
                width: size.width,
                child: Column(children: [
               
                  Text("Sign in",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 35,
                          fontFamily: "PoetsenOne"),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    hintText: "Email",
                    icon: Icons.person,
                    onChange: (value) {},
                    isEmailText: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InputField(
                    hintText: "Full name",
                    icon: Icons.lock,
                    onChange: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                     InputField(
                    hintText: "Password",
                    icon: Icons.lock,
                    onChange: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                     InputField(
                    hintText: "Password confirm",
                    icon: Icons.lock,
                    onChange: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.yellow.shade600, fontFamily: 'Poppins'),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
