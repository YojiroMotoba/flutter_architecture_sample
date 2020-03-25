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
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('$this build!!!!');
    return ChangeNotifierProvider<RepositoryListModel>(
      create: (_) => RepositoryListModel(),
      child: Consumer<RepositoryListModel>(builder: (_, model, __) {
        return Text('$this');
      }),
    );
  }

  @override
  void dispose() {
    debugPrint('$this dispose');
    super.dispose();
  }
}
