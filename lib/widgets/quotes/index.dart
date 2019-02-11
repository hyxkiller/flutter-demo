import 'package:flutter/material.dart';
import 'ListViewWidget.dart';
import 'UsdtWidget.dart';

class QuotesIndexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('行情'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.of(context).pushNamed('/search'),
              // onPressed: () => Navigator.pushNamed(context, '/search'),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.amberAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(text: '自选'),
              Tab(text: 'USDT'),
              Tab(text: 'BTC'),
              Tab(text: 'ETH'),
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
      ),
    );
  }
}
