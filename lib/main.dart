import 'package:alloy/verify_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/utils.dart';
import 'package:zapdart/account_forms.dart';

import 'beryllium.dart';
import 'config.dart';
import 'prefs.dart';
import 'markets.dart';
import 'websocket.dart';
import 'profile.dart';
import 'utils.dart';

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

  Future<void> _initApi() async {
    var alerts = <String>[];
    if (await Prefs.hasZcApiKey()) {
      UserInfo? userInfo;
      showAlertDialog(context, 'getting account info...');
      var result = await beUserInfo();
      Navigator.pop(context);
      switch (result.error.type) {
        case ErrorType.Auth:
          alert(context, 'Authentication failed', result.error.msg);
          setState(() {
            _invalidAuth = true;
            _retry = false;
          });
          break;
        case ErrorType.Network:
          alert(context, 'Network error', 'A network error occured');
          setState(() {
            _retry = true;
            _invalidAuth = false;
          });
          break;
        case ErrorType.None:
          setState(() {
            _invalidAuth = false;
            _retry = false;
          });
          userInfo = result.info!;
          if (!userInfo.kycValidated) alerts.add('User not verified');
          _websocket.wsEvent.subscribe(_websocketEvent);
          _websocket.connect(); // connect websocket
          break;
      }
      setState(() {
        _userInfo = userInfo;
        _alerts = alerts;
      });
    }
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var info = UserInfo.parse(args.msg);
      if (info.email != _userInfo?.email)
        _websocket.connect(); // reconnect websocket
      setState(() => _userInfo = info);
      //flushbarMsg(context, 'user updated');
    }
  }

  Future<Acct?> _beLogin(BuildContext context, AccountLogin login,
      {bool silent: false}) async {
    var devName = await deviceName();
    var result = await beApiKeyCreate(login.email, login.password, devName);
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
          await Prefs.beApiKeySet(result.apikey!.token);
          await Prefs.beApiSecretSet(result.apikey!.secret);
        }
        return Acct(login.email, result.apikey?.token);
    }
    return null;
  }

  Future<Acct?> _beApiKeyClaim(
      BuildContext context, AccountRequestApiKey req, String token,
      {silent: false}) async {
    var result = await beApiKeyClaim(token);
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
          await Prefs.beApiKeySet(result.apikey!.token);
          await Prefs.beApiSecretSet(result.apikey!.secret);
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
      var res = await beUserRegister(reg);
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
            acct = await _beLogin(
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
    var acct = await _beLogin(context, login);
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
    var result = await beApiKeyRequest(req.email, req.deviceName);
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
          acct =
              await _beApiKeyClaim(context, req, result.token!, silent: true);
        }
        Navigator.pop(context);
        if (acct != null) _initApi();
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

  Future<void> _retryAuth() async {
    _initApi();
  }

  Future<void> _assets() async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AssetScreen(res.assets)));
  }

  Future<void> _markets() async {
    showAlertDialog(context, 'querying..');
    var res = await beMarkets();
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MarketScreen(res.markets, _websocket)));
  }

  Future<void> _orders() async {
    showAlertDialog(context, 'querying..');
    var res = await beOrderList(0, 1000);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrdersScreen(res.orders, _websocket)));
  }

  Future<void> _profile() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(_websocket, _userInfo!)));
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
                leading: Icon(Icons.verified_user),
                title: const Text('Verify User'),
                onTap: _verifyUser,
              )),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: _profile),
          ListTile(
              leading: Icon(Icons.view_list),
              title: const Text('Orders'),
              onTap: _orders),
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
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _assets, ZapWhite, ZapBlue, ZapBlueGradient, 'Assets',
                  holePunch: true, width: 200),
            ),
            Visibility(
              visible: _userInfo != null,
              child: RoundedButton(
                  _markets, ZapWhite, ZapBlue, ZapBlueGradient, 'Markets',
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
