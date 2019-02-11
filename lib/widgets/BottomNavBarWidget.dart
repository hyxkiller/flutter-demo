import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavBarWidgetState();
  }
}

class BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: changeIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('行情')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('交易')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('钱包')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('我的')),
      ],
    );
  }
}
