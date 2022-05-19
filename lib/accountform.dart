import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image/image.dart' as img;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zapdart/widgets.dart';
import 'package:zapdart/addr_search.dart';
import 'package:zapdart/autocomplete_service.dart';
import 'package:zapdart/form_ui.dart';
import 'package:zapdart/account_forms.dart';
import 'package:zapdart/colors.dart';
import 'colors.dart';

FormFieldValidator emailValidate = (value) {
  value = value?.trim();
  if (value == null || value.isEmpty) return 'Please enter an email';
  if (!EmailValidator.validate(value)) return 'Invalid email';
  return null;
};

FormFieldValidator passwordValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a password';
  return null;
};

class BronzeInputForm extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  FormFieldValidator<dynamic>? validator;
  bool? obscureText;
  BronzeInputForm(this.controller, this.validator,
      {this.keyboardType, this.obscureText})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.center,
        controller: this.controller,
        decoration: InputDecoration(
          fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
          filled: true,
          constraints: BoxConstraints(minWidth: 320, maxWidth: 320),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        keyboardType: this.keyboardType ?? null,
        obscureText: this.obscureText ?? false,
        validator: this.validator);
  }
}

class BronzeLoginForm extends StatefulWidget {
  final AccountLogin? login;
  final String? instructions;
  final bool showTwoFactorCode;

  BronzeLoginForm(this.login,
      {this.instructions, this.showTwoFactorCode = false})
      : super();

  @override
  BronzeLoginFormState createState() {
    return BronzeLoginFormState();
  }
}

class BronzeLoginFormState extends State<BronzeLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tfCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    if (widget.login != null) {
      _emailController.text = widget.login!.email;
      _passwordController.text = widget.login!.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Image.asset(
                      'logo.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.75),
                          fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please log in",
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 34),
                    ),
                    SizedBox(height: 15),
                    BronzeInputForm(_emailController, emailValidate,
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 8),
                    BronzeInputForm(_passwordController, passwordValidate,
                        obscureText: true),
                    SizedBox(height: 8),
                    Visibility(
                        visible: widget.showTwoFactorCode,
                        child: TextFormField(
                            controller: _tfCodeController,
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: 'Two Factor Code'))),
                    RoundedButton(() {
                      if (_formKey.currentState == null) return;
                      if (_formKey.currentState!.validate()) {
                        var accountLogin = AccountLogin(
                            _emailController.text.trim(),
                            _passwordController.text,
                            _tfCodeController.text);
                        Navigator.of(context).pop(accountLogin);
                      }
                    }, ZapOnSecondary, ZapSecondary, bronzeGradient, 'Continue',
                        holePunch: true, width: 320, height: 50),
                    raisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )))));
  }
}
