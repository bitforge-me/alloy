import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'snack.dart';

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
      var info = UserInfo.fromJson(jsonDecode(args.msg));
      setState(() => _userInfo = info);
      snackMsg(context, 'user updated');
    }
  }

  void _tfDisable() async {
    showAlertDialog(context, 'querying..');
    var result = await beUserTwoFactorDisable(null);
    Navigator.of(context).pop();
    await result.when((twoFactor) async {
      var code = await askString(
          context, 'Enter your two factor code to disable', null);
      if (code != null) {
        showAlertDialog(context, 'disabling..');
        result = await beUserTwoFactorDisable(code);
        Navigator.of(context).pop();
        await result.when((twoFactor) => null, error: (err) async {
          alert(context, 'Failed to disable two factor authentication', ':(');
        });
      }
    }, error: (err) async {
      snackMsg(context, 'failed to get two factor authentication details',
          category: MessageCategory.Warning);
    });
  }

  void _tfEnable() async {
    showAlertDialog(context, 'querying..');
    var result = await beUserTwoFactorEnable(null);
    Navigator.of(context).pop();
    await result.when((twoFactor) async {
      String? code;
      if (twoFactor.method == 'email')
        code = await askString(
            context, 'Enter your two factor code to enable', null);
      if (twoFactor.method == 'authenticator' && twoFactor.setup != null)
        code = await twoFactorQr(context, twoFactor.setup!);
      if (code != null) {
        showAlertDialog(context, 'enabling..');
        result = await beUserTwoFactorEnable(code);
        Navigator.of(context).pop();
        await result.when((twoFactor) => null, error: (err) async {
          await alert(
              context, 'Failed to enable two factor authentication', ':(');
        });
      }
    }, error: (err) async {
      snackMsg(context, 'failed to get two factor authentication details',
          category: MessageCategory.Warning);
    });
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
