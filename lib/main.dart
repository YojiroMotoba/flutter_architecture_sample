import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterarchitecturesample/theme.dart';
import 'package:flutterarchitecturesample/ui/main_tab_page.dart';
import 'package:flutterarchitecturesample/ui/repository_detail_page.dart';
import 'package:flutterarchitecturesample/util/intl/app_localizations_delegate.dart';
import 'package:repository/app_http_overrides.dart';

void main() {
  HttpOverrides.global = AppHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: MyAppTheme.themeData(),
        home: MainTabPage(),
        routes: {
          RepositoryDetailPage.pageName: (_) => RepositoryDetailPage(),
        });
  }
}
