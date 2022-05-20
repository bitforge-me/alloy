import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:convert';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/form_ui.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'config.dart';

class VerifyUserScreen extends StatefulWidget {
  final UserInfo userInfo;
  final Websocket websocket;

  VerifyUserScreen(this.userInfo, this.websocket);

  @override
  State<VerifyUserScreen> createState() => _VerifyUserScreenState(userInfo);
}

class _VerifyUserScreenState extends State<VerifyUserScreen> {
  UserInfo _userInfo;
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  var _processWebsocketUpdates = true;
  PhoneNumber? _initialNumber;
  PhoneNumber? _phoneNumber;

  _VerifyUserScreenState(this._userInfo);

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);

    if (_userInfo.mobileNumber != null)
      PhoneNumber.getRegionInfoFromPhoneNumber(_userInfo.mobileNumber!)
          .then((value) {
        setState(() => _initialNumber = value);
      });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (!_processWebsocketUpdates) return;
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var newUserInfo = UserInfo.fromJson(jsonDecode(args.msg));
      setState(() => _userInfo = newUserInfo);
      if (newUserInfo.kycValidated) Navigator.pop(context);
    }
  }

  Future<BeKycRequestCreateResult> _kycRequestCreate() async {
    showAlertDialog(context, 'creating kyc validation request..');
    var res = await beKycRequestCreate();
    Navigator.pop(context);
    return res;
  }

  Future<BeKycRequestCreateResult> _kycSendMobileNumber(
      String mobileNumber) async {
    showAlertDialog(context, 'sending SMS..');
    var res =
        await beKycRequestSendMobileNumber(mobileNumber.replaceFirst('+', ''));
    Navigator.pop(context);
    return res;
  }

  void _submit() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      if (_userInfo.kycUrl == null) {
        var res = await _kycRequestCreate();
        if (!await res.when<Future<bool>>((kycUrl) async => true,
            error: (err) async {
          await alert(context, 'Error', 'failed to submit kyc request');
          return false;
        })) return;
      }
      if (_phoneNumber == null || _phoneNumber!.phoneNumber == null) return;
      var res = await _kycSendMobileNumber(_phoneNumber!.phoneNumber!);
      if (!await res.when<Future<bool>>((kycUrl) async => true,
          error: (err) async {
        await alert(context, 'Error', 'failed to submit kyc request');
        return false;
      })) return;
      await alert(context, 'SMS sent',
          'Follow the instructions from the SMS link on your mobile phone');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verify User'),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  _userInfo.kycUrl == null
                      ? Text(
                          'Enter your mobile phone number to start the verification process')
                      : Text(
                          'Continue the verification process on your mobile phone or re-enter your mobile phone number to start over'),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset('assets/aplyid-logo.webp')),
                  phoneNumberInput(
                      _mobileNumberController,
                      (pn) => _phoneNumber = pn,
                      (validated) => print(validated), validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter a value';
                    return null;
                  },
                      initialNumber: _initialNumber,
                      countryCode: InitialMobileCountry,
                      preferredCountries: PreferredMobileCountries),
                  SizedBox(height: 15),
                  raisedButton(onPressed: _submit, child: Text('Submit')),
                ]))));
  }
}
