import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/model/home_page_model.dart';
import 'package:flutterarchitecturesample/ui/home_page.dart';
import 'package:flutterarchitecturesample/ui/search_page.dart';
import 'package:provider/provider.dart';

class MainTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  MainTabModel _model;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _model = MainTabModel();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _model.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ChangeNotifierProvider<MainTabModel>.value(
        value: _model,
        child: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: [
            HomePage(),
            SearchPage(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  void onPageChanged(int page) {
    debugPrint('onPageChanged $page');
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
          _pageController.jumpToPage(0);
        }),
        _bottomAppBarIcon(Icon(Icons.search), () {
          debugPrint('press bar icon search');
          _pageController.jumpToPage(1);
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
}
