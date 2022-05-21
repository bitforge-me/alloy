import 'package:flutter/material.dart';

import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

void snackMsg(BuildContext context, String msg,
    {int seconds = 3, MessageCategory category = MessageCategory.Info}) {
  IconData icon;
  Color color;
  switch (category) {
    case MessageCategory.Info:
      icon = Icons.info;
      color = ZapOnSecondary;
      break;
    case MessageCategory.Warning:
      icon = Icons.warning;
      color = ZapWarning;
      break;
  }
  var snackBar = SnackBar(
      duration: Duration(seconds: seconds),
      backgroundColor: ZapSecondary,
      content: Row(children: [
        SizedBox(
          width: 5,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        ),
        SizedBox(width: 10),
        Icon(icon, size: 28.0, color: color),
        SizedBox(width: 10),
        Text(msg, style: TextStyle(color: ZapOnSecondary))
      ]));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
