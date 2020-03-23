import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/theme.dart';
import 'package:flutterarchitecturesample/ui/main_tab_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyAppTheme.themeData(),
      home: MainTabPage(),
    );
  }
}
