import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepositoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage>
    with AutomaticKeepAliveClientMixin<RepositoryListPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('_RepositoryListPageState initState');
  }

  @override
  void dispose() {
    debugPrint('_RepositoryListPageState dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(
      'RepositoryListPageBody',
    );
  }

  @override
  bool get wantKeepAlive => true;
}
