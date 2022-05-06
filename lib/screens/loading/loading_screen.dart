import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 223, 249, 255),
                Color.fromARGB(255, 255, 236, 247),
                Color.fromARGB(255, 252, 255, 216),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.6, 1])),
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              image: const DecorationImage(
                image: AssetImage("asset/images/loading.gif"),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
