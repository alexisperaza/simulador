import 'package:flutter/material.dart';
import './ui/views/splash/splash.view.dart';
import './ui/views/add/name.view.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

