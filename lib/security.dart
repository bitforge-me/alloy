import 'package:flutter/material.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';

Future<String?> twoFactorQr(BuildContext context, BeTwoFactorSetup setup) {
  final formKey = GlobalKey<FormState>();
  final txtController = new TextEditingController();

  void submit() {
    var cs = formKey.currentState;
    if (cs != null && cs.validate()) {
      Navigator.pop(context, txtController.text);
    }
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(setup.image),
          TextFormField(
            controller: txtController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                raisedButtonIcon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.cancel),
                    label: Text('Cancel')),
                raisedButtonIcon(
                    onPressed: submit,
                    icon: Icon(Icons.send),
                    label: Text('Submit')),
              ]),
        ],
      ),
    );
  }

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Authenticator Application Setup'),
        content: buildForm(context),
      );
    },
  );
}

class SecurityScreen extends StatefulWidget {
  final Websocket websocket;
  final UserInfo userInfo;

  SecurityScreen(this.websocket, this.userInfo);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState(userInfo);
}

class _SecurityScreenState extends State<SecurityScreen> {
  UserInfo _userInfo;

  _SecurityScreenState(this._userInfo);

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var info = UserInfo.parse(args.msg);
      setState(() => _userInfo = info);
      flushbarMsg(context, 'user updated');
    }
  }

  void _tfDisable() async {
    showAlertDialog(context, 'querying..');
    var result = await beUserTwoFactorDisable(null);
    Navigator.of(context).pop();
    if (result.error.type == ErrorType.None) {
      var code = await askString(
          context, 'Enter your two factor code to disable', null);
      if (code != null) {
        showAlertDialog(context, 'disabling..');
        result = await beUserTwoFactorDisable(code);
        Navigator.of(context).pop();
        if (result.error.type != ErrorType.None)
          alert(context, 'Failed to disable two factor authentication', ':(');
      }
    } else
      flushbarMsg(context, 'failed to get two factor authentication details',
          category: MessageCategory.Warning);
  }

  void _tfEnable() async {
    showAlertDialog(context, 'querying..');
    var result = await beUserTwoFactorEnable(null);
    Navigator.of(context).pop();
    if (result.error.type == ErrorType.None) {
      String? code;
      if (result.twoFactor?.method == 'email')
        code = await askString(
            context, 'Enter your two factor code to enable', null);
      if (result.twoFactor?.method == 'authenticator' &&
          result.twoFactor?.setup != null)
        code = await twoFactorQr(context, result.twoFactor!.setup!);
      if (code != null) {
        showAlertDialog(context, 'enabling..');
        result = await beUserTwoFactorEnable(code);
        Navigator.of(context).pop();
        if (result.error.type != ErrorType.None)
          alert(context, 'Failed to enable two factor authentication', ':(');
      }
    } else
      flushbarMsg(context, 'failed to get two factor authentication details',
          category: MessageCategory.Warning);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Security'),
        ),
        body: ListView(children: [
          _userInfo.tfEnabled
              ? ListTile(
                  leading: Icon(Icons.lock_open),
                  onTap: _tfDisable,
                  title: Text('Disable Two Factor Authentication'))
              : ListTile(
                  leading: Icon(Icons.lock),
                  onTap: _tfEnable,
                  title: Text('Enable Two Factor Authentication'))
        ]));
  }
}
