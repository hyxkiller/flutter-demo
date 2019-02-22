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
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HYXState>(
      builder: (context, store) {
        return Container(
          padding: CommonUtils.topPadding(context),
          child: Column(
            children: <Widget>[
              Text(store.state.locale.toString()),
              Text(store.state.locale.toString()),
              Text(DemoLocalizations.of(context).currentLocalized.title),
            ],
          ),
        );
      },
    );
  }
}
