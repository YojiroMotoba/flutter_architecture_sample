import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_colors.dart';

extension TextFormFieldExt on TextFormField {
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

  static final InputDecoration simpleInputDecoration = InputDecoration(
    enabledBorder: TextFormFieldExt.enabledUnderlineInputBorder,
    focusedBorder: TextFormFieldExt.focusedUnderlineInputBorder,
    contentPadding: EdgeInsets.all(0.0),
  );
}
