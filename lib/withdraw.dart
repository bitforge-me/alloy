import 'package:flutter/material.dart';

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
          TextButton(
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
