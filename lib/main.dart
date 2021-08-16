import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/utils.dart';
import 'package:zapdart/account_forms.dart';

import 'paydb.dart';
import 'config.dart';
import 'prefs.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTitle,
      theme: ThemeData(
        brightness: ZapBrightness,
        primaryColor: ZapWhite,
        accentColor: ZapBlue,
        textTheme: ZapTextThemer(Theme.of(context).textTheme),
        primaryTextTheme: ZapTextThemer(Theme.of(context).textTheme),
      ),
      home: MyHomePage(title: AppTitle),
    );
  }
}

class Acct {
  String? email;
  String? apiKey;

  Acct(this.email, this.apiKey);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Acct? _acct;
  bool _invalidAuth = false;
  bool _retry = false;

  @override
  void initState() {
    super.initState();
    _initApi();
  }

  Future<void> _initApi() async {
    if (await Prefs.hasPaydbApiKey()) {
      var apiKey = await Prefs.paydbApiKeyGet();
      String? email;
      showAlertDialog(context, 'getting account info...');
      var result = await paydbUserInfo();
      Navigator.pop(context);
      switch (result.error) {
        case PayDbError.Auth:
          alert(context, 'Authentication not valid',
              'Your stored credentials are not valid');
          setState(() => _invalidAuth = true);
          break;
        case PayDbError.Network:
          alert(context, 'Network error', 'A network error occured');
          setState(() => _retry = true);
          break;
        case PayDbError.None:
          email = result.info?.email;
          break;
      }
      setState(() => _acct = Acct(email, apiKey));
    }
  }

  Future<Acct?> _paydbLogin(BuildContext context, AccountLogin login,
      {bool silent: false}) async {
    var devName = await deviceName();
    var result = await paydbApiKeyCreate(login.email, login.password, devName);
    switch (result.error) {
      case PayDbError.Auth:
        if (!silent)
          await alert(context, 'Authentication not valid',
              'The login details you entered are not valid');
        break;
      case PayDbError.Network:
        if (!silent)
          await alert(context, 'Network error',
              'A network error occured when trying to login');
        break;
      case PayDbError.None:
        // write api key
        if (result.apikey != null) {
          await Prefs.paydbApiKeySet(result.apikey!.token);
          await Prefs.paydbApiSecretSet(result.apikey!.secret);
        }
        return Acct(login.email, result.apikey?.token);
    }
    return null;
  }

  Future<Acct?> _paydbApiKeyClaim(
      BuildContext context, AccountRequestApiKey req, String token,
      {silent: false}) async {
    var result = await paydbApiKeyClaim(token);
    switch (result.error) {
      case PayDbError.Auth:
        if (!silent)
          await alert(context, 'Authentication not valid',
              'The login details you entered are not valid');
        break;
      case PayDbError.Network:
        if (!silent)
          await alert(context, 'Network error',
              'A network error occured when trying to login');
        break;
      case PayDbError.None:
        // write api key
        if (result.apikey != null) {
          await Prefs.paydbApiKeySet(result.apikey!.token);
          await Prefs.paydbApiSecretSet(result.apikey!.secret);
        }
        return Acct(req.email, result.apikey?.token);
    }
    return null;
  }

  Future<void> _register() async {
    AccountRegistration? reg;
    reg = await Navigator.push<AccountRegistration>(
      context,
      MaterialPageRoute(
          builder: (context) => AccountRegisterForm(
                reg,
                showMobileNumber: RequireMobileNumber,
                initialMobileCountry: InitialMobileCountry,
                preferredMobileCountries: PreferredMobileCountries,
                showAddress: RequireAddress,
                googlePlaceApiKey: googlePlaceApiKey(),
                locationIqApiKey: locationIqApiKey(),
              )),
    );
    if (reg != null) {
      var res = await paydbUserRegister(reg);
      switch (res) {
        case PayDbError.Auth:
          await alert(context, 'Authorisation error',
              'An authorisation error occured when trying to register (user may already exist)');
          break;
        case PayDbError.Network:
          await alert(context, 'Network error',
              'A network error occured when trying to register');
          break;
        case PayDbError.None:
          var cancelled = false;
          Acct? acct;
          showAlertDialog(context, 'waiting for you to confirm the email...',
              showCancel: true, onCancel: () => cancelled = true);
          while (acct == null && !cancelled) {
            await Future.delayed(Duration(seconds: 5));
            // save account if login successful
            acct = await _paydbLogin(
                context, AccountLogin(reg.email, reg.newPassword),
                silent: true);
          }
          Navigator.pop(context);
          setState(() => _acct = acct);
          break;
      }
    }
  }

  Future<void> _login() async {
    AccountLogin? login;
    login = await Navigator.push<AccountLogin>(
      context,
      MaterialPageRoute(builder: (context) => AccountLoginForm(login)),
    );
    if (login == null) return;
    // save account if login successful
    showAlertDialog(context, 'logging in..');
    var acct = await _paydbLogin(context, login);
    Navigator.pop(context);
    setState(() => _acct = acct);
  }

  Future<void> _loginWithEmail() async {
    // request api key form
    var devName = await deviceName();
    var req = await Navigator.push<AccountRequestApiKey>(
      context,
      MaterialPageRoute(
          builder: (context) => AccountRequestApiKeyForm(devName)),
    );
    if (req == null) return;
    var result = await paydbApiKeyRequest(req.email, req.deviceName);
    switch (result.error) {
      case PayDbError.Auth:
      case PayDbError.Network:
        await alert(context, 'Network error',
            'A network error occured when trying to login');
        break;
      case PayDbError.None:
        assert(result.token != null);
        Acct? acct;
        var cancelled = false;
        showAlertDialog(context, 'waiting for you to confirm the email...',
            showCancel: true, onCancel: () => cancelled = true);
        while (acct == null && !cancelled) {
          await Future.delayed(Duration(seconds: 5));
          // claim api key
          acct = await _paydbApiKeyClaim(context, req, result.token!,
              silent: true);
        }
        Navigator.pop(context);
        setState(() => _acct = acct);
    }
  }

  Future<void> _logout() async {
    await Prefs.nukeAll();
    Phoenix.rebirth(context);
  }

  Future<void> _retryAuth() async {
    _initApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${_acct?.email}'),
            Text('API KEY: ${_acct?.apiKey}'),
            Visibility(
              visible: _acct == null,
              child: RoundedButton(
                  _register, ZapWhite, ZapBlue, ZapBlueGradient, 'Register',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _acct == null,
              child: RoundedButton(
                  _login, ZapWhite, ZapBlue, ZapBlueGradient, 'Login',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _acct == null,
              child: RoundedButton(_loginWithEmail, ZapWhite, ZapBlue,
                  ZapBlueGradient, 'Login with email link (lost password)',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _acct != null,
              child: RoundedButton(
                  _logout, ZapWhite, ZapBlue, ZapBlueGradient, 'Logout',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _invalidAuth,
              child: RoundedButton(
                  _logout, ZapWhite, ZapBlue, ZapBlueGradient, 'Reset',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _retry,
              child: RoundedButton(
                  _retryAuth, ZapWhite, ZapBlue, ZapBlueGradient, 'Retry',
                  holePunch: true, width: 300),
            ),
          ],
        ),
      ),
    );
  }
}
