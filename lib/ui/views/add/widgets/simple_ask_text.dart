import 'package:flutter/material.dart';

class SimpleAskText extends StatelessWidget {
  final String question;
  const SimpleAskText({
    Key ? key,
    required this.question,
  })  : super(key:key);

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: 15,),

      child: Text(
        question,
        textScaleFactor : MediaQuery.of(context).textScaleFactor,
        style: TextStyle(color: Colors.white, fontSize:14, fontWeight: FontWeight.w300 ),),
    );
  }
}