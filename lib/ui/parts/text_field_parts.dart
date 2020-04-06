import 'package:flutter/material.dart';

TextFormField singleTextFormField(TextEditingController textEditingController) => TextFormField(
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      controller: textEditingController,
    );
