import 'package:flutter/material.dart';

import 'NewPass.dart';

class RestartPassword extends StatelessWidget {
  const RestartPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: resetpass(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class resetpass extends StatefulWidget {
  const resetpass({Key? key}) : super(key: key);

  @override
  State<resetpass> createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text('Forgot password'),
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
              'Reset password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Enter The code that we send to your Email',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Code',
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: '*****'),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: InkWell(
              onTap: poenNewPassword,
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

  void poenNewPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewPassword()));
  }
}
