import 'package:flutter/material.dart';

class RepositoryListModel extends ChangeNotifier {
  String _searchWord = '';

  String get searchWord => _searchWord;

  set searchWord(String searchWord) {
    _searchWord = searchWord;
    notifyListeners();
  }
}
