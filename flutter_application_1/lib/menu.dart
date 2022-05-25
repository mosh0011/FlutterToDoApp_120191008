import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: menu(),
    );
  }
}

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();
  var notif = [
    'Who finish his task ?',
    'Git the task',
    'Review your task',
    'Update your information',
    'Please check for updates',
    'your task isnt complete'
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.redAccent,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 5,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("asset/image/aking.png"))),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "TK",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                notif[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(6, (i) {
      return "Notification ${i + 1}";
    });
    return list;
  }
}
