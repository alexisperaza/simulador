import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Background extends StatelessWidget  {
  final Widget child;
  const Background({
    Key ? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context ){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,

        body: Container(
        color: Color(0xff003084),
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom:0,
                right: 0,
                child: Image.asset(
                    'assets/images/enmascarar.png',
                    width: size.width *0.4
                ),
              ),
              child,
            ],
          ),
        )

      )
    );
  }


}
