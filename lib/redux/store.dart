import 'package:flutter/material.dart';
import './reducer.dart';

class HYXState {
  ThemeData themeData;
  Locale locale;
  HYXState({this.themeData, this.locale});
}
HYXState appReducer(HYXState state, action) {
  return HYXState(
    themeData: themeDataReducer(state.themeData, action),
    locale: localeReducer(state.locale, action),
  );
}