import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

import 'paydb.dart';
import 'cryptocurrency.dart';
import 'prefs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController sendAddress = TextEditingController();
  TextEditingController sendAmount = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text("amount"),
          TextFormField(
            controller: sendAmount,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter an amount";
              }
            },
          ),
          Text("address"),
          TextFormField(
            controller: sendAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter an address";
              }
            },
          ),
          FlatButton(
            child: Text("OK"),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context, rootNavigator: true).pop();
              }
            },
          ),
        ],
      ),
    ));
  }
}
