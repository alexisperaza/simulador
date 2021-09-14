
import 'package:flutter/material.dart';

class TextFieldDownload extends StatelessWidget {
  final String firstInfo;
  final String lastInfo;
  final Color color;
  const TextFieldDownload({
    Key ? key,
    required this.firstInfo ,
    required this.lastInfo,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.03,),
        width: size.width * 0.9,
        height:size.height*0.06,
        decoration: BoxDecoration(
          color: Color(0xff0d2e67),
          borderRadius: BorderRadius.circular(5),
        ),
        child:Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Text(firstInfo,  textScaleFactor : MediaQuery.of(context).textScaleFactor,
                    style: TextStyle(color: color, fontSize: 14.4,fontWeight: FontWeight.w300),),

                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(lastInfo, textScaleFactor : MediaQuery.of(context).textScaleFactor,
                    style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600),),

                )),
          ],
        )

    );
  }
}