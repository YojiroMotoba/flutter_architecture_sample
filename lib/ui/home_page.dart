import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Text(
        'HomePageBody',
      ),
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
}
