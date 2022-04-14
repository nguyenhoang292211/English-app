import 'package:flutter/material.dart';

class WinnerComponent extends StatelessWidget {
  const WinnerComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [ 

         Positioned(
           child: Container(
              height: size.height*0.2,
              decoration: BoxDecoration(
                color: Color(0xFFFAEAEA),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
         ),
        
        Positioned(
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.done_outline_outlined, size: 30, color: Color(0xFFDF1717),
            ),
          ),
        ),
        Positioned(
          child: Text("You win this topic grammarrrr", 
          style: TextStyle(fontSize: 14),),
        ),
        Positioned(
          right: 0,
          child: Image(image:  AssetImage("asset/images/fox_hi.png"),
           
            width: size.width*0.25,
          ),
        )
      ],
    );
  }
}