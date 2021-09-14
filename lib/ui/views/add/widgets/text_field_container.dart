
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  //final Widget child;
  final Function press;
  final dynamic valor;
  final Image image;
  final int fecha;
  const TextFieldContainer({
    Key ? key,
    required this.press,
    required this.valor,
    required this.image,
    required this.fecha,
    //required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {press();},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15,),
        width: size.width * 0.85,
        height: size.height *0.05,
        decoration: BoxDecoration(
          color: Color(0xff002257),
          borderRadius: BorderRadius.circular(5),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image,
            SizedBox(width: size.width * 0.02,),

            Text.rich(
                TextSpan(
                  text: valor==0 ? '' : fecha==1 ? '$valor Día/s' : fecha==2 ? '$valor Mes/es': fecha==3 ? '$valor Año/s' : '$valor',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300)

            )),


          ],
        ),


      ),

      //child: child,
    );
  }
}