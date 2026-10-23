import 'package:flutter/material.dart';

class TextFieldAuth {
  InputDecoration decoration(
      BuildContext context,
      String hintText,
      ) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.headline4,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor)),
    );
  }
}