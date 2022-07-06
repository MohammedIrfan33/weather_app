import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  ReusableText({required this.text,required this.textSize});

  final String  text;
  final double textSize;

  //gradient
  final Shader linearGradiant =  const LinearGradient(colors: <Color>[
    Color(0xffABCFF2),
    Color(0xff9AC6F3),
  ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
     style: TextStyle(
       fontSize: textSize,
       fontWeight: FontWeight.bold,
       foreground: Paint()..shader = linearGradiant,
     ),
    );
  }
}
