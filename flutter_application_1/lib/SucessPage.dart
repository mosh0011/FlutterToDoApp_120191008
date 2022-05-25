import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Homepage.dart';

import 'Loginpage.dart';

class SucessPage extends StatelessWidget {
  const SucessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sucesspage(),
    );
  }
}

class sucesspage extends StatefulWidget {
  const sucesspage({Key? key}) : super(key: key);

  @override
  State<sucesspage> createState() => _sucesspageState();
}

class _sucesspageState extends State<sucesspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/image/success.png'))),
          ),
          Text(
            'Successfull !!',
            style: TextStyle(fontSize: 35),
          ),
          Text(
            'you have Successfully change password , please use new password to login ',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70,
          ),
          Center(
            child: InkWell(
              onTap: openHomepage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.blueAccent),
                child: Text(
                  'go to Home ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openHomepage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
