import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zapdart/qrwidget.dart';
import 'package:flutter/services.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';
import 'paginator.dart';

class DepositSelectScreen extends StatefulWidget {
  final List<BeAsset> assets;
  final Websocket websocket;

  DepositSelectScreen(this.assets, this.websocket);

  @override
  State<DepositSelectScreen> createState() => _DepositSelectScreenState();
}

class _DepositSelectScreenState extends State<DepositSelectScreen> {
  Future<void> _assetTap(BeAsset asset) async {
    if (assetIsCrypto(asset.symbol))
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CryptoDepositsScreen(asset, widget.websocket)));
    else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FiatDepositsScreen(asset, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var asset = widget.assets[n];
    return ListTile(
      title: Text('${asset.symbol}'),
      leading: assetLogo(asset.symbol),
      onTap: () => _assetTap(asset),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: ListView.builder(
          itemBuilder: _listItem, itemCount: widget.assets.length),
    );
  }
}

class CryptoDepositsScreen extends StatefulWidget {
  final BeAsset asset;
  final Websocket websocket;

  CryptoDepositsScreen(this.asset, this.websocket);

  @override
  State<CryptoDepositsScreen> createState() => _CryptoDepositsScreenState();
}

class _CryptoDepositsScreenState extends State<CryptoDepositsScreen> {
  List<BeCryptoDeposit> _deposits = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initDeposits(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.cryptoDepositNew) {
      if (_pageCount == 0) {
        _deposits.insert(0, BeCryptoDeposit.parse(jsonDecode(args.msg)));
        if (_deposits.length > _itemsPerPage) _deposits.removeLast();
        setState(() => _deposits = _deposits);
      }
    }
  }

  Future<void> _initDeposits(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beCryptoDeposits(
        widget.asset.symbol, pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None) {
      setState(() {
        _deposits = res.deposits;
        _pageNumber = pageNumber;
        _pageCount = (res.total / _itemsPerPage).ceil();
      });
    }
  }

  Future<void> _depositTap(BeCryptoDeposit deposit) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CryptoDepositDetailScreen(deposit, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var deposit = _deposits[n];
    return ListTile(
      title: Text(
          '${assetFormat(deposit.asset, deposit.amount)} ${deposit.asset} - ${deposit.status.toUpperCase()}'),
      onTap: () => _depositTap(deposit),
    );
  }

  Future<void> _actionButtonTap() async {
    showAlertDialog(context, 'querying..');
    var res = await beCryptoDepositAddress(widget.asset.symbol);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None && res.address != null)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CryptoDepositNewScreen(
                  widget.asset, res.address!, widget.websocket)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposits'),
          actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
        ),
        body: ListView.builder(
            itemBuilder: _listItem, itemCount: _deposits.length),
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initDeposits(n))
            : null,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: _actionButtonTap));
  }
}

class CryptoDepositDetailScreen extends StatefulWidget {
  final BeCryptoDeposit deposit;
  final Websocket websocket;

  CryptoDepositDetailScreen(this.deposit, this.websocket);

  @override
  State<CryptoDepositDetailScreen> createState() =>
      _CryptoDepositDetailScreenState(deposit);
}

class _CryptoDepositDetailScreenState extends State<CryptoDepositDetailScreen> {
  BeCryptoDeposit _deposit;
  var _testnet = false;

  _CryptoDepositDetailScreenState(this._deposit);

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
    if (args.event == WebsocketEvent.cryptoDepositUpdate) {
      var newDeposit = BeCryptoDeposit.parse(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        flushbarMsg(context,
            'deposit updated ${newDeposit.token} - ${newDeposit.status.toUpperCase()}');
      }
    }
  }

  void _addrLaunch() {
    var url = addressBlockExplorer(_deposit.asset, _testnet, _deposit.address);
    if (url == null) return;
    urlLaunch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit ${_deposit.asset}'),
          actions: [assetLogo(_deposit.asset, margin: EdgeInsets.all(10))],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormat(_deposit.asset, _deposit.amount)} ${_deposit.asset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_deposit.date}')),
          ListTile(
              title: Text('Address'),
              subtitle: Text('${_deposit.address}'),
              onTap: _addrLaunch),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_deposit.status.toUpperCase()}')),
        ]));
  }
}

class CryptoDepositNewScreen extends StatefulWidget {
  final BeAsset asset;
  final String address;
  final Websocket websocket;

