import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import './actions.dart';

final themeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);
ThemeData _refresh(ThemeData themeData, action){
  themeData = action.themeData;
  return themeData;
}

final localeReducer = combineReducers<Locale>([
  TypedReducer<Locale, RefreshLocaleAction>(_changeLocale),
]);
Locale _changeLocale(Locale locale, RefreshLocaleAction action){
  locale = action.locale;
  return locale;
}