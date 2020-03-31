import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:http/http.dart';
import 'package:repository/api/github_api.dart';
import 'package:repository/api/response/repositories.dart';

class RepositoryListModel extends ChangeNotifier {
  StreamSubscription _searchSubscription;

  RepositoryListModel() {
    _searchSubscription =
        EventBusExt().on<RepositorySearchEvent>().listen((event) {
      _searchWord = event.data.searchWord;
      _search();
    });
  }

  String _searchWord = '';

  String get searchWord => _searchWord;

  set searchWord(String searchWord) {
    _searchWord = searchWord;
    _search();
  }

  void _search() {
    GithubApi.searchRepositories(_searchWord)
        .then((response) => _searchOnValue(response))
        .catchError((Object error) => _searchError(error))
        .whenComplete(() => _searchComplete());
  }

  void _searchOnValue(Response response) {
    debugPrint('value.statusCode=${response.statusCode}');
    debugPrint(response.body);
    final repositories = Repositories.fromJson(response.body);
    debugPrint('repositories.total_count=${repositories.total_count}');
    debugPrint('repositories.items.length=${repositories.items.length}');
    debugPrint('repositories.items[0]=${repositories.items[0].full_name}');
    debugPrint(
        'repositories.items[0].owner.avatar_url=${repositories.items[0].owner.avatar_url}');
  }

  void _searchError(Object error) {
    debugPrint(error.toString());
  }

  void _searchComplete() {
    debugPrint('_searchComplete');
    notifyListeners();
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    debugPrint('$this is disposed');
    super.dispose();
  }
}
