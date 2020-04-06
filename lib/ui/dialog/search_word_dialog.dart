import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/constant/const_localized_keys.dart';
import 'package:flutterarchitecturesample/constant/const_size.dart';
import 'package:flutterarchitecturesample/ext/sized_box_ext.dart';
import 'package:flutterarchitecturesample/ext/string_ext.dart';
import 'package:flutterarchitecturesample/model/search_word_dialog_model.dart';
import 'package:flutterarchitecturesample/ui/parts/text_field_parts.dart';
import 'package:provider/provider.dart';

class SearchWordDialog {
  void show(BuildContext context, void Function(String) onPressedSearchButton) {
    showDialog<void>(
      context: context,
      builder: (context) => ChangeNotifierProvider<SearchWordDialogModel>(
        create: (_) => SearchWordDialogModel(),
        child: SimpleDialog(
          shape: _dialogRoundedRectangleBorder,
          contentPadding: EdgeInsets.all(
            0.0,
          ),
          children: <Widget>[
            _dialogContents(
              onPressedSearchButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialogContents(void Function(String) onPressedSearchButton) {
    return Consumer<SearchWordDialogModel>(
      builder: (_, model, __) => Column(
        children: [
          SizedBoxExt.heightMarginM,
          _dialogTitleText,
          Padding(
            padding: EdgeInsets.all(
              ConstSizes.marginM,
            ),
            child: singleTextFormField(model.textEditingController),
          ),
          _searchButton(model, onPressedSearchButton),
        ],
      ),
    );
  }

  final _dialogTitleText = Text(
    ConstLocalizedKeys.searchWord.localized(),
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  final _dialogRoundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        ConstSizes.dialogRadius,
      ),
    ),
  );

  RaisedButton _searchButton(
          SearchWordDialogModel model, void Function(String) onPressed) =>
      RaisedButton(
        child: Text(
          ConstLocalizedKeys.search.localized(),
        ),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () {
          onPressed(model.textEditingController.text);
        },
      );
}
