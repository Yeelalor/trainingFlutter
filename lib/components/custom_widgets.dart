// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

Widget inputFieldWidget(
  BuildContext context,
  Icon icon,
  String hintText,
  String lableText,
  Function onValidate,
  Function onSave, {
  String initialValue = '',
  bool autoFocus = false,
  bool obsecureText = false,
  int maxlenght = 30,
  var keyboardType = TextInputType.text,
  var maxLines,
}) {
  return TextFormField(
    validator: (value) {
      return onValidate(value);
    },
    onSaved: ((newValue) {
      return onSave(newValue.toString().trim());
    }),
    keyboardType: keyboardType,
    // maxLines: maxLines,
    // maxLength: maxlenght,
    autofocus: autoFocus,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: secondary_text, fontSize: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: primary),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: IconTheme(
          data: IconThemeData(color: primary),
          child: icon,
        ),
      ),
    ),
  );
}
