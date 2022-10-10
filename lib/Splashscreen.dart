import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latihan_listview/ListAllFootball.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
void initState() {
  super.initState();
  Timer(Duration(seconds: 3), () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListAllFootbal(),
        ));
  });
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        color: Color(0xFF9D00FF),
        child: Center(
          child: Image(
            image: AssetImage("assets/PremiereLogo2.png"),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
    ),
  );
}
}
