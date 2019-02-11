import 'package:flutter/material.dart';

class UsdtWidget extends StatelessWidget {
  // Stack 可以增加定位组件
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 70,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        Positioned(
            left: 30,
            top: 30,
            child: Icon(Icons.ac_unit, color: Colors.yellow, size: 50))
      ],
    );
  }
}
