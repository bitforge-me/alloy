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

FormFieldValidator firstNameValidate = (value) {
  if (value != null && value.isEmpty) return 'Please enter a first name';
  return null;
};

FormFieldValidator lastNameValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a last name';
  return null;
};

FormFieldValidator newPasswordValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a new password';
  return null;
};

class BronzeInputForm extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  FormFieldValidator<dynamic>? validator;
  String? labelText;
  bool? obscureText;
  BronzeInputForm(this.controller,
      {this.validator, this.keyboardType, this.obscureText, this.labelText})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.center,
        controller: this.controller,
        decoration: InputDecoration(
          fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
          filled: true,
          labelText: this.labelText ?? null,
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
        validator: this.validator ?? null);
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
                    BronzeInputForm(_emailController,
                        validator: emailValidate,
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 8),
                    BronzeInputForm(_passwordController,
                        validator: passwordValidate, obscureText: true),
                    SizedBox(height: 8),
                    Visibility(
                      visible: widget.showTwoFactorCode,
                      child: BronzeInputForm(_tfCodeController,
                          obscureText: true, labelText: "2FA Code"),
                    ),
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
                    RoundedButton(() {
                      Navigator.of(context).pop();
                    }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                        'Create an Account',
                        holePunch: true, width: 320, height: 50),
                  ],
                )))));
  }
}

class BronzeRegisterForm extends StatefulWidget {
  final AccountRegistration? registration;
  final String? instructions;
  final bool showName;
  final bool showImage;
  final bool showEmail;
  final bool showMobileNumber;
  final bool requireMobileNumber;
  final String? initialMobileCountry;
  final List<String>? preferredMobileCountries;
  final bool showAddress;
  final bool requireAddress;
  final String? googlePlaceApiKey;
  final String? locationIqApiKey;
  final bool showCurrentPassword;
  final bool showNewPassword;

  BronzeRegisterForm(this.registration,
      {this.instructions,
      this.showName: true,
      this.showImage: true,
      this.showEmail: true,
      this.showMobileNumber: false,
      this.requireMobileNumber: false,
      this.initialMobileCountry,
      this.preferredMobileCountries,
      this.showAddress: false,
      this.requireAddress: false,
      this.googlePlaceApiKey,
      this.locationIqApiKey,
      this.showCurrentPassword: false,
      this.showNewPassword: true})
      : super();

  @override
  BronzeRegisterFormState createState() {
    return BronzeRegisterFormState();
  }
}

