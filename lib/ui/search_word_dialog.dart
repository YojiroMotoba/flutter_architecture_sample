import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';
import 'package:flutterarchitecturesample/ext/text_field_ext.dart';

const _dialogTitleText = Text(
  '検索ワード',
  style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
);

var _searchWordTextField = TextField(
  maxLines: 1,
  textAlignVertical: TextAlignVertical.center,
  decoration: InputDecoration(
    enabledBorder: TextFieldExt.enabledUnderlineInputBorder,
    focusedBorder: TextFieldExt.focusedUnderlineInputBorder,
    contentPadding: EdgeInsets.all(0.0),
  ),
);

const _dialogRoundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(ConstSizes.dialogRadius),
  ),
);

RaisedButton _searchButton(VoidCallback onPressed) => RaisedButton(
      child: Text('Button'),
      color: Colors.orange,
      textColor: Colors.white,
      onPressed: () {},
    );

void showSearchTextDialog(
    BuildContext context, VoidCallback onPressedSearchButton) {
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
              child: _searchWordTextField,
            ),
            _searchButton(onPressedSearchButton),
          ]),
        ],
      );
    },
  );
}
