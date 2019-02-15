import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'localization_src.dart';

class DemoLocalizationDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);
  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }
  @override
  bool shouldReload(DemoLocalizationDelegate old) => false;
  
  static DemoLocalizationDelegate delegate = DemoLocalizationDelegate();
}