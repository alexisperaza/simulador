
import 'package:flutter/material.dart';

class TextFieldDetails extends StatelessWidget {
  final String firstInfo;
  final String lastInfo;
  final Color color;
  const TextFieldDetails({
    Key ? key,
    required this.firstInfo ,
    required this.lastInfo,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.04,),
      width: size.width * 0.8,
      height:size.height*0.07,
      decoration: BoxDecoration(
        color: Color(0xff0d2e67),
        borderRadius: BorderRadius.circular(2),
      ),
      child:Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: Text(firstInfo,
                  textScaleFactor : MediaQuery.of(context).textScaleFactor,
                  style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w300),),

          )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(lastInfo,
                  textScaleFactor : MediaQuery.of(context).textScaleFactor,
                  style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w600),),

              )),
        ],
      )

    );
  }
}