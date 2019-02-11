import 'package:flutter/material.dart';
import '../../models/exchange.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewWidgetState();
  }
}

class ListViewWidgetState extends State<ListViewWidget>with AutomaticKeepAliveClientMixin {
  final _color = TextStyle(color: Color.fromARGB(255, 173, 183, 194));

  Widget listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
      margin: EdgeInsets.all(1.0),
      height: 66,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network(
            lists[index].imgUrl,
            height: 36.0,
            width: 36.0,
          ),
          // SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.fromLTRB(6.0, 1.0, 1.0, 1.0),
            alignment: Alignment.centerLeft,
            width: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      lists[index].baseCoin,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text('/' + lists[index].quoteCoin, style: _color),
                  ],
                ),
                Text(
                  lists[index].tradingVolume,
                  textAlign: TextAlign.left,
                  style: _color,
                ),
              ],
            ),
          ),
          Container(
            width: 113,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  lists[index].price,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  lists[index].tradingVolume,
                  style: _color,
                ),
              ],
            ),
          ),
          RaisedButton(
              child: Text(
                lists[index].percent,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              onPressed: () => debugPrint('22222'),
              color: lists[index].percent.indexOf('-') != -1
                  ? Color.fromRGBO(227, 68, 68, 1)
                  : Color.fromRGBO(60, 196, 114, 1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: listItemBuilder,
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
