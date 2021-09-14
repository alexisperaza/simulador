import 'package:flutter/material.dart';
import 'package:simulador/ui/views/add/form.view.dart';

class LongRoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  const LongRoundedButton({
    Key ? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      height: size.height *0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff2ee872),
            padding: EdgeInsets.symmetric(horizontal: 40),


          ),
          onPressed: () {press();} ,
          child: Text(
            text,
            style: TextStyle(color: Color(0xff0d2e67),fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
