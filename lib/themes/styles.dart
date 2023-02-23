// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: primary,
    errorColor: accent,
    hoverColor: divider_color,
    colorScheme: ColorScheme.light(primary: primary),
    iconTheme: IconThemeData(
      color: primary_text,
    ),
    scaffoldBackgroundColor: icons,
    fontFamily: 'notosan',
    appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: icons,
        iconTheme: IconThemeData(color: icons),
        elevation: 0),
  );
}

const size_text = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
