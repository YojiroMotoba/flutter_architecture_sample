import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';

class RepositoryListModel extends ChangeNotifier {
  StreamSubscription _searchSubscription;

  RepositoryListModel() {
    debugPrint('$this constructor!!!!!!!!');
    _searchSubscription = eventBus.on<RepositorySearchEvent>().listen((event) {
      debugPrint('search event received!!! ${event.data.searchWord}');
      _searchWord = event.data.searchWord;
    });
  }

  String _searchWord = '';

  String get searchWord => _searchWord;

  set searchWord(String searchWord) {
    _searchWord = searchWord;
    search();
  }

  void search() {
    // TODO : リポジトリの検索する
    notifyListeners();
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    debugPrint('$this is disposed');
    super.dispose();
  }
}
