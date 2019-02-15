import 'package:flutter/material.dart';
import 'package:demo1/locales/localization_src.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:demo1/redux/store.dart';
import 'package:demo1/utils/common.dart';

class ExchangeWidget extends StatefulWidget {
  @override
  _ExchangeWidgetState createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  void _showLangDialog(BuildContext context, store) {
    List<String> list = [
      '中文',
      '英文',
    ];
    CommonUtils.showCommitLangDialog(context, list, (index){
      CommonUtils.changeLocale(store, index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HYXState>(
      builder: (context, store) {
        return Container(
          child: Column(
            children: <Widget>[
              Text(store.state.locale.toString()),
              Text(store.state.locale.toString()),
              Text(store.state.locale.toString()),
              RaisedButton(
                  child: Text(DemoLocalizations.of(context).currentLocalized.title),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime.now()
                          .subtract(new Duration(days: 30)), // 减 30 天
                      lastDate: new DateTime.now()
                          .add(new Duration(days: 30)), // 加 30 天
                      locale: store.state.locale  // flutter原生组件locale属性引用全局变量
                    ).then((val) {
                      print(val);
                    });
                  }),
              ListTile(
                title: Text('切换语言'),
                onTap: () {
                  _showLangDialog(context, store);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
