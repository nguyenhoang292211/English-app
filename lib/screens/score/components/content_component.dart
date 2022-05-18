import 'package:flutter/material.dart';

class ContentComponent extends StatelessWidget {
  const ContentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size =
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage("asset/images/fox_tree.png"),
          height: 50,
        ),
        Container(
            // height: ,
            )
      ],
    );
  }
}
