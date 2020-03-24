import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';

extension TextFieldExt on TextField {
  static const UnderlineInputBorder defaultUnderlineInputBorder =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: ConstColors.grey,
    ),
  );
}
