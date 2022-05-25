import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: likes(),
    );
  }
}

class likes extends StatefulWidget {
  const likes({Key? key}) : super(key: key);

  @override
  State<likes> createState() => _likesState();
}

class _likesState extends State<likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Likes Task'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
