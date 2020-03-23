import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/model/home_page_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _model = HomePageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ChangeNotifierProvider<HomePageModel>.value(
        value: _model,
        child: Text(
          'HomePageBody',
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ConstColors.white,
      title: Text(
        'サンプルアプリ',
      ),
    );
  }

  BottomAppBar _bottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: ConstSizes.bottomAppBarHeight,
        child: _bottomAppBarRow(),
      ),
    );
  }

  Row _bottomAppBarRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _bottomAppBarIcon(Icon(Icons.home), () {
          debugPrint('press bar icon home');
        }),
        _bottomAppBarIcon(Icon(Icons.search), () {
          debugPrint('press bar icon search');
        }),
        _bottomAppBarIcon(Icon(Icons.notifications), () {
          debugPrint('press bar icon notifications');
        }),
        _bottomAppBarIcon(Icon(Icons.list), () {
          debugPrint('press bar icon list');
        }),
      ],
    );
  }

  IconButton _bottomAppBarIcon(Icon icon, void Function() onPressed) {
    return IconButton(
      iconSize: ConstSizes.bottomAppBarIcon,
      icon: icon,
      onPressed: onPressed,
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}
