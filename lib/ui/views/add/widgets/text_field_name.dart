
import 'package:flutter/material.dart';

class TextFieldName extends StatelessWidget {
  final IconData icon;
  final ValueChanged<String> onChanged;
  TextFieldName({
    Key ? key,
    required this.icon ,
    required this.onChanged,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.04,),
      width: size.width * 0.85,
      height: size.height *0.05,
      decoration: BoxDecoration(
        color: Color(0xff002257),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Color(0xff2ee872),),

      ),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: size.height*0.017, fontWeight: FontWeight.w400),
        textInputAction: TextInputAction.go,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle_outlined, color: Colors.white, size: size.height*0.035,),

          hintText: 'NOMBRE',
          hintStyle: TextStyle(
            color: Colors.grey
          ),

          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.transparent,



        ),

      ),
    );

  }
}