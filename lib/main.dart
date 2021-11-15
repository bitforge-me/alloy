import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:convert';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/utils.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart';
import 'prefs.dart';
import 'beryllium.dart';
import 'orders.dart';
import 'websocket.dart';
import 'profile.dart';
import 'security.dart';
import 'utils.dart';
import 'balances.dart';
import 'deposit.dart';
import 'withdrawal.dart';
import 'verify_user.dart';
import 'snack.dart';
import 'exchange.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      title: AppTitle,
      theme: theme.copyWith(
        // TODO - flutter 2.5.1 has some theme bugs which make it difficult to use
        // a theme with a primary color of white at the moment
        primaryColor: ZapBlue, //ZapWhite,
        textTheme: ZapTextThemer(Theme.of(context).textTheme),
        primaryTextTheme: ZapTextThemer(Theme.of(context).textTheme),
        colorScheme: theme.colorScheme.copyWith(
          //brightness: ZapBrightness,
          primary: ZapBlue, //ZapWhite,
          //secondary: ZapBlue
        ),
      ),
      debugShowCheckedModeBanner: false,
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
  List<String> _alerts = [];

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

  List<String> _generateAlerts(UserInfo? info) {
    var alerts = <String>[];
    if (info == null) return alerts;
    if (!info.kycValidated) alerts.add('User not verified');
    if (!info.tfEnabled) alerts.add('Two Factor Authentication not enabled');
    return alerts;
  }

  Future<void> _initApi() async {
    if (await Prefs.hasZcApiKey()) {
      UserInfo? userInfo;
      showAlertDialog(context, 'getting account info...');
      var result = await beUserInfo();
      Navigator.pop(context);
      result.when((UserInfo info) {
        setState(() {
          _invalidAuth = false;
          _retry = false;
        });
        userInfo = info;
        _websocket.wsEvent.subscribe(_websocketEvent);
        _websocket.connect(); // connect websocket
      }, error: (err) {
        err.when(network: () {
          alert(context, 'Network error', 'A network error occured');
          setState(() {
            _retry = true;
            _invalidAuth = false;
          });
        }, auth: (msg) {
          alert(context, 'Authentication failed', msg);
          setState(() {
            _invalidAuth = true;
            _retry = false;
          });
        }, format: () {
          alert(context, 'Format error', 'A format error occured');
          setState(() {
            _retry = true;
            _invalidAuth = false;
          });
        });
      });
      setState(() {
        _userInfo = userInfo;
        _alerts = _generateAlerts(userInfo);
      });
    }
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var info = UserInfo.fromJson(jsonDecode(args.msg));
      if (info.email != _userInfo?.email)
        _websocket.connect(); // reconnect websocket
      setState(() {
        _userInfo = info;
        _alerts = _generateAlerts(info);
      });
      //snackMsg(context, 'user updated');
    }
  }

  Future<void> _loginErrorAlert(BuildContext context, BeError error) async {
    await error.when(network: () async {
      await alert(context, 'Network error',
          'A network error occured when trying to login');
    }, auth: (msg) async {
      await alert(context, 'Authentication failed',
          'The login details you entered are not valid ($msg)');
    }, format: () async {
      await alert(context, 'Format error',
          'A format error occured when trying to login');
    });
  }

  Future<Acct?> _beLogin(BuildContext context, AccountLogin login,
      {bool silent: false}) async {
    var devName = await deviceName();
    var result = await beApiKeyCreate(
        login.email, login.password, devName, login.tfCode);
    return await result.when<Future<Acct?>>((apikey) async {
      // write api key
      await Prefs.beApiKeySet(apikey.token);
      await Prefs.beApiSecretSet(apikey.secret);
      return Acct(login.email, apikey.token);
    }, error: (err) async {
      if (!silent) await _loginErrorAlert(context, err);
      return null;
    });
  }

  Future<Acct?> _beApiKeyClaim(
      BuildContext context, AccountRequestApiKey req, String token,
      {silent: false}) async {
    var result = await beApiKeyClaim(token);
    return await result.when<Future<Acct?>>((apikey) async {
      // write api key
      await Prefs.beApiKeySet(apikey.token);
      await Prefs.beApiSecretSet(apikey.secret);
      return Acct(req.email, apikey.token);
    }, error: (err) async {
      if (!silent) await _loginErrorAlert(context, err);
      return null;
    });
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
    if (reg == null) return;
    var res = await beUserRegister(reg);
    res.when((content) async {
      var cancelled = false;
      Acct? acct;
      showAlertDialog(context, 'waiting for you to confirm the email...',
          showCancel: true, onCancel: () => cancelled = true);
      while (acct == null && !cancelled) {
        await Future.delayed(Duration(seconds: 5));
        // save account if login successful
        acct = await _beLogin(
            context, AccountLogin(reg!.email, reg.newPassword, ''),
            silent: true);
      }
      Navigator.pop(context);
      _initApi();
    }, error: (err) {
      err.when(
          network: () => alert(context, 'Network error',
              'A network error occured when trying to register'),
          auth: (msg) => alert(context, 'Authorisation error',
              'An authorisation error occured when trying to register ($msg)'),
          format: () => alert(context, 'Format error',
              'A format error occured when trying to register'));
    });
  }

  Future<void> _login() async {
    AccountLogin? login;
    // first check if we need a two factor code
    bool tfEnabled = false;
    while (true) {
      login = await Navigator.push<AccountLogin>(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AccountLoginForm(login, showTwoFactorCode: false)),
      );
      if (login == null) return;
      showAlertDialog(context, 'logging in..');
      var result =
          await beUserTwoFactorEnabledCheck(login.email, login.password);
      Navigator.pop(context);
      if (await result.when<Future<bool>>((enabled) async {
        tfEnabled = enabled;
        return true;
      }, error: (err) async {
        await _loginErrorAlert(context, err);
        return false;
      })) break;
    }
    while (true) {
      // get the two factor code if required
      if (tfEnabled)
        login = await Navigator.push<AccountLogin>(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AccountLoginForm(login, showTwoFactorCode: tfEnabled)),
        );
      if (login == null) return;
      // login and save account if login successful
      showAlertDialog(context, 'logging in..');
      var acct = await _beLogin(context, login);
      Navigator.pop(context);
      if (acct != null) {
        _initApi();
        break;
      }
    }
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
    var result = await beApiKeyRequest(req.email, req.deviceName);
    await result.when((token) async {
      Acct? acct;
      var cancelled = false;
      showAlertDialog(context, 'waiting for you to confirm the email...',
          showCancel: true, onCancel: () => cancelled = true);
      while (acct == null && !cancelled) {
        await Future.delayed(Duration(seconds: 5));
        // claim api key
        acct = await _beApiKeyClaim(context, req, token, silent: true);
      }
      Navigator.pop(context);
      if (acct != null) _initApi();
    }, error: (err) async {
      await alert(context, 'Network error',
          'A network error occured when trying to login');
    });
  }

  Future<void> _support() async {
    if (_userInfo != null)
      await urlLaunch(
          '$SupportUrl?email=${Uri.encodeQueryComponent(_userInfo!.email)}');
    else
      await urlLaunch(SupportUrl);
  }

  Future<void> _logout() async {
    if (await askYesNo(context, 'Are you sure you want to logout?')) {
      await Prefs.nukeAll();
      Phoenix.rebirth(context);
    }
  }

  Future<void> _retryAuth() async {
    _initApi();
  }

  Future<void> _balances() async {
    showAlertDialog(context, 'querying..');
    var res = await beBalances();
    Navigator.pop(context);
    res.when(
        (balances) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BalanceScreen(balances, _websocket))),
        error: (err) => snackMsg(context, 'failed to query balances',
            category: MessageCategory.Warning));
  }

  Future<void> _deposit() async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    Navigator.pop(context);
    res.when(
        (assets) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DepositSelectScreen(assets, _websocket))),
        error: (err) => snackMsg(context, 'failed to query deposits',
            category: MessageCategory.Warning));
  }

  Future<void> _withdrawal() async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    Navigator.pop(context);
    res.when(
        (assets) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WithdrawalSelectScreen(assets, _websocket))),
        error: (err) => snackMsg(context, 'failed to query withdrawals',
            category: MessageCategory.Warning));
  }

  Future<void> _orders() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrdersScreen(_websocket)));
  }

  Future<void> _profile() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(_websocket, _userInfo!)));
  }

  Future<void> _security() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecurityScreen(_websocket, _userInfo!)));
  }

  Future<void> _verifyUser() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyUserScreen(_userInfo!, _websocket)));
  }

  Drawer makeDrawer(BuildContext contex) {
    var header = DrawerHeader(
        decoration: BoxDecoration(
          color: ZapBlue,
        ),
        child: _userInfo != null
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                accountImage(_userInfo?.photo, _userInfo?.photoType),
                SizedBox(height: 5),
                Text('${_userInfo?.email}', style: TextStyle(color: ZapWhite)),
                //SizedBox(height: 5),
                //Text('Validated: ${_userInfo?.kycValidated}'),
              ])
            : SizedBox());
    if (_userInfo == null)
      return Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        header,
        ListTile(
            leading: Icon(Icons.contact_support),
            title: const Text('Support'),
            onTap: _support)
      ]));
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          header,
          _alerts.isNotEmpty ? AlertDrawer(() {}, _alerts) : SizedBox(),
          Visibility(
              visible: _userInfo?.kycValidated != true,
              child: ListTile(
                leading: Icon(Icons.verified_user, color: ZapWarning),
                title: const Text('Verify User'),
                onTap: _verifyUser,
              )),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: _profile),
          ListTile(
              leading: Icon(Icons.shield,
                  color: _userInfo?.tfEnabled == true ? null : ZapWarning),
              title: const Text('Security'),
              onTap: _security),
          ListTile(
              leading: Icon(Icons.contact_support),
              title: const Text('Support'),
              onTap: _support),
          ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(AppLogo),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              onPressed: () => Scaffold.of(context).openDrawer(),
              color: _alerts.isNotEmpty ? ZapWarning : null,
            );
          })),
      drawer: makeDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(
                  _register, ZapWhite, ZapBlue, ZapBlueGradient, 'Register',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(
                  _login, ZapWhite, ZapBlue, ZapBlueGradient, 'Login',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(_loginWithEmail, ZapWhite, ZapBlue,
                  ZapBlueGradient, 'Lost Password',
                  holePunch: true, width: 200),
            ),
            _userInfo != null ? ExchangeWidget(_websocket) : SizedBox(),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _orders, ZapWhite, ZapBlue, ZapBlueGradient, 'Orders',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _balances, ZapWhite, ZapBlue, ZapBlueGradient, 'Balances',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _deposit, ZapWhite, ZapBlue, ZapBlueGradient, 'Deposits',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(_withdrawal, ZapWhite, ZapBlue,
                  ZapBlueGradient, 'Withdrawals',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _invalidAuth,
              child: RoundedButton(
                  _logout, ZapWhite, ZapBlue, ZapBlueGradient, 'Reset',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _retry,
              child: RoundedButton(
                  _retryAuth, ZapWhite, ZapBlue, ZapBlueGradient, 'Retry',
                  holePunch: true, width: 200),
            ),
          ],
        ),
      ),
    );
  }
}
