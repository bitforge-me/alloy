import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zapdart/qrwidget.dart';
import 'package:flutter/services.dart';
import 'package:decimal/decimal.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';
import 'paginator.dart';
import 'snack.dart';
import 'config.dart';

class DepositSelectScreen extends StatefulWidget {
  final List<BeAsset> assets;
  final Websocket websocket;

  DepositSelectScreen(this.assets, this.websocket);

  @override
  State<DepositSelectScreen> createState() => _DepositSelectScreenState();
}

class _DepositSelectScreenState extends State<DepositSelectScreen> {
  Future<void> _assetTap(BeAsset asset, BeAsset? l2Network) async {
    if (assetIsCrypto(asset.symbol))
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CryptoDepositsScreen(asset, l2Network, widget.websocket)));
    else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FiatDepositsScreen(asset, widget.websocket)));
  }

  int _listCount() {
    var count = 0;
    for (var asset in widget.assets) {
      count++;
      if (asset.l2Network != null) count++;
    }
    return count;
  }

  BeAsset? _listAsset(int n) {
    var count = 0;
    for (var asset in widget.assets) {
      if (count == n) return asset;
      if (asset.l2Network != null) {
        count++;
        if (count == n) return asset.l2Network;
      }
      count++;
    }
    return null;
  }

  BeAsset _parentAsset(BeAsset child) {
    for (var asset in widget.assets) if (asset.l2Network == child) return asset;
    return child;
  }

  Widget _listItem(BuildContext context, int n) {
    var asset = _listAsset(n);
    assert(asset != null);
    var parentAsset = _parentAsset(asset!);
    BeAsset? l2Network;
    if (asset != parentAsset) l2Network = asset;
    return ListTile(
      title: Text('${asset.name} (${asset.symbol})'),
      leading: assetLogo(asset.symbol),
      onTap: () => _assetTap(parentAsset, l2Network),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposits'),
      ),
      body: ListView.builder(itemBuilder: _listItem, itemCount: _listCount()),
    );
  }
}

class CryptoDepositsScreen extends StatefulWidget {
  final BeAsset asset;
  final BeAsset? l2Network;
  final Websocket websocket;

  CryptoDepositsScreen(this.asset, this.l2Network, this.websocket);

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
        _deposits.insert(0, BeCryptoDeposit.fromJson(jsonDecode(args.msg)));
        if (_deposits.length > _itemsPerPage) _deposits.removeLast();
        setState(() => _deposits = _deposits);
      }
    }
  }

  Future<void> _initDeposits(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beCryptoDeposits(widget.asset.symbol,
        widget.l2Network?.symbol, pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    res.when((deposits, offset, limit, total) {
      setState(() {
        _deposits = deposits;
        _pageNumber = pageNumber;
        _pageCount = (total / _itemsPerPage).ceil();
      });
    },
        error: (err) => snackMsg(context, 'failed to query deposits',
            category: MessageCategory.Warning));
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
          '${assetFormat(deposit.asset, deposit.amount)} ${deposit.asset} - ${deposit.confirmed ? 'CONFIRMED' : 'PENDING'}'),
      onTap: () => _depositTap(deposit),
    );
  }

  Future<void> _actionButtonTap() async {
    var amount = Decimal.zero;
    if (widget.l2Network != null) {
      var amountStr = await askString(context,
          'How much ${widget.asset.symbol} would you like to deposit?', null);
      if (amountStr == null) return;
      var amountDec = Decimal.tryParse(amountStr);
      if (amountDec == null || amountDec <= Decimal.zero) {
        snackMsg(context, 'invalid amount', category: MessageCategory.Warning);
        return;
      }
      amount = amountDec;
    }
    showAlertDialog(context, 'querying..');
    var res = await beCryptoDepositRecipient(
        widget.asset.symbol, widget.l2Network?.symbol, amount);
    Navigator.pop(context);
    res.when(
        (recipient, asset, l2Network) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CryptoDepositNewScreen(widget.asset,
                    widget.l2Network, recipient, widget.websocket))),
        error: (err) => snackMsg(context, 'failed to query deposit recipient',
            category: MessageCategory.Warning));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${widget.l2Network == null ? widget.asset.symbol : widget.l2Network!.symbol} Deposits'),
          actions: [
            assetLogo(
                widget.l2Network == null
                    ? widget.asset.symbol
                    : widget.l2Network!.symbol,
                margin: EdgeInsets.all(10))
          ],
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
  var _testnet = Testnet;

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
      var newDeposit = BeCryptoDeposit.fromJson(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        snackMsg(context,
            'deposit updated ${newDeposit.token} - ${newDeposit.confirmed ? 'CONFIRMED' : 'PENDING'}');
      }
    }
  }

  void _addrLaunch() {
    var url =
        addressBlockExplorer(_deposit.asset, _testnet, '${_deposit.recipient}');
    if (url == null) return;
    urlLaunch(url);
  }

  void _copyRecipient() {
    Clipboard.setData(ClipboardData(text: _deposit.recipient));
    snackMsg(context, 'copied recipient');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Deposit ${_deposit.l2Network == null ? _deposit.asset : _deposit.l2Network}'),
          actions: [
            assetLogo(
                _deposit.l2Network == null
                    ? _deposit.asset
                    : _deposit.l2Network!,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormat(_deposit.asset, _deposit.amount)} ${_deposit.asset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_deposit.date}')),
          ListTile(
              title: Center(
                  child: QrImage(
            data: '${_deposit.recipient}',
            version: QrVersions.auto,
            size: 200.0,
          ))),
          ListTile(
              title: Text('Recipient'),
              subtitle: Text(shortenStr(_deposit.recipient)),
              onTap: _addrLaunch,
              trailing: IconButton(
                  onPressed: _copyRecipient, icon: Icon(Icons.copy))),
          ListTile(
              title: Text('Status'),
              subtitle:
                  Text('${_deposit.confirmed ? 'CONFIRMED' : 'PENDING'}')),
        ]));
  }
}

