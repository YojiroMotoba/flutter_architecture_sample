import 'package:flutter/material.dart';

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

  static final Map<String, Map<String, String>> _localizedValues = {
    'ja': {
      LocalizedKeys.searchWord: '検索ワード',
    },
  };

  static String get(String localizedKey) =>
      _localizedValues[_languageCode][localizedKey];
}

class LocalizedKeys {
  static const searchWord = 'searchWord';
}

extension StringExt on String {
  String localized() => Localized.get(this);
}
