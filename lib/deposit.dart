import 'dart:convert';

import 'package:alloy/units.dart';
import 'package:flutter/material.dart';
import 'package:zapdart/colors.dart';
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
import 'event.dart';
import 'widgets.dart';

class DepositsScreen extends StatefulWidget {
  final Websocket websocket;

  DepositsScreen(this.websocket);

  @override
  State<DepositsScreen> createState() => _DepositsScreenState();
}

class _DepositsScreenState extends State<DepositsScreen> {
  List<BeBalanceUpdate> _deposits = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    var deposits = _deposits.toList();
    if (args.event == WebsocketEvent.depositNew) {
      if (_pageNumber == 0) {
        var deposit = BeBalanceUpdate.fromJson(jsonDecode(args.msg));
        deposits.insert(0, deposit);
        if (deposits.length > _itemsPerPage) deposits.removeLast();
        setState(() => _deposits = deposits);
      }
    }
    if (args.event == WebsocketEvent.depositUpdate) {
      var updatedDeposit = BeBalanceUpdate.fromJson(jsonDecode(args.msg));
      for (var i = 0; i < deposits.length; i++) {
        var deposit = deposits[i];
        if (updatedDeposit.token == deposit.token) {
          deposits[i] = updatedDeposit;
          setState(() => _deposits = deposits);
          snackMsg(context, 'deposit updated ${updatedDeposit.token}');
          break;
        }
      }
    }
  }

  Future<void> _initDeposits(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beDepositsAll(pageNumber * _itemsPerPage, _itemsPerPage);
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

  Future<void> _download() async {
    var offset = 0;
    var limit = 200;
    List<BeBalanceUpdate> totalDeposits = [];
    // get all orders
    showAlertDialog(context, 'querying..');
    var res = await beDepositsAll(offset, limit);
    while (true) {
      var finished = res.when<bool>((deposits, os, lm, total) {
        totalDeposits += deposits;
        offset += deposits.length;
        return offset >= total;
      }, error: (err) {
        alert(
            context, 'error', 'failed to query deposits (${BeError.msg(err)})');
        return true;
      });
      if (finished) break;
      res = await beDepositsAll(offset, limit);
    }
    Navigator.pop(context);
    // make csv
    var csv = 'token, date, asset, amount, fee, recipient, status\n';
    for (var deposit in totalDeposits) {
      csv +=
          '${deposit.token}, ${deposit.date}, ${deposit.asset}, ${deposit.amount}, ${deposit.fee}, ${deposit.recipient}, ${deposit.status}\n';
    }
    // save
    saveCsvFile(context, 'bitforge_deposits', csv);
  }

  Future<void> _depositTap(BeBalanceUpdate deposit) async {
    if (assetIsCrypto(deposit.asset))
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CryptoDepositDetailScreen(deposit, widget.websocket)));
    else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FiatDepositDetailScreen(deposit, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var deposit = _deposits[n];
    return ListTx(
        () => _depositTap(deposit),
        deposit.date,
        Row(children: [
          assetLogo(
              deposit.l2Network != null ? deposit.l2Network! : deposit.asset),
          SizedBox(width: 15),
          Text(deposit.status.toUpperCase())
        ]),
        deposit.amount,
        deposit.asset,
        ListTxDir.down,
        last: n == _deposits.length - 1);
  }

  Future<void> _make() async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    Navigator.pop(context);
    res.when(
        (assets) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DepositSelectScreen(assets, widget.websocket))),
        error: (err) => snackMsg(context, 'failed to query deposits',
            category: MessageCategory.Warning));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposits'),
          actions: [
            IconButton(onPressed: _download, icon: Icon(Icons.download))
          ],
        ),
        body: BitforgePage(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              VerticalSpacer(),
              BronzeRoundedButton(_make, ZapOnPrimary, ZapPrimary,
                  ZapPrimaryGradient, 'Make Deposit',
                  width: ButtonWidth, height: ButtonHeight, fwdArrow: true),
              VerticalSpacer(),
              _deposits.length == 0
                  ? Container(
                      margin: EdgeInsets.all(20),
                      child: Center(child: Text('No deposits')))
                  : Expanded(
                      child: ListView.builder(
                          itemBuilder: _listItem, itemCount: _deposits.length))
            ])),
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initDeposits(n))
            : null);
  }
}

