import 'package:flutter/material.dart';

class UserMainPage extends StatefulWidget {
  UserMainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _UserMainPageState createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 15.0,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => {
                Navigator.pop(context)
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      )
    );
  }
}
