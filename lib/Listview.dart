import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180,
          color: Colors.lightBlue,
        ),
        new Container(
          width: 180,
          color: Colors.black,
        ),
        new Container(
          width: 180,
          color: Colors.deepOrangeAccent,
        ),
        new Container(
          width: 180,
          color: Colors.indigo,
        )
      ],
    );
  }
}
