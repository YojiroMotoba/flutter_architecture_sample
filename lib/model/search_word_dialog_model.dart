import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ext/auto_dispose.dart';

class SearchWordDialogModel with ChangeNotifier, AutoDispose {
  final textEditingController = TextEditingController();

  SearchWordDialogModel() {
    textEditingController.addDispose(this);
  }
}
