import 'package:flutter/material.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'widgets.dart';
import 'security.dart';
import 'config.dart';

class TfaPage extends StatefulWidget {
  final BeTwoFactorSetup twoFactor;
  TfaPage(this.twoFactor);
  @override
  State<TfaPage> createState() => _TfaPageState();
}

class _TfaPageState extends State<TfaPage> {
  String? _TfaDialogRes;

  Future<void> _getTfaDialog(BuildContext context) async {
    // Tfa code given to enable Tfa
    String? code = await twoFactorQr(context, widget.twoFactor);
    setState(() {
      _TfaDialogRes = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Two Factor Authentication'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            // Upon going back, return 2fa code result
            onPressed: () {
              Navigator.pop(context, _TfaDialogRes);
            },
          ),
        ),
        body: BiforgePage(
          scrollChild: true,
          showDebugInfo: true,
          child: Column(
            children: <Widget>[
              VerticalSpacer(),
              Container(
                  child: Image.asset('auth.png', width: 100, height: 100)),
              VerticalSpacer(),
              ListTile(
                title: Text('What is Two-Factor Authentication?',
                    textAlign: TextAlign.center),
                subtitle: Text(
                    "Two-factor authentication is an important security measure that requires users to provide two forms of identification when logging into an account. This usually consists of a password and a code generated by a two-factor authentication app installed on the user's mobile phone. One example of such an app is Google Authenticator. Two-factor authentication helps to ensure that only the intended user has access to an account, even if an attacker knows their password.",
                    textAlign: TextAlign.center),
              ),
              VerticalSpacer(),
              ListTile(
                title: Text("Instructions", textAlign: TextAlign.center),
                subtitle: Text(
                    "If you already have a Two-factor Authentication app installed (such as Google Authenticator), click Create Code on this current page, otherwise install Google Authenticator which can be downloaded below",
                    textAlign: TextAlign.center),
              ),
              VerticalSpacer(),
              BronzeRoundedButton(() => _getTfaDialog(context), ZapOnPrimary,
                  ZapPrimary, ZapPrimaryGradient, 'Create Code',
                  width: ButtonWidth, height: ButtonHeight, fwdArrow: true),
              VerticalSpacer(),
              Text("Download Google Auth:"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AppDownloadBtn(OperatingSystem.android,
                      'https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en_NZ&gl=US'),
                  AppDownloadBtn(OperatingSystem.ios,
                      'https://apps.apple.com/us/app/google-authenticator/id388497605'),
                ],
              ),
            ],
          ),
        ));
  }
}
