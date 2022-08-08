import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'snack.dart';
import 'widgets.dart';
import 'config.dart';
import 'utils.dart';

class TwoFactorEnableScreen extends StatefulWidget {
  final BeTwoFactorSetup setup;
  final String userEmail;

  TwoFactorEnableScreen(this.setup, this.userEmail);

  @override
  State<TwoFactorEnableScreen> createState() => _TwoFactorEnableScreenState();
}

class _TwoFactorEnableScreenState extends State<TwoFactorEnableScreen> {
  final formKey = GlobalKey<FormState>();
  final txtController = new TextEditingController();

  void submit() {
    var cs = formKey.currentState;
    if (cs != null && cs.validate()) {
      Navigator.pop(context, txtController.text);
    }
  }

  void copyKey() {
    Clipboard.setData(ClipboardData(text: widget.setup.key));
    snackMsg(context, 'copied key');
  }

  void cantLaunch(String? url) {
    snackMsg(context, 'no app registered to import two factor data',
        category: MessageCategory.Warning);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enable Two Factor Authentication'),
        ),
        body: BiforgePage(
            scrollChild: true,
            child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          color: Colors.white,
                          child: SvgPicture.network(widget.setup.image)),
                      ListTile(
                          title: Text('Key'),
                          subtitle: Text(widget.setup.key),
                          trailing: IconButton(
                              icon: Icon(Icons.copy), onPressed: copyKey)),
                      ListTile(
                        title: Text('Import to App'),
                        subtitle: Text(
                            'Import automatically to a Two Factor Authentication App installed on your device'),
                        trailing: IconButton(
                          icon: Icon(Icons.download),
                          onPressed: () {
                            urlLaunch(
                                'otpauth://totp/Bitforge:${widget.userEmail}?secret=${widget.setup.key}&issuer=Bitforge',
                                cantLaunch: cantLaunch);
                          },
                        ),
                      ),
                      VerticalSpacer(),
                      Text(
                          'Enter the generated two factor code (from the app) below'),
                      TextFormField(
                        controller: txtController,
                        decoration:
                            InputDecoration(labelText: 'Two factor code'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
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
                ))));
  }
}

class TwoFactorScreen extends StatefulWidget {
  final BeTwoFactorSetup twoFactor;
  final String userEmail;
  TwoFactorScreen(this.twoFactor, this.userEmail);
  @override
  State<TwoFactorScreen> createState() => _TwoFactorScreenState();
}

class _TwoFactorScreenState extends State<TwoFactorScreen> {
  Future<void> _showEnableScreen(BuildContext context) async {
    var code = await Navigator.push<String>(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TwoFactorEnableScreen(widget.twoFactor, widget.userEmail)));
    if (code != null) Navigator.pop(context, code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Two Factor Authentication')),
      body: BiforgePage(
        scrollChild: true,
        child: Column(
          children: [
            VerticalSpacer(),
            Container(child: Image.asset('auth.png', width: 100, height: 100)),
            VerticalSpacer(),
            ListTile(
              title: Text('What is Two-Factor Authentication?',
                  textAlign: TextAlign.center),
              subtitle: Text(
                  'Two-factor authentication is an important security measure that requires users to provide two forms of identification when logging into an account. This usually consists of a password and a code generated by a two-factor authentication app installed on the user\'s mobile phone. One example of such an app is Google Authenticator. Two-factor authentication helps to ensure that only the intended user has access to an account, even if an attacker knows their password.',
                  textAlign: TextAlign.center),
            ),
            VerticalSpacer(),
            BronzeRoundedButton(
                () => _showEnableScreen(context),
                ZapOnPrimary,
                ZapPrimary,
                ZapPrimaryGradient,
                'Enable Two Factor Authentication',
                width: ButtonWidth,
                height: ButtonHeight,
                fwdArrow: true),
            VerticalSpacer(),
            ListTile(
              title: Text('Download Google Authenticator',
                  textAlign: TextAlign.center),
              subtitle: Text(
                  'If you do not already have a two factor authentication application you can install Google Authenticator using one of the links below',
                  textAlign: TextAlign.center),
            ),
            VerticalSpacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              AppstoreButton(AppStore.android,
                  'https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en_NZ&gl=US'),
              AppstoreButton(AppStore.ios,
                  'https://apps.apple.com/us/app/google-authenticator/id388497605')
            ]),
          ],
        ),
      ),
    );
  }
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
        code = await Navigator.push<String>(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TwoFactorScreen(twoFactor.setup!, _userInfo.email)));
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
        body: BiforgePage(
            child: ListView(children: [
          _userInfo.tfEnabled
              ? ListTile(
                  leading: Icon(Icons.lock_open),
                  onTap: _tfDisable,
                  title: Text('Disable Two Factor Authentication'))
              : ListTile(
                  leading: Icon(Icons.lock),
                  onTap: _tfEnable,
                  title: Text('Enable Two Factor Authentication'))
        ])));
  }
}
