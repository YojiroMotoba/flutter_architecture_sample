import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';

extension TextFieldExt on TextField {
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
}
