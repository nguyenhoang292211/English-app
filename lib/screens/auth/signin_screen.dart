import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/components/input_field.dart';
import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/screens/auth/signup_screen.dart';
import 'package:vocabulary_learning/screens/home/index.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 60, bottom: 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  kfirstGradientBack,
                  ksecondGradientBack.withOpacity(0.9)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.3, 1])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: const [
              Text("PANDA",
                  style: TextStyle(
                      color: kmainOrange,
                      fontSize: 40,
                      fontFamily: "PoetsenOne"),
                  textAlign: TextAlign.center),
              SizedBox(
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
          const Text(
            "Welcome to come back!",
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/fox_signup.png"),
                    fit: BoxFit.cover)),
            child: Column(children: [
              SizedBox(
                height: size.height * 0.21,
              ),
              const Text("Sign in",
                  style: TextStyle(
                      color: kwhite, fontSize: 35, fontFamily: "PoetsenOne"),
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
                hintText: "Password",
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
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MainButton(
                      text: "Sign in",
                      width: size.width * 0.85,
                      onPressed: () {
                        Get.to(HomeIndexScreen());
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "You haven’t have an account? ",
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 16, color: kwhite),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignupScreen());
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kwhite),
                        ),
                      )
                    ],
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
