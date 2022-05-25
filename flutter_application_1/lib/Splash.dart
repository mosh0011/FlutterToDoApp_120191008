import 'package:flutter/material.dart';
import 'package:flutter_application_1/Loginpage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new _SplashScreen(),
  ));
}

class _SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      // ignore: prefer_const_constructors
      navigateAfterSeconds: Loginpage(),
      image: Image.asset('asset/image/aking.png'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
    );
  }
}
