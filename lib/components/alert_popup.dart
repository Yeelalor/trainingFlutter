// ignore_for_file: body_might_complete_normally_nullable, prefer_conditional_assignment

import 'package:flutter/material.dart';

class Utility {
  static Utility? utility;

  static Utility? getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  showAlertDialog(BuildContext context, String title, String alertContent) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(alertContent),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
