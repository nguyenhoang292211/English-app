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
      children: [
        Positioned(child: Container(
          height: size.height*0.2,

        )),
        Positioned(
          bottom: 0,
          child: Container(
            height: size.height * 0.15,
            width: size.width*0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAEAEA),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
            BoxShadow(
                color: Color(0xFFFAEAEA).withOpacity(0.5),
                spreadRadius: 1.0,
                blurRadius: 1.0,
                offset: Offset(3.0, 0)),
          ],
                  ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                "You win this topic grammar",
                style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
              ),
            ]),
          ),
        ),
        Positioned(
          left: size.width*0.05,
          bottom: size.height*0.05,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.done_outline_outlined,
              size: 30,
              color: Color(0xFFDF1717),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image(
            image: AssetImage("asset/images/fox_hi.png"),
            width: size.width * 0.25,
          ),
        ),
        
      ],
    );
  }
}
