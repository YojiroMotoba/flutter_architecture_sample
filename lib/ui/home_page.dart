import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  void initState() {
    super.initState();
    debugPrint('_HomePageState initState');
  }

  @override
  void dispose() {
    debugPrint('_HomePageState dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(
      'HomePageBody',
    );
  }

  @override
  bool get wantKeepAlive => true;
}
