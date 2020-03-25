import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';
import 'package:flutterarchitecturesample/constant/const_icon.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/event/event.dart';
import 'package:flutterarchitecturesample/event/repository_search_event.dart';
import 'package:flutterarchitecturesample/model/home_page_model.dart';
import 'package:flutterarchitecturesample/ui/home_page.dart';
import 'package:flutterarchitecturesample/ui/repository_list_page.dart';
import 'package:flutterarchitecturesample/ui/search_word_dialog.dart';
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
            RepositoryListPage(),
            HomePage(),
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
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: ConstIcons.create,
          onPressed: () => SearchWordDialog().show(
            context,
            _onPressedSearchButton,
          ),
        ),
      ],
    );
  }

  void _onPressedSearchButton(String searchWord) {
    eventBus.fire(
      RepositorySearchEvent(
        RepositorySearchEventData()..searchWord = searchWord,
      ),
    );
  }

  BottomAppBar _bottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
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
        _bottomAppBarIcon(ConstIcons.home, () {
          debugPrint('press bar icon home');
          _pageController.jumpToPage(0);
        }),
        _bottomAppBarIcon(ConstIcons.search, () {
          debugPrint('press bar icon search');
          _pageController.jumpToPage(1);
        }),
        _bottomAppBarIcon(ConstIcons.notifications, () {
          debugPrint('press bar icon notifications');
        }),
        _bottomAppBarIcon(ConstIcons.list, () {
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