class DepositSelectScreen extends StatefulWidget {
  final List<BeAsset> assets;
  final Websocket websocket;

  DepositSelectScreen(this.assets, this.websocket);

  @override
  State<DepositSelectScreen> createState() => _DepositSelectScreenState();
}

class _DepositSelectScreenState extends State<DepositSelectScreen> {
  Future<bool> _cryptoDeposit(
      BeAsset asset, BeAsset? l2Network, Decimal amount) async {
    showAlertDialog(context, 'querying..');
    var res =
        await beCryptoDepositRecipient(asset.symbol, l2Network?.symbol, amount);
    Navigator.pop(context);
    return await res.when((recipient, asset_, l2Network_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CryptoDepositNewScreen(
                  asset, l2Network, recipient, widget.websocket)));
      return true;
    }, error: (err) async {
      var msg = BeError.msg(err);
      snackMsg(
          context,
          l2Network != null
              ? 'failed to create deposit: ${msg}'
              : 'failed to query deposit recipient: ${msg}',
          category: MessageCategory.Warning);
      return false;
    });
  }

  Future<void> _assetTap(BeAsset asset, BeAsset? l2Network) async {
    var success = false;
    if (assetIsCrypto(asset.symbol)) {
      // crypto deposit
      var amount = Decimal.zero;
      if (l2Network != null) {
        while (!success) {
          var amountStr = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DepositAmountScreen(asset.symbol, l2Network.symbol)));
          if (amountStr == null) return;
          var amountDec = Decimal.tryParse(amountStr);
          if (amountDec == null || amountDec <= Decimal.zero) {
            snackMsg(context, 'invalid amount',
                category: MessageCategory.Warning);
            return;
          }
          amount = amountDec;
          amount = assetAmountFromUser(asset.symbol, amount);
          success = await _cryptoDeposit(asset, l2Network, amount);
        }
      } else
        success = await _cryptoDeposit(asset, l2Network, amount);
    } else {
      // fiat deposit
      var method = await Navigator.push<DepositMethodDetails>(
          context,
          MaterialPageRoute(
              builder: (context) => DepositMethodScreen(asset.symbol, null,
                  [DepositMethod.account2account, DepositMethod.bankDeposit])));
      if (method == null) return;
      switch (method.method) {
        case DepositMethod.account2account:
          while (!success) {
            var amountStr = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DepositAmountScreen(asset.symbol, null)));
            if (amountStr == null) return;
            var amount = Decimal.tryParse(amountStr);
            if (amount == null) {
              snackMsg(context, 'invalid amount',
                  category: MessageCategory.Warning);
              return;
            }
            amount = assetAmountFromUser(asset.symbol, amount);
            showAlertDialog(context, 'querying..');
            var res = await beFiatDepositWindcave(asset.symbol, amount);
            Navigator.pop(context);
            await res.when((deposit) async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FiatDepositDetailScreen(deposit, widget.websocket)));
              success = true;
            }, error: (err) async {
              var msg = BeError.msg(err);
              snackMsg(context, 'failed to create deposit: ${msg}',
                  category: MessageCategory.Warning);
            });
          }
          ;
          break;
        case DepositMethod.bankDeposit:
          showAlertDialog(context, 'querying..');
          var res = await beFiatDepositDirect(asset.symbol);
          Navigator.pop(context);
          await res.when((deposit) async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FiatAccountNumberScreen(
                        asset, deposit, widget.websocket)));
            success = true;
          },
              error: (err) => alert(context, 'error',
                  'failed to get deposit details (${BeError.msg(err)})'));
      }
    }
    if (success)
      // hide this selection screen if deposit succesfully created
      Navigator.pop(context);
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
        title: Text('Make Deposit'),
      ),
      body: BitforgePage(
          child: ListView.builder(
              itemBuilder: _listItem, itemCount: _listCount())),
    );
  }
}

