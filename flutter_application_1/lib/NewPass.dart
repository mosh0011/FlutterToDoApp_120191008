import 'package:flutter/material.dart';
import 'SucessPage.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: newpass(),
    );
  }
}

class newpass extends StatefulWidget {
  const newpass({Key? key}) : super(key: key);

  @override
  State<newpass> createState() => _newpassState();
}

class _newpassState extends State<newpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text('Crearte New passworf'),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Create New password',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Enter The New password',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Enter New Password',
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
              TextField(
                decoration:
                    InputDecoration(hintText: 'Enter new password here'),
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Confirm New Password',
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
              TextField(
                decoration:
                    InputDecoration(hintText: 'Confirm new password here'),
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: InkWell(
                onTap: opensucesspage,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.blueAccent),
                  child: Text(
                    'Change password ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void opensucesspage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SucessPage()));
  }
}