  CryptoDepositNewScreen(this.asset, this.address, this.websocket);

  @override
  State<CryptoDepositNewScreen> createState() => _CryptoDepositNewScreenState();
}

class _CryptoDepositNewScreenState extends State<CryptoDepositNewScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _copyAddress() {
    Clipboard.setData(ClipboardData(text: widget.address));
    flushbarMsg(context, 'copied address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit'),
          actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  child: QrWidget(widget.address), padding: EdgeInsets.all(10)),
              ListTile(
                  leading: SizedBox(),
                  title: Center(child: SelectableText(widget.address)),
                  trailing: IconButton(
                      onPressed: _copyAddress, icon: Icon(Icons.copy)))
            ])));
  }
}

class FiatDepositsScreen extends StatefulWidget {
  final BeAsset asset;
  final Websocket websocket;

  FiatDepositsScreen(this.asset, this.websocket);

  @override
  State<FiatDepositsScreen> createState() => _FiatDepositsScreenState();
}

class _FiatDepositsScreenState extends State<FiatDepositsScreen> {
  List<BeFiatDeposit> _deposits = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initDeposits(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.fiatDepositNew) {
      if (_pageCount == 0) {
        _deposits.insert(0, BeFiatDeposit.parse(jsonDecode(args.msg)));
        if (_deposits.length > _itemsPerPage) _deposits.removeLast();
        setState(() => _deposits = _deposits);
      }
    }
  }

  Future<void> _initDeposits(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beFiatDeposits(
        widget.asset.symbol, pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None) {
      setState(() {
        _deposits = res.deposits;
        _pageNumber = pageNumber;
        _pageCount = (res.total / _itemsPerPage).ceil();
      });
    }
  }

  Future<void> _depositTap(BeFiatDeposit deposit) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FiatDepositDetailScreen(deposit, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var deposit = _deposits[n];
    return ListTile(
      title: Text(
          '${assetFormat(deposit.asset, deposit.amount)} ${deposit.asset} - ${deposit.status.toUpperCase()}'),
      onTap: () => _depositTap(deposit),
    );
  }

  Future<void> _actionButtonTap() async {
    var amountStr = await askString(
        context, 'How much ${widget.asset.symbol} do you want to deposit?', '');
    if (amountStr == null) return;
    var amount = Decimal.tryParse(amountStr);
    if (amount == null) {
      flushbarMsg(context, 'invalid amount', category: MessageCategory.Warning);
      return;
    }
    showAlertDialog(context, 'querying..');
    var res = await beFiatDepositCreate(widget.asset.symbol, amount);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None && res.deposit != null)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FiatDepositDetailScreen(res.deposit!, widget.websocket)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposits'),
          actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
        ),
        body: ListView.builder(
            itemBuilder: _listItem, itemCount: _deposits.length),
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initDeposits(n))
            : null,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: _actionButtonTap));
  }
}

class FiatDepositDetailScreen extends StatefulWidget {
  final BeFiatDeposit deposit;
  final Websocket websocket;

  FiatDepositDetailScreen(this.deposit, this.websocket);

  @override
  State<FiatDepositDetailScreen> createState() =>
      _FiatDepositDetailScreenState(deposit);
}

class _FiatDepositDetailScreenState extends State<FiatDepositDetailScreen> {
  BeFiatDeposit _deposit;

  _FiatDepositDetailScreenState(this._deposit);

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
    if (args.event == WebsocketEvent.fiatDepositUpdate) {
      var newDeposit = BeFiatDeposit.parse(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        flushbarMsg(context,
            'deposit updated ${newDeposit.token} - ${newDeposit.status.toUpperCase()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit ${_deposit.asset}'),
          actions: [assetLogo(_deposit.asset, margin: EdgeInsets.all(10))],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormat(_deposit.asset, _deposit.amount)} ${_deposit.asset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_deposit.date}')),
          _deposit.paymentUrl != null
              ? ListTile(
                  title: Text('Payment URL'),
                  subtitle: Column(children: [
                    QrWidget(_deposit.paymentUrl!, size: 150),
                    Text('${_deposit.paymentUrl}')
                  ]),
                  onTap: () => urlLaunch(_deposit.paymentUrl))
              : SizedBox(),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_deposit.status.toUpperCase()}')),
        ]));
  }
}
