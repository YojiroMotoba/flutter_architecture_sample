import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("_SearchPageState initState");
  }

  @override
  void dispose() {
    debugPrint("_SearchPageState dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'SearchPageBody',
    );
  }
}
