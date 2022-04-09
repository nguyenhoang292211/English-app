import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart' as colors;

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
                  colors.AppColor.firstGradientBack,
                  colors.AppColor.secondGradientBack.withOpacity(0.9)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.3, 1])),
        child: Stack(children: []),
      ),
    );
  }
}
