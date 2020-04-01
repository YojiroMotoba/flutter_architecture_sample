import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:http/http.dart';
import 'package:repository/api/github_api.dart';
import 'package:repository/api/response/repositories.dart';

class RepositoryListModel extends ChangeNotifier {
  StreamSubscription _searchSubscription;
  int totalCount = 0;
  Map<int, ListDataDetail> listDataMap = <int, ListDataDetail>{};

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
    // TODO statusCodeによるハンドリングを共通化する
    debugPrint('value.statusCode=${response.statusCode}');
    debugPrint(response.body);
    final repositories = Repositories.fromJson(response.body);
    listDataMap ??= <int, ListDataDetail>{};
    debugPrint('repositories.total_count=${repositories.total_count}');
    totalCount = repositories.total_count;
    for (var item in repositories.items) {
      listDataMap.putIfAbsent(
          item.id, () => _convertResponseToListEntity(item));
    }
  }

  ListDataDetail _convertResponseToListEntity(Item item) {
    return ListDataDetail()
      ..avatarUrl = item.owner.avatar_url
      ..fullName = item.full_name
      ..htmlUrl = item.owner.html_url;
  }

  void _searchError(Object error) {
    debugPrint(error.runtimeType.toString());
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

class ListDataDetail {
  String fullName;
  String avatarUrl;
  String htmlUrl;
}
