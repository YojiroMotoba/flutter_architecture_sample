import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ext/auto_dispose.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';
import 'package:flutterarchitecturesample/model/repository_list_model.dart';
import 'package:provider/provider.dart';

class RepositoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RepositoryListPageState();
}

// NOTE: StatefulWidgetである必要ないけど、AutomaticKeepAliveClientMixinがStatefulWidgetじゃないとなので…
// StatelessだとwantKeepAliveがtrueと同等の実装が分からず…
class _RepositoryListPageState extends State<RepositoryListPage>
    with AutomaticKeepAliveClientMixin<RepositoryListPage>, AutoDispose {
  @override
  bool get wantKeepAlive => true;

  ScrollController _scrollController;
  RepositoryListModel _model;

  @override
  void initState() {
    super.initState();
    debugPrint('$this initState');
    _model = RepositoryListModel();
    _initScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('$this didChangeDependencies');
  }

  @override
  void dispose() {
    debugPrint('$this dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('$this build!!!!');
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<RepositoryListModel>(builder: (_, __, ___) => _body()),
    );
  }

  Widget _body() {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        debugPrint(
            'index=$index model.listDataMap.length=${_model.listDataMap.length}');
        if (index < _model.listDataMap.length) {
          return _repositoryItem(
              _model.listDataMap.entries.elementAt(index).value);
        }
        return null;
      },
    );
  }

  void _initScrollController() {
    _scrollController = ScrollController()..addDispose(this);
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      if (maxScrollExtent > 0 && (maxScrollExtent - 20.0) <= currentPosition) {
        _model.search();
      }
    });
  }

  Widget _repositoryItem(ListDataDetail listDataDetail) {
    return Container(
      decoration: _listDivider(),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Image.network(
              listDataDetail.avatarUrl,
              width: 60,
              height: 60,
            ),
            SizedBoxExt.widthMarginL,
            Flexible(
              child: Text(
                listDataDetail.fullName,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: () {
          debugPrint('onTap called.${listDataDetail.fullName}');
        },
      ),
    );
  }

  BoxDecoration _listDivider() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
