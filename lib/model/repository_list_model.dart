import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:flutterarchitecturesample/ext/auto_dispose.dart';
import 'package:http/http.dart';
import 'package:repository/api/github_api.dart';
import 'package:repository/api/response/repositories.dart';

class RepositoryListModel with ChangeNotifier, AutoDispose {
  // public
  int totalCount = 0;
  Map<int, dynamic> listDataMap = <int, dynamic>{};

  String get searchWord => _searchWord;

  // private
  int _page = 0;
  bool _isLoading = false;
  ScrollController scrollController;
  String _searchWord = '';

  RepositoryListModel() {
    EventBusExt().on<RepositorySearchEvent>().listen((event) {
      _searchWord = event.data.searchWord;
      search(0);
    }).addDispose(this);

    scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = scrollController.position.maxScrollExtent;
        final currentPosition = scrollController.position.pixels;
        if (maxScrollExtent > 0 &&
            (maxScrollExtent - 20.0) <= currentPosition) {
          search(_page);
        }
      })
      ..addDispose(this);
  }

  Future<void> search(int page) async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    if (page > 0) {
      listDataMap[-1] = ListDataLoading();
      notifyListeners();
    }

    try {
      final response = await GithubApi().searchRepositories(_searchWord, page);
      _searchOnValue(response, page);
    } catch (e, stackTrace) {
      _searchError(e);
    } finally {
      _searchComplete();
    }
  }

  void onTapListItem(ListDataDetail listDataDetail) {
    debugPrint('onTap called.${listDataDetail.fullName}');
  }

  void _searchOnValue(Response response, int page) {
    // TODO statusCodeによるハンドリングを共通化する
    debugPrint('value.statusCode=${response.statusCode}');
    debugPrint(response.body);
    final repositories = Repositories.fromJson(response.body);
    if (listDataMap == null || page == 0) {
      listDataMap = <int, dynamic>{};
    }
    debugPrint('repositories.total_count=${repositories.total_count}');
    totalCount = repositories.total_count;
    for (var item in repositories.items) {
      listDataMap[item.id] = _convertResponseToListEntity(item);
    }
    _page = (page += 1);
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
    listDataMap.remove(-1);
    notifyListeners();
    _isLoading = false;
  }
}

class ListDataDetail {
  String fullName;
  String avatarUrl;
  String htmlUrl;
}

class ListDataLoading {}
