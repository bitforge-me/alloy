import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:universal_html/html.dart' as html;
import 'package:decimal/decimal.dart';

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
import 'units.dart';
import 'colors.dart';
import 'accountform.dart';
import 'assets.dart';
import 'event.dart';
import 'popupreturn.dart';

final log = Logger('Main');

void main() {
  // setup logging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  log.info('Git SHA: $GitSha');
  log.info('Build Date: $BuildDate');
  log.info('Beryllium Server: ${server()}');
  log.info('Testnet: ${testnet()}');
  // run app
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initConfig();
    var theme = ThemeData(
      useMaterial3: false,
      brightness: ZapBrightness,
      scaffoldBackgroundColor: ZapBackground,
      appBarTheme: AppBarTheme(centerTitle: true, color: ZapSecondary),
      // ignore: deprecated_member_use
      accentColor: ZapPrimary,
    );
    ZapTextThemer(theme.textTheme);
    return MaterialApp(
      title: AppTitle,
      theme: theme,
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
    assetUnitsInit();
    _initApi();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log.info('App lifestyle state changed: $state');
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
    if (await Prefs.hasBeApiKey()) {
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

  void checkVersion(BeVersionResult res) {
    res.when((serverVersion, clientVersionDeployed) {
      if (clientVersionDeployed > AppVersion) {
        log.info(
            'old version $AppVersion, currently deployed version is $clientVersionDeployed');
        if (UniversalPlatform.isWeb) {
          askYesNo(context,
                  'A newer version has been released would you like to reload?')
              .then((value) {
            if (value) html.window.location.reload();
          });
        } else
          alert(context, 'Old version',
              'A newer version has been released, please update');
      }
    }, error: (_) => log.severe('failed to parse version result'));
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.version)
      checkVersion(BeVersionResult.parse(args.msg));
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
    if (args.event == WebsocketEvent.lnInvoicePaid) {
      var json = jsonDecode(args.msg);
      var bolt11 = json['bolt11'];
      var description = json['description'];
      var sats = json['amount_sat'];
      var amount = Decimal.fromInt(sats) / Decimal.fromInt(100000000);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DepositReceivedScreen(
                  Btc, BtcLn, bolt11, amount, description)));
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
          builder: (context) => BronzeRegisterForm(
                reg,
                showMobileNumber: false,
                initialMobileCountry: InitialMobileCountry,
                preferredMobileCountries: PreferredMobileCountries,
                showAddress: false,
                googlePlaceApiKey: googlePlaceApiKey(),
                locationIqApiKey: locationIqApiKey(),
              )),
    );
    if (reg == null) {
      _login();
      return;
    }
    ;
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

	Future<void> _passLoginDetails(AccountLogin login, BuildContext context, bool tfEnabled) async {
      showAlertDialog(context, 'logging in..');
      var result =
          await beUserTwoFactorEnabledCheck(login.email, login.password);
      Navigator.pop(context);
      if (await result.when<Future<bool>>((enabled) async {
        tfEnabled = enabled;
      }, error: (err) async {
        await _loginErrorAlert(context, err);
      }));
			while (true) {
				// get the two factor code if required
				if (tfEnabled)
					PopUpReturn popUpReturn = await Navigator.push<PopUpReturn>(
						context,
						MaterialPageRoute(
								builder: (context) =>
										BronzeLoginForm(login, showTwoFactorCode: tfEnabled)),
					);
				if (popUpReturn.map(
					login: (AccountLogin lgn) => await _beLogin(context, login),
					register: (AccountRegistration rg) => null,
					accountRequest: (AccountRequestApiKey req) => null,
					optionOne: () => null,
					optionTwo: () => null,
				) != null)
					{
					_initApi();
					}
				;	
			}
	}

  Future<void> _login() async {
    PopUpReturn popUpReturn;
    // first check if we need a two factor code
    bool tfEnabled = false;
    while (true) {
      popUpReturn = await Navigator.push<PopUpReturn>(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BronzeLoginForm(login, showTwoFactorCode: false)),
      );
			PopUpReturn.map(
				login: (AccountLogin login) => _passLoginDetails(login, context, tfEnabled),
				register: (AccountRegistration reg) => null,
				accountRequest: (AccountRequestApiKey req) => null,
				optionOne: () => _register(),
				optionTwo: () => _loginWithEmail(),
			);
    }
  }

  Future<void> _loginWithEmail() async {
    // request api key form
    var devName = await deviceName();
    var req = await Navigator.push<AccountRequestApiKey>(
      context,
      MaterialPageRoute(builder: (context) => BronzeRequestApiKeyForm(devName)),
    );
    if (req == null) {
      _login();
      return null;
    }
    ;
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
                    WithdrawalSelectScreen(assets, _websocket, _userInfo))),
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

  Future<void> _units() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => UnitsScreen()));
    setState(() {}); // force rerender
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
          color: ZapSecondary,
        ),
        child: _userInfo != null
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                accountImage(_userInfo?.photo, _userInfo?.photoType),
                SizedBox(height: 5),
                Text('${_userInfo?.email}',
                    style: TextStyle(color: ZapOnSecondary)),
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
              leading: Icon(Icons.settings),
              title: const Text('Units'),
              onTap: _units),
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
          title: Image.asset(AppLogo, scale: 4),
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
            Image.asset(
              'logo.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            Text(
              "Hey there!",
              style: TextStyle(
                  color: Color(0xFFFFFFFF).withOpacity(0.75), fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Let's get started",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 34),
            ),
            SizedBox(height: 15),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(
                  _login, ZapOnSecondary, ZapSecondary, bronzeGradient, 'Login',
                  holePunch: true, width: 320, height: 50),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(_register, ZapOnSecondary, ZapSecondary,
                  bronzeSecondaryGradient, 'Register',
                  holePunch: true, width: 320, height: 50),
            ),
            Visibility(
              visible: _userInfo == null,
              child: RoundedButton(_loginWithEmail, ZapOnSecondary,
                  ZapSecondary, bronzeSecondaryGradient, 'Lost Password',
                  holePunch: true, width: 320, height: 50),
            ),
            Visibility(
              visible: _invalidAuth,
              child: RoundedButton(_logout, ZapOnSecondary, ZapSecondary,
                  ZapSecondaryGradient, 'Reset',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _retry,
              child: RoundedButton(_retryAuth, ZapOnSecondary, ZapSecondary,
                  ZapSecondaryGradient, 'Retry',
                  holePunch: true, width: 200),
            ),
            // exchange widget
            _userInfo != null ? ExchangeWidget(_websocket) : SizedBox(),
            // home screen buttons
            Visibility(
                visible: _userInfo != null,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    SquareButton(_orders, Icons.shopping_cart_rounded,
                        ZapSecondary, 'Orders',
                        textColor: ZapOnSecondary,
                        textOutside: false,
                        borderSize: 0),
                    SizedBox(width: 15),
                    SquareButton(_balances, Icons.wallet_rounded, ZapSecondary,
                        'Balances',
                        textColor: ZapOnSecondary,
                        textOutside: false,
                        borderSize: 0)
                  ]),
                  SizedBox(height: 15),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    SquareButton(_deposit, Icons.keyboard_arrow_down_rounded,
                        ZapSecondary, 'Deposits',
                        textColor: ZapOnSecondary,
                        textOutside: false,
                        borderSize: 0),
                    SizedBox(width: 15),
                    SquareButton(_withdrawal, Icons.keyboard_arrow_up_rounded,
                        ZapSecondary, 'Withdrawals',
                        textColor: ZapOnSecondary,
                        textOutside: false,
                        borderSize: 0)
                  ]),
                ])),
            // debug info
            SizedBox(height: 15),
            Visibility(
              visible: testnet(),
              child: Text('TESTNET',
                  style: TextStyle(color: ZapWarning, fontSize: 8)),
            ),
            Text('Server: ${server()}',
                style: TextStyle(color: ZapOnBackgroundLight, fontSize: 8)),
            Visibility(
                visible: GitSha != 'GIT_SHA_REPLACE',
                child: Text('Build: ${GitSha.substring(0, 5)} - $BuildDate',
                    style: TextStyle(color: ZapBlackLight, fontSize: 8))),
          ],
        ),
      ),
    );
  }
}
