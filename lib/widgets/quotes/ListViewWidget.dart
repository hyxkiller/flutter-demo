import 'package:flutter/material.dart';
import '../../models/exchange.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewWidgetState();
  }
}

// AutomaticKeepAliveClientMixin保持组件状态
class ListViewWidgetState extends State<ListViewWidget>
    with AutomaticKeepAliveClientMixin {
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

  Future<Null> _onRefresh() async {
    // 用Future模拟异步
    await Future.delayed(Duration(seconds: 3), () {
      debugPrint('下拉刷新');
    });
  }

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreWidget();
        Future.delayed(Duration(seconds: 1), () {
          debugPrint('上拉加载');
        });
      }
    });
  }

  Widget _getMoreWidget() {
    debugPrint('bottom');
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: listItemBuilder,
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
