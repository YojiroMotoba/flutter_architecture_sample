import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';
import 'package:flutterarchitecturesample/model/search_word_dialog_model.dart';
import 'package:provider/provider.dart';

class SearchWordDialog {
  void show(BuildContext context, void Function(String) onPressedSearchButton) {
    showDialog<void>(
        context: context,
        builder: (context) => Provider<SearchWordDialogModel>(
              create: (_) => SearchWordDialogModel(),
              dispose: (_, model) => model.dispose(),
              child: SimpleDialog(
                shape: _dialogRoundedRectangleBorder,
                contentPadding: EdgeInsets.all(
                  0.0,
                ),
                children: <Widget>[
                  _dialogContents(onPressedSearchButton),
                ],
              ),
            ));
  }

  Widget _dialogContents(void Function(String) onPressedSearchButton) =>
      Consumer<SearchWordDialogModel>(
        builder: (_, model, __) => Column(
          children: [
            SizedBoxExt.heightMarginM,
            _dialogTitleText,
            Padding(
              padding: EdgeInsets.all(
                ConstSizes.marginM,
              ),
              child: model.textFormField,
            ),
            _searchButton(model.textFormField, onPressedSearchButton),
          ],
        ),
      );

  final _dialogTitleText = Text(
    '検索ワード',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  final _dialogRoundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(ConstSizes.dialogRadius),
    ),
  );

  RaisedButton _searchButton(
          TextFormField textFormField, void Function(String) onPressed) =>
      RaisedButton(
        child: Text('Button'),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () {
          onPressed(textFormField.controller.text);
        },
      );
}
