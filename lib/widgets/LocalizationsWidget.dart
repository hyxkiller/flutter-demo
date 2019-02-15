import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:demo1/redux/store.dart';

class LocalizationsWidget extends StatefulWidget {
  final Widget child;
  LocalizationsWidget({this.child}) : super();

  @override
  _LocalizationsWidgetState createState() => _LocalizationsWidgetState();
}

class _LocalizationsWidgetState extends State<LocalizationsWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HYXState>(builder: (context, store){
      return Localizations.override(
        child: widget.child,
        context: context,
        locale: store.state.locale,
      );
    });
  }
}