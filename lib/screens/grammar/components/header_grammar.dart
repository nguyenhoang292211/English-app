import 'package:flutter/material.dart';

class HeaderGrammar extends StatelessWidget {
  const HeaderGrammar(
      {Key? key, required this.headerString, required this.goBack})
      : super(key: key);
  final String headerString;
  final Function goBack;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height*0.1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                goBack();
              },
              child: Image(image: AssetImage("asset/images/ArrowLeft.png"))),
          Text(this.headerString,
              style: TextStyle(
                  fontFamily: "PoetsenOne", fontSize: 28, color: Colors.white)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