class BronzeRegisterFormState extends State<BronzeRegisterForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _dialCode;
  String? _isoCode;
  bool _valid = false;
  String? _countryCode;
  String? _imgString;
  String? _imgType;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    if (widget.registration != null) {
      _firstNameController.text = widget.registration!.firstName;
      _lastNameController.text = widget.registration!.lastName;
      _emailController.text = widget.registration!.email;
      if (widget.registration!.mobileNumber.isNotEmpty)
        PhoneNumber.getRegionInfoFromPhoneNumber(
                widget.registration!.mobileNumber)
            .then((value) {
          setState(() {
            _dialCode = '+${value.dialCode}';
            _countryCode = value.isoCode;
          });
          if (value.phoneNumber != null)
            _mobileNumberController.text =
                value.phoneNumber!.replaceFirst('+${value.dialCode}', '');
        });
      _addressController.text = widget.registration!.address;
      _currentPasswordController.text = widget.registration!.currentPassword;
      _newPasswordController.text = widget.registration!.newPassword;
      _passwordConfirmController.text = widget.registration!.newPassword;
      _imgType = widget.registration!.photoType;
      _imgString = widget.registration!.photo;
    }
  }

  void searchAddr() async {
    final apiClient =
        createPlaceApi(widget.googlePlaceApiKey, widget.locationIqApiKey);
    if (apiClient != null) {
      final Suggestion? result = await showSearch<Suggestion?>(
        context: context,
        delegate: AddressSearch(apiClient),
      );
      if (result != null) _addressController.text = result.description;
    }
  }

  void manualAddr() async {
    var place = await Navigator.push<Place?>(
      context,
      MaterialPageRoute(builder: (context) => AddressForm()),
    );
    if (place != null) _addressController.text = place.toString();
  }

  Future<bool> isValidPhoneNumber(String phoneNumber, String? isoCode) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: phoneNumber, isoCode: isoCode);
        if (isValidPhoneNumber == null) return false;
        return isValidPhoneNumber;
      } on Exception {
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Column(children: [
                      Text(widget.instructions == null
                          ? 'Enter your details to register'
                          : widget.instructions!),
                      Visibility(
                          visible: widget.showImage,
                          child: AccountImageUpdate(
                              _imgString,
                              _imgType,
                              (img, imgType) => setState(() {
                                    _imgString = img;
                                    _imgType = imgType;
                                  }))),
                      Visibility(
                        visible: widget.showName,
                        child: BronzeInputForm(_firstNameController,
                            validator: firstNameValidate,
                            labelText: 'First Name',
                            keyboardType: TextInputType.name),
                      ),
                      SizedBox(height: 15),
                      Visibility(
                          visible: widget.showName,
                          child: BronzeInputForm(_lastNameController,
                              validator: lastNameValidate,
                              labelText: 'Last Name',
                              keyboardType: TextInputType.name)),
                      SizedBox(height: 15),
                      Visibility(
                        visible: widget.showEmail,
                        child: BronzeInputForm(_emailController,
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: emailValidate),
                      ),
                      Visibility(
                          visible: widget.showMobileNumber,
                          child: phoneNumberInput(
                              _mobileNumberController,
                              (number) {
                                _dialCode = number.dialCode;
                                _isoCode = number.isoCode;
                              },
                              (valid) {
                                if (valid != null) _valid = valid;
                              },
                              countryCode: _countryCode,
                              initialCountry: widget.initialMobileCountry,
                              preferredCountries:
                                  widget.preferredMobileCountries,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  if (widget.requireMobileNumber)
                                    return 'Invalid phone number';
                                  return null;
                                }
                                if (_isoCode == null || !_valid)
                                  return 'Invalid phone number';
                                return null;
                              })),
                      Visibility(
                          visible: widget.showAddress,
                          child: TextFormField(
                            controller: _addressController,
                            readOnly: true,
                            decoration: InputDecoration(
                                labelText: 'Address',
                                suffix: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      availablePlaceApi(
                                              widget.googlePlaceApiKey,
                                              widget.locationIqApiKey)
                                          ? IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: searchAddr)
                                          : SizedBox(),
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: manualAddr),
                                    ])),
                          )),
                      Visibility(
                          visible: widget.showCurrentPassword,
                          child: TextFormField(
                              controller: _currentPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Current Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter your current password';
                                return null;
                              })),
                      Visibility(
                        visible: widget.showNewPassword,
                        child: BronzeInputForm(
                          _newPasswordController,
                          obscureText: true,
                          labelText: 'New Password',
                          validator: newPasswordValidate,
                        ),
                      ),
                      Visibility(
                        visible: widget.showNewPassword,
                        child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _passwordConfirmController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
                              filled: true,
                              labelText: 'Password Confirmation',
                              constraints:
                                  BoxConstraints(minWidth: 320, maxWidth: 320),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please confirm your password';
                              if (value != _newPasswordController.text)
                                return 'Password does not match';
                              return null;
                            }),
                      ),
                      RoundedButton(() async {
                        if (_formKey.currentState == null) return;
                        if (_formKey.currentState!.validate()) {
                          var accountReg = AccountRegistration(
                              _firstNameController.text,
                              _lastNameController.text,
                              _emailController.text.trim(),
                              '$_dialCode ${_mobileNumberController.text}',
                              _addressController.text,
                              _currentPasswordController.text,
                              _newPasswordController.text,
                              _imgString,
                              _imgType);
                          Navigator.of(context).pop(accountReg);
                        }
                      }, ZapOnSecondary, ZapSecondary, bronzeGradient,
                          'Continue',
                          holePunch: true, width: 320, height: 50),
                      RoundedButton(() {
                        Navigator.of(context).pop();
                      }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                          'Login Instead',
                          holePunch: true, width: 320, height: 50)
                    ]))))));
  }
}
