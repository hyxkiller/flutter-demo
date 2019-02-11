import 'package:flutter/material.dart';
import 'TestRoute.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => new _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _value;

  void _changeValue(e) {
    setState(() {
      this._value = e;
    });
    debugPrint(this._value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 240.0,
                  height: 30.0,
                  child: TextField(
                    key: _formKey,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        // icon: Icon(Icons.text_fields),
                        labelText: this._value == '' ? '' : '搜索',
                        // helperText: '搜索',
                        // counterText: "搜索",
                        // suffixText: "搜索",
                        // prefixText: "搜索",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        fillColor: Color.fromRGBO(241, 244, 247, 1)),
                    onChanged: _changeValue,
                    autofocus: false,
                  ),
                ),
                FlatButton(
                  child: Text('取消'),
                  onPressed: () => Navigator.of(context).pop(),
                  textColor: Color.fromRGBO(200, 207, 214, 1),
                ),
              ],
            ),
            FlatButton(
              child: Text('测试动态路由'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return TestRoute(title: '传参');
                }));
                // Navigator.of(context).push(MaterialPageRoute(builder: (_){
                //   return TestRoute(title: '传参');
                // }));
              },
              textColor: Color.fromRGBO(200, 207, 214, 1),
            ),
            Container(
              child: Text('111'),
            )
          ],
        ),
      ),
    );
  }
}
