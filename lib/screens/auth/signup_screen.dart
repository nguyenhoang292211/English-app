import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocabulary_learning/colors.dart';

import 'package:vocabulary_learning/components/input_field.dart';

import 'package:vocabulary_learning/components/main_button.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/constants/firebase.dart';
import 'package:vocabulary_learning/controllers/auth_controller.dart';
import 'package:vocabulary_learning/screens/auth/signin_screen.dart';
import 'package:vocabulary_learning/utils/showLoading.dart';
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
    String? validateEmail(value) {
      return value.toString().isValidEmail() ? null : "Check your email format";
    }

    String? validatePasswordConfirm(value) {
      return authController.errPassword.value;
    }

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [kfirstGradientBack, ksecondGradientBack.withOpacity(0.9)], begin: Alignment.topLeft, end: Alignment.bottomRight, stops: const [0.3, 1])),
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: -15,
              child: Container(
                height: size.height * 0.2,
                width: size.height * 0.2,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/tree2.png"), fit: BoxFit.fill)),
              )),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: const [
                  Text("PANDA", style: TextStyle(color: kmainOrange, fontSize: 40, fontFamily: "PoetsenOne"), textAlign: TextAlign.center),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "english",
                    style: TextStyle(color: kwhite, fontSize: 35, fontFamily: "PoetsenOne"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Join with us now!",
                textAlign: TextAlign.left,
                style: TextStyle(color: kwhite, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w300),
              ),
              SingleChildScrollView(
                child: Container(
                    // height: size.height * 0.8,
                    width: size.width,
                    child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (aController) {
                        return Column(children: [
                          const Text("Sign in", style: TextStyle(color: kwhite, fontSize: 35, fontFamily: "PoetsenOne"), textAlign: TextAlign.center),
                          const SizedBox(
                            height: 15,
                          ),
                          InputField(
                            hintText: "Name",
                            icon: Icons.person,
                            onChange: (value) {},
                            // isEmailText: true,
                            widthSize: 0.8,
                            controllerField: authController.name,
                            errorText: authController.errName.value,
                            // validateInput: (value) {
                            //   if(value.toString().trim().isEmpty){
                            //     return "Name must be fil!";
                            //   }
                            //   return null;
                            // },
                          ),
                
                          const SizedBox(
                            height: 3,
                          ),
                          InputField(
                            hintText: "Email",
                            icon: Icons.auto_fix_normal_outlined,
                            onChange: (value) {},
                            widthSize: 0.8,
                            controllerField: authController.email,
                            errorText: authController.errEmail.value,
                          ),
                       
                          const SizedBox(
                            height: 3,
                          ),
                          InputField(
                            hintText: "Password",
                            icon: Icons.lock,
                            onChange: (value) {},
                            widthSize: 0.8,
                            controllerField: authController.password,
                            obscureText: true,
                            errorText: authController.errPassword.value,
                            // validateInput: validatePasswordConfirm,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          InputField(
                            hintText: "Password confirm",
                            icon: Icons.lock,
                            onChange: (value) {},
                            widthSize: 0.8,
                            controllerField: authController.passwordConfirm,
                            errorText: authController.errPasswordConfirm.value,
                            obscureText: true,
                          ),
                        
                          const SizedBox(
                            height: 6,
                          ),
                          MainButton(
                              text: "Sign UP",
                              width: size.width * 0.85,
                              onPressed: () {
                                // signUp();
                                authController.signUp();
                              }),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: kwhite),
                              ),
                              InkWell(
                                onTap: () {
                                  authController.clearInputWhenChangePage();
                                  Get.to(SigninScreen());
                                },
                                child: const Text(
                                  "Login now",
                                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600, color: kOrangeGrammar),
                                ),
                              )
                            ],
                          ),
                        ]);
                      },
                    )),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
