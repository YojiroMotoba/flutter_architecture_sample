import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';

extension SizedBoxExt on SizedBox {
  static const SizedBox heightMarginM = SizedBox(
    height: ConstSizes.marginM,
  );
  static const SizedBox widthMarginL = SizedBox(
    width: ConstSizes.marginL,
  );
}
