import 'package:flutter/material.dart';
import 'widgets/quotes/index.dart';
import 'widgets/quotes/UsdtWidget.dart';
import 'widgets/quotes/SearchWidget.dart';
import 'widgets/wallets/WalletWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  final List _body = [
    QuotesIndexWidget(),
    UsdtWidget(),
    UsdtWidget(),
    WalletWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 命名路由，无法动态传参
      routes: <String, WidgetBuilder>{
        '/search': (BuildContext context) => SearchWidget(),
      },
      home: Scaffold(
        body: _body[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.assessment), title: Text('行情')),
            BottomNavigationBarItem(icon: Icon(Icons.swap_vertical_circle), title: Text('交易')),
            BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('钱包')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('我的')),
          ],
        ),
      )
    );
  }
}
