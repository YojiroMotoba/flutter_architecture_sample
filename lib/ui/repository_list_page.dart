import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';
import 'package:flutterarchitecturesample/model/repository_list_model.dart';
import 'package:flutterarchitecturesample/ui/repository_detail_page.dart';
import 'package:provider/provider.dart';

class RepositoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RepositoryListPageState();
}

// NOTE: StatefulWidgetである必要ないけど、AutomaticKeepAliveClientMixinがStatefulWidgetじゃないとなので…
// StatelessだとwantKeepAliveがtrueと同等の実装が分からず…
class _RepositoryListPageState extends State<RepositoryListPage>
    with AutomaticKeepAliveClientMixin<RepositoryListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('$this build!!!!');
    return ChangeNotifierProvider<RepositoryListModel>(
      create: (_) => RepositoryListModel(),
      child: Consumer<RepositoryListModel>(
          builder: (_, model, ___) => _body(model)),
    );
  }

  Widget _body(RepositoryListModel model) {
    return RefreshIndicator(
      child: ListView.builder(
        controller: model.scrollController,
        itemBuilder: (BuildContext context, int index) {
          debugPrint(
              'index=$index model.listDataMap.length=${model.listDataMap.length}');
          if (index < model.listDataMap.length) {
            dynamic listItemData =
                model.listDataMap.entries.elementAt(index).value;
            if (listItemData is ListDataDetail) {
              return _repositoryItem(model, listItemData);
            } else if (listItemData is ListDataLoading) {
              return Text('now loading');
            }
          }
          return null;
        },
      ),
      onRefresh: () {
        return model.search(0);
      },
    );
  }

  Widget _repositoryItem(
      RepositoryListModel model, ListDataDetail listDataDetail) {
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
          model.onTapListItem(listDataDetail);
          Navigator.pushNamed(context, RepositoryDetailPage.pageName,
              arguments: RepositoryDetailPageArguments(
                listDataDetail,
              ));
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
