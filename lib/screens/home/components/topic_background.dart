import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class TopicBackground extends StatelessWidget {
  final Widget child;
  const TopicBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 155, 144),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(color: Color(0xffE7FCE9)),
          ),
          Positioned(
            top: 25,
            right: 0,
            child: Image.asset(
              'asset/images/fox_hi.png',
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.8),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 5,
            child: Image.asset(
              'asset/images/sleep.png',
              width: size.width * 0.5,
              height: size.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            child: Image.asset(
              'asset/images/tree2.png',
              width: size.width * 0.3,
              height: size.width * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          child
        ],
      ),
    );
  }
}
