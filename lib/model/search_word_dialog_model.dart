import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ui/parts/text_field_parts.dart';

class SearchWordDialogModel {
  final textFormField = singleTextFormField();

  void dispose() {
    textFormField.controller.dispose();
    debugPrint('$this is disposed');
  }
}
