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
import 'login.dart';
import 'assets.dart';
import 'event.dart';
import 'widgets.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  Websocket _websocket = Websocket();
  UserInfo? _userInfo;
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

  Future<void> _startLogin(bool invalidAuth, bool retry,
      {String? errTitle, String? errMessage}) async {
    var result = await Navigator.push<LoginResult>(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StagingForm(invalidAuth, retry, errTitle, errMessage)));
    if (result == null) _initApi();
    result!.when(
        acct: (_) => _initApi(),
        reset: () => _logout(),
        retry: () => _initApi(),
        nothing: () => _initApi());
  }

  Future<void> _initApi() async {
    if (await Prefs.hasBeApiKey()) {
      UserInfo? userInfo;
      showAlertDialog(context, 'getting account info...');
      var result = await beUserInfo();
      Navigator.pop(context);
      result.when((UserInfo info) {
        userInfo = info;
        _websocket.wsEvent.subscribe(_websocketEvent);
        _websocket.connect(); // connect websocket
      }, error: (err) {
        err.when(network: () {
          _startLogin(false, true,
              errTitle: 'Network error', errMessage: 'A network error occured');
        }, auth: (msg) {
          _startLogin(true, false,
              errTitle: 'Authentication failed', errMessage: msg);
        }, format: () {
          _startLogin(false, true,
              errTitle: 'Format error', errMessage: 'A format error occured');
        });
      });
      setState(() {
        _userInfo = userInfo;
        _alerts = _generateAlerts(userInfo);
      });
    } else
      _startLogin(false, false);
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
                VerticalSpacer(height: 5),
                Text('${_userInfo?.email}',
                    style: TextStyle(color: ZapOnSecondary)),
                //VerticalSpacer(height: 5),
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
            title: Image.asset(AppLogo, filterQuality: FilterQuality.high),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                onPressed: () => Scaffold.of(context).openDrawer(),
                color: _alerts.isNotEmpty ? ZapWarning : null,
              );
            })),
        drawer: makeDrawer(context),
        body: BiforgePage(
          scrollChild: true,
          showDebugInfo: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // exchange widget
                _userInfo != null ? ExchangeWidget(_websocket) : SizedBox(),
                // home screen buttons
                Visibility(
                    visible: _userInfo != null,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        SquareButton(_orders, Icons.history, ZapSecondary,
                            'Order History',
                            textColor: ZapOnSecondary,
                            textOutside: false,
                            borderSize: 0,
                            fontSize: 18),
                        SizedBox(width: 15),
                        SquareButton(_balances, Icons.wallet_rounded,
                            ZapSecondary, 'Balances',
                            textColor: ZapOnSecondary,
                            textOutside: false,
                            borderSize: 0,
                            fontSize: 18)
                      ]),
                      VerticalSpacer(),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        SquareButton(
                            _deposit,
                            Icons.keyboard_double_arrow_down_rounded,
                            ZapSecondary,
                            'Deposits',
                            textColor: ZapOnSecondary,
                            textOutside: false,
                            borderSize: 0,
                            fontSize: 18),
                        SizedBox(width: 15),
                        SquareButton(
                            _withdrawal,
                            Icons.keyboard_double_arrow_up_rounded,
                            ZapSecondary,
                            'Withdrawals',
                            textColor: ZapOnSecondary,
                            textOutside: false,
                            borderSize: 0,
                            fontSize: 18)
                      ]),
                    ])),
              ],
            ),
          ),
        ));
  }
}