class CryptoDepositNewScreen extends StatefulWidget {
  final BeAsset asset;
  final BeAsset? l2Network;
  final String recipient;
  final Websocket websocket;

  CryptoDepositNewScreen(
      this.asset, this.l2Network, this.recipient, this.websocket);

  @override
  State<CryptoDepositNewScreen> createState() => _CryptoDepositNewScreenState();
}

class _CryptoDepositNewScreenState extends State<CryptoDepositNewScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _copyRecipient() {
    Clipboard.setData(ClipboardData(text: widget.recipient));
    snackMsg(context, 'copied recipient');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit'),
          actions: [
            assetLogo(
                widget.l2Network != null
                    ? widget.l2Network!.symbol
                    : widget.asset.symbol,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  child: Center(
                      child: QrImage(
                    data: '${widget.recipient}',
                    version: QrVersions.auto,
                    size: 200.0,
                  )),
                  padding: EdgeInsets.all(10)),
              ListTile(
                  leading: SizedBox(),
                  title: Center(child: Text(shortenStr(widget.recipient))),
                  trailing: IconButton(
                      onPressed: _copyRecipient, icon: Icon(Icons.copy)))
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
        _deposits.insert(0, BeFiatDeposit.fromJson(jsonDecode(args.msg)));
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
    res.when(
        (deposits, offset, limit, total) => setState(() {
              _deposits = deposits;
              _pageNumber = pageNumber;
              _pageCount = (total / _itemsPerPage).ceil();
            }),
        error: (err) => alert(
            context, 'error', 'failed to get deposits (${BeError.msg(err)})'));
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
      snackMsg(context, 'invalid amount', category: MessageCategory.Warning);
      return;
    }
    showAlertDialog(context, 'querying..');
    var res = await beFiatDepositCreate(widget.asset.symbol, amount);
    Navigator.pop(context);
    res.when(
        (deposit) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FiatDepositDetailScreen(deposit, widget.websocket))),
        error: (err) => alert(context, 'error',
            'failed to create deposit (${BeError.msg(err)})'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.asset.symbol} Deposits'),
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
      var newDeposit = BeFiatDeposit.fromJson(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        snackMsg(context,
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
