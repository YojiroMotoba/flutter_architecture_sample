import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:flutterarchitecturesample/ext/auto_dispose.dart';
import 'package:http/http.dart';
import 'package:repository/api/github_api.dart';
import 'package:repository/api/response/repositories.dart';

class RepositoryListModel extends ChangeNotifier {
  // public
  int totalCount = 0;
  Map<int, ListDataDetail> listDataMap = <int, ListDataDetail>{};

  String get searchWord => _searchWord;

  // private
  int _page = 0;
  bool _isLoading = false;
  ScrollController scrollController;
  String _searchWord = '';

  set searchWord(String searchWord) {
    _searchWord = searchWord;
    search();
  }

  RepositoryListModel(AutoDispose autoDispose) {
    EventBusExt().on<RepositorySearchEvent>().listen((event) {
      _searchWord = event.data.searchWord;
      search();
    }).addDispose(autoDispose);

    scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = scrollController.position.maxScrollExtent;
        final currentPosition = scrollController.position.pixels;
        if (maxScrollExtent > 0 &&
            (maxScrollExtent - 20.0) <= currentPosition) {
          search();
        }
      })
      ..addDispose(autoDispose);
  }

  void search() {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    GithubApi()
        .searchRepositories(_searchWord, _page)
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
    _page += 1;
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
    _isLoading = false;
  }
}

class ListDataDetail {
  String fullName;
  String avatarUrl;
  String htmlUrl;
}