class CryptoDepositDetailScreen extends StatefulWidget {
  final BeBalanceUpdate deposit;
  final Websocket websocket;

  CryptoDepositDetailScreen(this.deposit, this.websocket);

  @override
  State<CryptoDepositDetailScreen> createState() =>
      _CryptoDepositDetailScreenState(deposit);
}

class _CryptoDepositDetailScreenState extends State<CryptoDepositDetailScreen> {
  BeBalanceUpdate _deposit;
  var _testnet = testnet();

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
      var newDeposit = BeBalanceUpdate.fromJson(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        snackMsg(context,
            'deposit updated ${newDeposit.token} - ${newDeposit.status.toUpperCase()}');
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
        body: BitforgePage(
            child: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: PriceEquivalent(_deposit.asset, _deposit.amount)),
          ListTile(title: Text('Date'), subtitle: Text('${_deposit.date}')),
          ListTile(
              title: Center(
                  child: QrImageView(
            backgroundColor: Colors.transparent,
            eyeStyle: QrEyeStyle(color: Colors.white),
            dataModuleStyle: QrDataModuleStyle(color: Colors.white),
            data: '${_deposit.recipient}',
            version: QrVersions.auto,
            size: 300.0,
          ))),
          ListTile(
              title: Text(
                  "${_deposit.l2Network == null ? 'Recipient' : 'Invoice'}"),
              subtitle: Text(shortenStr(_deposit.recipient),
                  style: TextStyle(fontFamily: MonospaceFont)),
              onTap: _deposit.l2Network == null ? _addrLaunch : _copyRecipient,
              trailing: IconButton(
                  onPressed: _copyRecipient, icon: Icon(Icons.copy))),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_deposit.status.toUpperCase()}')),
          VerticalSpacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            BronzeRoundedButton(() => Navigator.of(context).pop(), Colors.white,
                Colors.white30, null, 'Close',
                width: ButtonWidth, height: ButtonHeight)
          ]),
        ])));
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
    String closeBtnText = widget.l2Network != null ? 'Close' : 'Cancel';
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
        body: BitforgePage(
            scrollChild: true,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Visibility(
                      visible: widget.asset.depositInstr != null,
                      child:
                          AlertDrawer(() {}, ['${widget.asset.depositInstr}'])),
                  Container(
                      child: Center(
                          child: QrImageView(
                        backgroundColor: Colors.transparent,
                        eyeStyle: QrEyeStyle(color: Colors.white),
                        dataModuleStyle: QrDataModuleStyle(color: Colors.white),
                        data: '${widget.recipient}',
                        version: QrVersions.auto,
                        size: 300.0,
                      )),
                      padding: EdgeInsets.all(10)),
                  VerticalSpacer(),
                  Text(shortenStr(widget.recipient),
                      style: TextStyle(fontFamily: MonospaceFont)),
                  VerticalSpacer(),
                  BronzeRoundedButton(_copyRecipient, Colors.white,
                      Color(0xff32333b), null, 'Copy to Clipboard',
                      width: ButtonWidth,
                      height: ButtonHeight,
                      icon: Icons.copy),
                  BronzeRoundedButton(() => Navigator.of(context).pop(),
                      Colors.white, Colors.white30, null, closeBtnText,
                      width: ButtonWidth, height: ButtonHeight)
                ]))));
  }
}

class FiatDepositDetailScreen extends StatefulWidget {
  final BeBalanceUpdate deposit;
  final Websocket websocket;

  FiatDepositDetailScreen(this.deposit, this.websocket);

  @override
  State<FiatDepositDetailScreen> createState() =>
      _FiatDepositDetailScreenState(deposit);
}

