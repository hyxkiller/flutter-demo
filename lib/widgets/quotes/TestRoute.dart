import 'package:flutter/material.dart';

class TestRoute extends StatefulWidget {
  final String title;
  TestRoute({this.title});
  
  @override
  _TestRouteState createState() => _TestRouteState();
}

class _TestRouteState extends State<TestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlatButton(
          child: Text('dialog'),
          onPressed: () => showDialog(
            context: context,
            builder:  (BuildContext context) => new AlertDialog(title: new Text(widget.title) ),
          ),
        ),
      ),
    );
  }
}