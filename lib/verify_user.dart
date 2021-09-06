import 'package:flutter/material.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';

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
  var processWebsocketUpdates = true;

  _VerifyUserScreenState(this._userInfo);

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    if (_userInfo.mobileNumber != null)
      _mobileNumberController.text = _userInfo.mobileNumber!;
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (!processWebsocketUpdates) return;
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var newUserInfo = UserInfo.parse(args.msg);
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
    var res = await beKycRequestSendMobileNumber(mobileNumber);
    Navigator.pop(context);
    return res;
  }

  void _submit() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      if (_userInfo.kycUrl == null) {
        var res = await _kycRequestCreate();
        if (res.error.type != ErrorType.None) {
          await alert(context, 'Error', res.error.msg);
          return;
        }
      }
      var res = await _kycSendMobileNumber(_mobileNumberController.text);
      if (res.error.type != ErrorType.None) {
        await alert(context, 'Error', res.error.msg);
        return;
      }
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
                  TextFormField(
                      controller: _mobileNumberController,
                      decoration: InputDecoration(labelText: 'Mobile Number'),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter a value';
                        return null;
                      }),
                  raisedButton(onPressed: _submit, child: Text('Submit')),
                ]))));
  }
}
