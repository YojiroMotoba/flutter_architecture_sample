import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';

class SearchWordDialog {
  final _dialogTitleText = Text(
    '検索ワード',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  final _searchWordTextFormField = TextFormField(
    maxLines: 1,
    textAlignVertical: TextAlignVertical.center,
    controller: TextEditingController(),
    maxLength: 40,
  );

  final _dialogRoundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(ConstSizes.dialogRadius),
    ),
  );

  RaisedButton _searchButton(void Function(String) onPressed) => RaisedButton(
        child: Text('Button'),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () {
          onPressed(_searchWordTextFormField.controller.text);
        },
      );

  void show(BuildContext context, void Function(String) onPressedSearchButton) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: _dialogRoundedRectangleBorder,
          contentPadding: EdgeInsets.all(
            0.0,
          ),
          children: <Widget>[
            Column(children: [
              SizedBoxExt.heightMarginM,
              _dialogTitleText,
              Padding(
                padding: EdgeInsets.all(
                  ConstSizes.marginM,
                ),
                child: _searchWordTextFormField,
              ),
              _searchButton(onPressedSearchButton),
            ]),
          ],
        );
      },
    );
  }
}