class _FiatDepositDetailScreenState extends State<FiatDepositDetailScreen> {
  BeBalanceUpdate _deposit;

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
      var newDeposit = BeBalanceUpdate.fromJson(jsonDecode(args.msg));
      if (_deposit.token == newDeposit.token) {
        setState(() => _deposit = newDeposit);
        snackMsg(context,
            'deposit updated ${newDeposit.token} - ${newDeposit.status.toUpperCase()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    BeBalanceUpdateStatus? status;
    try {
      status = BeBalanceUpdateStatus.values.byName(_deposit.status);
    } catch (_) {}
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit ${_deposit.asset}'),
          actions: [assetLogo(_deposit.asset, margin: EdgeInsets.all(10))],
        ),
        body: BitforgePage(
            child: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: PriceEquivalent(_deposit.asset, _deposit.amount)),
          ListTile(title: Text('Date'), subtitle: Text('${_deposit.date}')),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_deposit.status.toUpperCase()}')),
          _deposit.paymentUrl != null &&
                  status != BeBalanceUpdateStatus.completed &&
                  status != BeBalanceUpdateStatus.cancelled
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  BronzeRoundedButton(
                      () => urlLaunch(_deposit.paymentUrl),
                      ZapOnPrimary,
                      ZapPrimary,
                      ZapPrimaryGradient,
                      'Complete Payment',
                      width: ButtonWidth,
                      height: ButtonHeight)
                ])
              : SizedBox(),
          VerticalSpacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BronzeRoundedButton(() => Navigator.of(context).pop(), Colors.white,
                Colors.white30, null, 'Close',
                width: ButtonWidth, height: ButtonHeight)
          ])
        ])));
  }
}

class FiatAccountNumberScreen extends StatefulWidget {
  final BeAsset asset;
  final BeFiatAccountNumber account;
  final Websocket websocket;
  final String? extraInfo;

  FiatAccountNumberScreen(this.asset, this.account, this.websocket,
      {this.extraInfo});

  @override
  State<FiatAccountNumberScreen> createState() =>
      _FiatAccountNumberScreenState();
}

class _FiatAccountNumberScreenState extends State<FiatAccountNumberScreen> {
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
  }

  void _copy(String name, String value) {
    Clipboard.setData(ClipboardData(text: value));
    snackMsg(context, 'copied $name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit ${widget.asset.symbol}'),
          actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
        ),
        body: BitforgePage(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: ListView(children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                          child: Icon(Icons.keyboard_double_arrow_down_rounded,
                              size: 150, color: ZapOnSecondary))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                          'Make a deposit to our bank account. It is important to provide the exact reference and code details shown here.')),
                  widget.extraInfo != null
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(widget.extraInfo!))
                      : SizedBox(),
                  ListTile(
                      title: Text('Bitforge Account Number'),
                      subtitle: Text(widget.account.accountNumber,
                          style: TextStyle(fontFamily: MonospaceFont)),
                      trailing: IconButton(
                          onPressed: () => _copy(
                              'account number', widget.account.accountNumber),
                          icon: Icon(Icons.copy))),
                  ListTile(
                      title: Text('Reference'),
                      subtitle: Text(widget.account.reference,
                          style: TextStyle(fontFamily: MonospaceFont)),
                      trailing: IconButton(
                          onPressed: () =>
                              _copy('reference', widget.account.reference),
                          icon: Icon(Icons.copy))),
                  ListTile(
                      title: Text('Code'),
                      subtitle: Text(widget.account.code,
                          style: TextStyle(fontFamily: MonospaceFont)),
                      trailing: IconButton(
                          onPressed: () => _copy('code', widget.account.code),
                          icon: Icon(Icons.copy))),
                  VerticalSpacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    BronzeRoundedButton(() => Navigator.of(context).pop(),
                        Colors.white, Colors.white30, null, 'Close',
                        width: ButtonWidth, height: ButtonHeight)
                  ])
                ]))));
  }
}
