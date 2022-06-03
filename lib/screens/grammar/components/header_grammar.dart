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
      height: size.height * 0.1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                goBack();
              },
              child:
                  const Image(image: AssetImage("asset/images/ArrowLeft.png"))),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(headerString,
                maxLines: 3,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontFamily: "PoetsenOne",
                    fontSize: 24,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
