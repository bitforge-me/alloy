import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:universal_html/html.dart' as html;
import 'package:decimal/decimal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/utils.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart' as cfg;
import 'prefs.dart';
import 'beryllium.dart';
import 'orders.dart';
import 'websocket.dart';
import 'profile.dart';
import 'security.dart';
import 'utils.dart';
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
import 'autobuy.dart';

final log = Logger('Main');
final routeObserver = RouteObserver<Route>();

void main() {
  // setup logging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  log.info('Git SHA: ${cfg.GitSha}');
  log.info('Build Date: ${cfg.BuildDate}');
  log.info('Beryllium Server: ${cfg.server()}');
  log.info('Testnet: ${cfg.testnet()}');
  // run app
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cfg.initConfig();
    var theme = ThemeData(
        useMaterial3: false,
        brightness: ZapBrightness,
        scaffoldBackgroundColor: ZapBackground,
        appBarTheme: AppBarTheme(centerTitle: true, color: ZapSecondary),
        // ignore: deprecated_member_use
        accentColor: ZapPrimary,
        // create text theme with the correct 'brightness' (eg light or dark)
        textTheme:
            ZapTextThemer(ThemeData(brightness: ZapBrightness).textTheme));
    return MaterialApp(
      title: cfg.AppTitle,
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: cfg.AppTitle),
      navigatorObservers: [routeObserver],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with WidgetsBindingObserver, RouteAware {
  Websocket _websocket = Websocket();
  UserInfo? _userInfo;
  List<BeBalance> _balances = [];
  List<String> _alerts = [];
  int _balanceCarouselPage = 0;
  final CarouselController _balanceCarouselController = CarouselController();
  Widget? priceWidget;

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = ModalRoute.of(context);
    if (route != null) routeObserver.subscribe(this, route);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    unfocusText();
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
    if (result == null) {
      _initApi();
      return;
    }
    result.when(
        choose: (_) => throw Exception(
            'login choice should not have been passed back here'),
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
      // if we got the user info try for the balances
      if (userInfo != null) {
        _updateBalances();
        _getPriceWidget();
        _repeatedlyCallGetPriceWidget();
      }
    } else
      _startLogin(false, false);
  }

  void _updateBalances() {
    beBalances().then((value) => value.when(
        (balances) => setState(() => _balances = balances),
        error: (_) => false));
  }

  void _checkVersion(BeVersionResult res) {
    res.when((serverVersion, clientVersionDeployed) {
      if (clientVersionDeployed > cfg.AppVersion) {
        log.info(
            'old version ${cfg.AppVersion}, currently deployed version is $clientVersionDeployed');
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
      _checkVersion(BeVersionResult.parse(args.msg));
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
    if (args.event == WebsocketEvent.cryptoWithdrawalNew ||
        args.event == WebsocketEvent.cryptoWithdrawalUpdate ||
        args.event == WebsocketEvent.cryptoDepositNew ||
        args.event == WebsocketEvent.cryptoDepositUpdate ||
        args.event == WebsocketEvent.fiatWithdrawalNew ||
        args.event == WebsocketEvent.fiatWithdrawalUpdate ||
        args.event == WebsocketEvent.fiatDepositNew ||
        args.event == WebsocketEvent.fiatDepositUpdate ||
        args.event == WebsocketEvent.brokerOrderUpdate ||
        args.event == WebsocketEvent.brokerOrderNew) {
      // update balance on crypto withdrawals or deposits
      _updateBalances();
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
          '${cfg.SupportUrl}?email=${Uri.encodeQueryComponent(_userInfo!.email)}');
    else
      await urlLaunch(cfg.SupportUrl);
  }

  Future<void> _legal() async {
    await urlLaunch(cfg.LegalUrl);
  }

  Future<void> _logout() async {
    if (await askYesNo(context, 'Are you sure you want to logout?')) {
      await Prefs.nukeAll();
      Phoenix.rebirth(context);
    }
  }

  void _getPriceWidget() {
    setState(() {
      priceWidget = Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BtcPriceWidget(),
            ],
          ),
          SizedBox(width: 8),
        ],
      );
    });
  }

  void _repeatedlyCallGetPriceWidget() {
    const fiveMins = Duration(minutes: 5);
    Timer.periodic(fiveMins, (Timer t) => _getPriceWidget());
  }

  Future<void> _deposit() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DepositsScreen(_websocket)));
  }

  Future<void> _withdrawal() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WithdrawalsScreen(_websocket, _userInfo)));
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

  Future<void> _autobuy() async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    var res2 = await beMarkets();
    Navigator.pop(context);
    res.when((assets) async {
      res2.when(
          (markets) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AutobuyScreen(markets, assets, _websocket))),
          error: (err) => snackMsg(context, 'failed to query markets',
              category: MessageCategory.Warning));
    },
        error: (err) => snackMsg(context, 'failed to query assets',
            category: MessageCategory.Warning));
  }

  Future<void> _verifyUser() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyUserScreen(_userInfo!, _websocket)));
  }

  Drawer _makeDrawer(BuildContext contex) {
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
        child: Column(children: [
      header,
      _alerts.isNotEmpty ? AlertDrawer(() {}, _alerts) : SizedBox(),
      Visibility(
          visible: _userInfo?.kycValidated != true,
          child: ListTile(
            leading: _gradientIcon(Icons.verified_user),
            title: const Text('Verify User'),
            onTap: _verifyUser,
          )),
      ListTile(
          leading: Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: _profile),
      ListTile(
          leading: _userInfo?.tfEnabled == true
              ? Icon(Icons.shield)
              : _gradientIcon(Icons.shield),
          title: const Text('Security'),
          onTap: _security),
      ListTile(
          leading: Icon(Icons.settings),
          title: const Text('Preferences'),
          onTap: _units),
      ListTile(
          leading: Icon(Icons.contact_support),
          title: const Text('Support'),
          onTap: _support),
      ListTile(
          leading: Icon(Icons.gavel),
          title: const Text('Legal'),
          onTap: _legal),
      ListTile(
          leading: Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: _logout),
      Expanded(child: SizedBox()),
      DebugInfo()
    ]));
  }

  Widget _makeBalanceCarousel(BuildContext context) {
    var cards = <BalanceCard>[];
    for (var balance in _balances)
      cards.add(BalanceCard(
          '${balance.name} Balance',
          PriceEquivalent(balance.asset, balance.available,
              twoLines: true,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          assetGradient(balance.asset),
          assetBackgroundPng(balance.asset)));
    return LayoutBuilder(builder: (context, constraints) {
      var doubleUp = constraints.maxWidth >= cfg.MaxColumnWidth;
      var count = doubleUp ? (cards.length / 2).round() : cards.length;
      return Column(children: [
        CarouselSlider.builder(
            options: CarouselOptions(
                onPageChanged: (int index, _) =>
                    setState(() => _balanceCarouselPage = index),
                initialPage: _balanceCarouselPage,
                // make the viewport fraction 1 so that the cards are always actually 'ButtonWidth' wide
                // we will instead indicate you can slide with indicators
                viewportFraction: 1,
                height: BalanceCard.HEIGHT,
                enlargeCenterPage: true),
            carouselController: _balanceCarouselController,
            itemCount: count,
            itemBuilder: (context, index, realIdx) {
              if (doubleUp) {
                final int first = index * 2;
                final int second = first + 1;
                if (cards.length > second)
                  return Row(mainAxisSize: MainAxisSize.min, children: [
                    cards[first],
                    SizedBox(width: 50),
                    cards[second]
                  ]);
                else
                  return cards[first];
              } else
                return cards[index];
            }),
        // row of carousel indicators
        count > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Iterable<int>.generate(count).map((index) {
                  return GestureDetector(
                      onTap: () =>
                          _balanceCarouselController.animateToPage(index),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ZapOnBackground.withOpacity(
                                _balanceCarouselPage == index ? 0.9 : 0.4)),
                      ));
                }).toList())
            : SizedBox()
      ]);
    });
  }

  void _onBottomNavBarTap(int index) {
    switch (index) {
      case 0:
        _orders();
        break;
      case 1:
        _deposit();
        break;
      case 2:
        _withdrawal();
        break;
      case 3:
        _autobuy();
        break;
      default:
        break;
    }
  }

  ShaderMask _gradientIcon(IconData icon, {double? size, String? text}) {
    Widget widget = Icon(icon, size: size, color: Colors.white);
    if (text != null)
      widget = Column(children: [
        widget,
        Text(text, style: TextStyle(color: Colors.white))
      ]);
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xfff46b45), Color(0xffeea849)],
        ).createShader(bounds);
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(cfg.AppLogo, filterQuality: FilterQuality.high),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: _gradientIcon(Icons.menu),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              onPressed: () => Scaffold.of(context).openDrawer(),
              color: _alerts.isNotEmpty ? ZapWarning : null,
            );
          }),
          actions: [
            priceWidget ?? SizedBox(),
          ],
        ),
        drawer: _makeDrawer(context),
        onDrawerChanged: (isOpened) => unfocusText(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          onTap: _onBottomNavBarTap,
          backgroundColor: ZapSecondary,
          selectedLabelStyle: TextStyle(fontSize: 12, color: ZapPrimary),
          unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
          items: [
            BottomNavigationBarItem(
                icon: _gradientIcon(Icons.history,
                    size: 28.0, text: 'Order History'),
                label: 'Order History'),
            BottomNavigationBarItem(
                icon: _gradientIcon(Icons.keyboard_double_arrow_down_rounded,
                    size: 28.0, text: 'Deposits'),
                label: 'Deposits'),
            BottomNavigationBarItem(
                icon: _gradientIcon(Icons.keyboard_double_arrow_up_rounded,
                    size: 28.0, text: 'Withdrawals'),
                label: 'Widthdrawals'),
            BottomNavigationBarItem(
                icon: _gradientIcon(Icons.auto_awesome,
                    size: 28.0, text: 'Autobuy'),
                label: 'Autobuy')
          ],
        ),
        body: BiforgePage(
            scrollChild: true,
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(children: [
                  VerticalSpacer(
                      height:
                          constraints.maxWidth >= cfg.MaxColumnWidth ? 50 : 25),
                  // balance carousel
                  _balances.length > 0
                      ? _makeBalanceCarousel(context)
                      : SizedBox(),
                  VerticalSpacer(
                      height:
                          constraints.maxWidth >= cfg.MaxColumnWidth ? 50 : 0),
                  // exchange widget
                  _userInfo != null ? ExchangeWidget(_websocket) : SizedBox(),
                  VerticalSpacer(
                      height:
                          constraints.maxWidth >= cfg.MaxColumnWidth ? 50 : 0),
                ]);
              }),
            )));
  }
}
