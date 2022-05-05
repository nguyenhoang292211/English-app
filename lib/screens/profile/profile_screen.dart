import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/controllers.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 50, bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 241, 255, 179),
                  const Color.fromARGB(255, 242, 255, 207),
                  const Color.fromARGB(255, 109, 252, 96).withOpacity(0.28),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 0.45, 0.9])),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Get.to(SigninScreen());
                authController.signOut();
              },
              child: Text(
                "Sign out",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kOrangeGrammar),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    ));
  }
}
