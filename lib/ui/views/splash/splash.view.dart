import 'package:flutter/material.dart';
import 'package:simulador/ui/views/add/name.view.dart';

class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState(){
    Future.delayed(Duration(milliseconds: 3000),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Name()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          child: Center(
            child: Image.asset(
              'assets/images/introgif.gif',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          )
      ),
    );
  }
}
