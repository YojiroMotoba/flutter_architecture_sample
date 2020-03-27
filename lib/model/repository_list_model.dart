import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:repository/api/github_api.dart';

class RepositoryListModel extends ChangeNotifier {
  StreamSubscription _searchSubscription;

  RepositoryListModel() {
    _searchSubscription =
        EventBusExt().on<RepositorySearchEvent>().listen((event) {
      _searchWord = event.data.searchWord;
      search();
    });
  }

  String _searchWord = '';

  String get searchWord => _searchWord;

  set searchWord(String searchWord) {
    _searchWord = searchWord;
    search();
  }

  void search() {
    GithubApi.searchRepositories(_searchWord).then((value) {
      debugPrint('value.statusCode=${value.statusCode}');
    }).catchError((Object error) {
      debugPrint(error.toString());
    });
    notifyListeners();
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    debugPrint('$this is disposed');
    super.dispose();
  }
}
