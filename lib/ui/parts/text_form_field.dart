import 'package:flutter/material.dart';

class SingleTextFormField extends StatefulWidget {
  final _textEditingController = TextEditingController();

  TextEditingController get controller => _textEditingController;

  @override
  State<StatefulWidget> createState() =>
      _SingleTextFormFieldState(_textEditingController);
}

class _SingleTextFormFieldState extends State<SingleTextFormField> {
  _SingleTextFormFieldState(this._textEditingController);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLines: 2,
        textAlignVertical: TextAlignVertical.center,
        controller: _textEditingController,
      );

  @override
  void dispose() {
    this.
    _textEditingController.dispose();
    super.dispose();
  }
}
