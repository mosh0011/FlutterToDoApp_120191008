import 'package:flutter/material.dart';
import 'package:flutter_application_1/openRestartPassword.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: forgotpassword(),
    );
  }
}

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Forgot password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'please enter your mail ID to recive your password and reset information ',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Mail ID',
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'example@gmail.com'),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: InkWell(
              onTap: openRestartPassword,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.blueAccent),
                child: Text(
                  'Send Request ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void openRestartPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RestartPassword()));
  }
}
