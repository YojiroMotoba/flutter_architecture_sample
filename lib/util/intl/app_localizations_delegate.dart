import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/util/intl/localized.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ja'].contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) async => Localized(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
