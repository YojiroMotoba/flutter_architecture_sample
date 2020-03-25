import 'package:flutter/material.dart';

TextFormField singleTextFormField() => TextFormField(
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      controller: TextEditingController(),
    );
