import 'package:flutter/material.dart';
import 'package:simulador/ui/views/add/form.view.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  const RoundedButton({
    Key ? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height *0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff2ee872),

          ),
          onPressed: () {press();} ,
          child: Text(
            text,
            textScaleFactor : MediaQuery.of(context).textScaleFactor,
            style: TextStyle(color: Color(0xff0d2e67),fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
