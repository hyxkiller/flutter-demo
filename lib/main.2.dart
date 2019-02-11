import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'translations.dart';
import 'widgets/ListViewWidget.dart';
import 'widgets/DrawerWidget.dart';
import 'widgets/BottomNavBarWidget.dart';
import 'widgets/UsdtWidget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('行情'),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     tooltip: 'search',
          //     onPressed: () => debugPrint('22222'),
          //   )
          // ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.amberAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(text: '自选',),
              Tab(text: 'USDT',),
              Tab(text: 'BTC',),
              Tab(text: 'ETH',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewWidget(),
            UsdtWidget(),
            Icon(Icons.local_airport, size: 128, color: Colors.black12),
            Icon(Icons.list, size: 128, color: Colors.black12),
          ],
        ),
        endDrawer: DrawerWidget(),
        bottomNavigationBar: BottomNavBarWidget(),
      )
    );
  }
}

