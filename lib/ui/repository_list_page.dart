import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';

class RepositoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage>
    with AutomaticKeepAliveClientMixin<RepositoryListPage> {
  StreamSubscription _searchSubscription;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    debugPrint('_RepositoryListPageState initState');
    _searchSubscription = eventBus.on<RepositorySearchEvent>().listen((event) {
      debugPrint(event.data.searchWord);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(
      'RepositoryListPageBody',
    );
  }

  @override
  void dispose() {
    debugPrint('_RepositoryListPageState dispose');
    _searchSubscription.cancel();
    super.dispose();
  }
}
