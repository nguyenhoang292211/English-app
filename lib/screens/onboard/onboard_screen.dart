import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart' as colors;
import 'package:vocabulary_learning/components/main_button.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: -50,
                child: Container(
                  height: size.height * 0.25,
                  width: size.height * 0.23,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/panda_onboard.png"),
                          fit: BoxFit.fill)),
                )),
            Positioned(
                top: size.height * 0.75,
                left: 0,
                child: Container(
                  height: size.height * 0.25,
                  width: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/fence_onboard.png"),
                          fit: BoxFit.fill)),
                )),
            Positioned(
                top: size.height * 0.15,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("PANDA",
                        style: TextStyle(
                            color: colors.AppColor.mainOrange,
                            fontSize: 50,
                            fontFamily: "PoetsenOne"),
                        textAlign: TextAlign.center),
                    Text(
                      "English",
                      style: TextStyle(
                          color: colors.AppColor.white,
                          fontSize: 40,
                          fontFamily: "PoetsenOne"),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "English connect us together!",
                      style: TextStyle(
                          color: colors.AppColor.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: 100,
                      padding:
                          const EdgeInsets.only(top: 20, left: 8, right: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colors.AppColor.onboardSubtextBack
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Text(
                          "Learning english by easy way",
                          style: TextStyle(
                              color: colors.AppColor.onboardSubtext,
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Play game help you remeber new word well",
                          style: TextStyle(
                              color: colors.AppColor.onboardSubtext,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                    // Expanded(child: Container()),
                    SizedBox(
                      height: size.height * 0.27,
                    ),
                    MainButton(
                      onPressed: () => {},
                      text: "Sign up",
                      width: size.width * 0.85,
                      background: colors.AppColor.white,
                      textColor: colors.AppColor.black.withOpacity(0.9),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MainButton(
                      onPressed: () => {},
                      text: "Sign in",
                      width: size.width * 0.85,
                      textColor: colors.AppColor.white,
                    ),
                  ],
                )),
            Positioned(
                bottom: 130,
                right: -20,
                child: Container(
                  height: size.height * 0.25,
                  width: size.height * 0.22,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/fox_hi.png"),
                          fit: BoxFit.fill)),
                )),
          ],
        ),
      ),
    );
  }
}
