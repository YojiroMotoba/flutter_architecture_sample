import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_localized_keys.dart';

class Localized {
  Localized(this.locale) {
    final languageCode = locale.languageCode.toLowerCase();
    _languageCode =
        _localizedValues.containsKey(languageCode) ? languageCode : 'ja';
  }

  static String _languageCode = 'ja';

  final Locale locale;

  static Localized of(BuildContext context) =>
      Localizations.of<Localized>(context, Localized);

  static const Map<String, Map<String, String>> _localizedValues = {
    'ja': {
      ConstLocalizedKeys.searchWord: '検索ワード',
      ConstLocalizedKeys.search: '検索',
    },
  };

  static String get(String localizedKey) =>
      _localizedValues[_languageCode][localizedKey];
}
