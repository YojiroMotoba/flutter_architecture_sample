import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/model/repository_list_model.dart';
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
  void initState() {
    super.initState();
    debugPrint('$this initState');
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
    return ChangeNotifierProvider<RepositoryListModel>(
      create: (_) => RepositoryListModel(),
      child: Consumer<RepositoryListModel>(builder: (_, model, __) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            debugPrint('index=$index model.listDataMap.length=${model.listDataMap.length}');
            if (index < model.listDataMap.length) {
              return _repositoryItem(
                  model.listDataMap.entries.elementAt(index).value);
            }
            return null;
          },
        );
      }),
    );
  }

  Widget _repositoryItem(ListDataDetail listDataDetail) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          listDataDetail.fullName,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          print('onTap called.${listDataDetail.fullName}');
        },
      ),
    );
  }
}
