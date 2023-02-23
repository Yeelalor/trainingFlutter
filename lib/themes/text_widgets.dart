// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

class HeadingText extends Text {
  HeadingText(String data, {TextStyle? style})
      : super(
          data,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primary_text,
          ),
        );
}
