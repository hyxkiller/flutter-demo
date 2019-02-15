import 'package:flutter/material.dart';
import 'zh-CN.dart';
import 'en-US.dart';
import 'localeBase.dart';

class DemoLocalizations {
  final Locale locale;
  DemoLocalizations(this.locale);
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, LocaleBase> _localizedValues = {
    'zh': LocaleZHCN(),
    'en': LocaleENUS(),
  };

  LocaleBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }
}
