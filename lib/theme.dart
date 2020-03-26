import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData themeData() => ThemeData.light().copyWith(
        primaryTextTheme: _blackMountainView,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: enabledUnderlineInputBorder,
          focusedBorder: focusedUnderlineInputBorder,
          contentPadding: EdgeInsets.all(0.0),
        ),
      );

  static final UnderlineInputBorder enabledUnderlineInputBorder =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: ConstColors.grey.shade600,
    ),
  );

  static final UnderlineInputBorder focusedUnderlineInputBorder =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: ConstColors.grey.shade900,
    ),
  );

  static const _fontFamily = 'Roboto';
  static const TextTheme _blackMountainView = TextTheme(
    display4: TextStyle(
      debugLabel: 'blackMountainView display4',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    display3: TextStyle(
      debugLabel: 'blackMountainView display3',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    display2: TextStyle(
      debugLabel: 'blackMountainView display2',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    display1: TextStyle(
      debugLabel: 'blackMountainView display1',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    headline: TextStyle(
      debugLabel: 'blackMountainView headline',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    title: TextStyle(
      debugLabel: 'blackMountainView title',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    subhead: TextStyle(
      debugLabel: 'blackMountainView subhead',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    body2: TextStyle(
      debugLabel: 'blackMountainView body2',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    body1: TextStyle(
      debugLabel: 'blackMountainView body1',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    caption: TextStyle(
      debugLabel: 'blackMountainView caption',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    button: TextStyle(
      debugLabel: 'blackMountainView button',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    subtitle: TextStyle(
      debugLabel: 'blackMountainView subtitle',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
    overline: TextStyle(
      debugLabel: 'blackMountainView overline',
      fontFamily: _fontFamily,
      inherit: true,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
  );
}
