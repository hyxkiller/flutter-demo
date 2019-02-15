import 'package:flutter/material.dart';
// import 'dart:io';
import 'dart:convert';
import 'package:demo1/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:demo1/locales/localization_src.dart';

class WalletWidget extends StatefulWidget {
  // final String title, price;
  // WalletWidget(this.title, this.price);
  @override
  _WalletWidgetState createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  List newTitle = [];
  // var newTitle = 'Unknown';
  // void initState() async {
  //   super.initState();
  //   // var http = HttpClient();
  //   // var resBody;
  //   // const url = 'http://localhost:9002/tabs';
  //   // var req = await http.getUrl(Uri.parse(url));
  //   // var res = await req.close();
  //   // var json = await res.transform(UTF8.decoder).join();
  //   // var data = JSON.decode(json);
  //   // debugPrint(res.toString());
  //   // String result = data['origin'];
  //   setState(() {
  //     // newTitle = res;
  //   });
  //   // if(res.statuscode == 200){
  //   //   resBody = await res.tr
  //   // }
  // }

  @override
  void initState() {
    super.initState();
    // _getData();
  }

  _getData() async {
    String url = 'http://localhost:9002/tabs';
    var res = await http.get(url);
    List list = json.decode(res.body);
    print(list);
    debugPrint(list.toString());
    setState(() {
      newTitle = list;
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return StoreConnector<HYXState, Locale>(
      converter: (store) => store.state.locale,
      builder: (context, locale){
        return Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('222222'),
              // child: Text('$newTitle'),
              width: 200,
            ),
            Container(
              child: Text(DemoLocalizations.of(context).currentLocalized.haha),
              // child: Text('$newTitle'),
              width: 200,
            ),
          ],
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: _itemBuilder,
    );
  }
}
