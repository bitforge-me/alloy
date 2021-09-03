import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/utils.dart';
import 'package:zapdart/account_forms.dart';

import 'paydb.dart';
import 'config.dart';
import 'prefs.dart';
import 'markets.dart';
import 'websocket.dart';

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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  Websocket _websocket = Websocket();
  UserInfo? _userInfo;
  bool _invalidAuth = false;
  bool _retry = false;

  @override
  void initState() {
    super.initState();
    _initApi();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('App lifestyle state changed: $state');
    if (state == AppLifecycleState.resumed)
      _websocket.connect(); // reconnect websocket
  }

  Future<void> _initApi() async {
    if (await Prefs.hasPaydbApiKey()) {
      UserInfo? userInfo;
      showAlertDialog(context, 'getting account info...');
      var result = await paydbUserInfo();
      Navigator.pop(context);
      switch (result.error.type) {
        case ErrorType.Auth:
          alert(context, 'Authentication failed', result.error.msg);
          setState(() => _invalidAuth = true);
          break;
        case ErrorType.Network:
          alert(context, 'Network error', 'A network error occured');
          setState(() => _retry = true);
          break;
        case ErrorType.None:
          userInfo = result.info;
          _websocket.wsEvent.subscribe(_websocketEvent);
          _websocket.connect(); // connect websocket
          break;
      }
      setState(() => _userInfo = userInfo);
    }
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var info = UserInfo.parse(args.msg);
      setState(() => _userInfo = info);
      flushbarMsg(context, 'user updated');
    }
  }

  Future<Acct?> _paydbLogin(BuildContext context, AccountLogin login,
      {bool silent: false}) async {
    var devName = await deviceName();
    var result = await paydbApiKeyCreate(login.email, login.password, devName);
    switch (result.error.type) {
      case ErrorType.Auth:
        if (!silent)
          await alert(context, 'Authentication failed',
              'The login details you entered are not valid (${result.error.msg})');
        break;
      case ErrorType.Network:
        if (!silent)
          await alert(context, 'Network error',
              'A network error occured when trying to login');
        break;
      case ErrorType.None:
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
    switch (result.error.type) {
      case ErrorType.Auth:
        if (!silent)
          await alert(context, 'Authentication not valid',
              'The login details you entered are not valid (${result.error.msg})');
        break;
      case ErrorType.Network:
        if (!silent)
          await alert(context, 'Network error',
              'A network error occured when trying to login');
        break;
      case ErrorType.None:
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
      switch (res.type) {
        case ErrorType.Auth:
          await alert(context, 'Authorisation error',
              'An authorisation error occured when trying to register (${res.msg})');
          break;
        case ErrorType.Network:
          await alert(context, 'Network error',
              'A network error occured when trying to register');
          break;
        case ErrorType.None:
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
          _initApi();
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
    if (acct != null) _initApi();
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
    switch (result.error.type) {
      case ErrorType.Auth:
      case ErrorType.Network:
        await alert(context, 'Network error',
            'A network error occured when trying to login');
        break;
      case ErrorType.None:
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
        if (acct != null) _initApi();
    }
  }

  Future<void> _logout() async {
    await Prefs.nukeAll();
    Phoenix.rebirth(context);
  }

  Future<void> _retryAuth() async {
    _initApi();
  }

  Future<void> _assets() async {
    showAlertDialog(context, 'querying..');
    var res = await zcAssets();
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AssetScreen(res.assets)));
  }

  Future<void> _markets() async {
    showAlertDialog(context, 'querying..');
    var res = await zcMarkets();
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MarketScreen(res.markets, _websocket)));
  }

  Future<void> _orders() async {
    showAlertDialog(context, 'querying..');
    var res = await zcOrderList(0, 1000);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrdersScreen(res.orders, _websocket)));
  }

  Future<void> _kycRequestCreate() async {
    showAlertDialog(context, 'creating kyc validation request..');
    var res = await zcKycRequestCreate();
    Navigator.pop(context);
    if (res.error.type == ErrorType.None) _urlLaunch(res.kycUrl!);
  }

  Future<void> _urlLaunch(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
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
            accountImage(_userInfo?.photo, _userInfo?.photoType),
            Text('Email: ${_userInfo?.email}'),
            Text('Validated: ${_userInfo?.kycValidated}'),
            Visibility(
              visible: _userInfo != null && _userInfo?.kycUrl == null,
              child: RoundedButton(_kycRequestCreate, ZapWhite, ZapBlue,
                  ZapBlueGradient, 'Validate KYC',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo != null &&
                  _userInfo?.kycUrl != null &&
                  !_userInfo!.kycValidated,
              child: RoundedButton(() => _urlLaunch(_userInfo!.kycUrl!),
                  ZapWhite, ZapBlue, ZapBlueGradient, 'Validate KYC',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(
                  _register, ZapWhite, ZapBlue, ZapBlueGradient, 'Register',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(
                  _login, ZapWhite, ZapBlue, ZapBlueGradient, 'Login',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(_loginWithEmail, ZapWhite, ZapBlue,
                  ZapBlueGradient, 'Login with email link (lost password)',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _logout, ZapWhite, ZapBlue, ZapBlueGradient, 'Logout',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _assets, ZapWhite, ZapBlue, ZapBlueGradient, 'Assets',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _markets, ZapWhite, ZapBlue, ZapBlueGradient, 'Markets',
                  holePunch: true, width: 300),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _orders, ZapWhite, ZapBlue, ZapBlueGradient, 'Orders',
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
