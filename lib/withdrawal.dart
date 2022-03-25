import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:logging/logging.dart';
import 'package:flutter/services.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/form_ui.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';
import 'paginator.dart';
import 'markets.dart';
import 'cryptocurrency.dart';
import 'snack.dart';
import 'config.dart';
import 'qrscan.dart';

final log = Logger('Withdrawal');

class WithdrawalCheckScreen extends StatefulWidget {
  final bool testnet;
  final BeAsset asset;
  final BeAsset? l2Network;
  final String amount;
  final String recipient;

  WithdrawalCheckScreen(
      this.testnet, this.asset, this.l2Network, this.amount, this.recipient);

  @override
  State<WithdrawalCheckScreen> createState() => _WithdrawalCheckScreenState();
}

class _WithdrawalCheckScreenState extends State<WithdrawalCheckScreen> {
  var _extractedAmount = '';

  @override
  void initState() {
    if (widget.amount.isEmpty && widget.l2Network != null) {
      var res = l2RecipientValidate(
          widget.l2Network!.symbol, widget.testnet, widget.recipient);
      if (res.result && res.amount != null)
        _extractedAmount = res.amount.toString();
      else
        _extractedAmount = '!ERROR!';
    }
    super.initState();
  }

  void _cancel() {
    Navigator.pop(context, false);
  }

  void _ok() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Confirm Withdrawal'),
          actions: [
            assetLogo(
                widget.l2Network != null
                    ? widget.l2Network!.symbol
                    : widget.asset.symbol,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                      'Sending ${widget.amount.isNotEmpty ? widget.amount : _extractedAmount} ${widget.asset.symbol} to ${widget.recipient}')),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                raisedButton(onPressed: _cancel, child: Text('Cancel')),
                raisedButton(onPressed: _ok, child: Text('Ok')),
              ])
            ])));
  }
}

class WithdrawalFormScreen extends StatefulWidget {
  final BeAsset asset;
  final BeAsset? l2Network;
  final Websocket websocket;
  final UserInfo? userInfo;

  WithdrawalFormScreen(
      this.asset, this.l2Network, this.websocket, this.userInfo);

  @override
  State<WithdrawalFormScreen> createState() => _WithdrawalFormScreenState();
}

class _WithdrawalFormScreenState extends State<WithdrawalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();
  final _recipientDescriptionController = TextEditingController();

  var _saveRecipient = false;
  var _testnet = Testnet;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _addressBook() async {
    var asset = widget.asset.symbol;
    showAlertDialog(context, 'querying address book..');
    var res = await beAddressBook(asset);
    Navigator.pop(context);
    res.when((entries) async {
      var recipient = await Navigator.push<String?>(
          context,
          MaterialPageRoute(
              builder: (context) => AddressBookScreen(asset, entries)));
      if (recipient == null) return;
      _recipientController.text = recipient;
    },
        error: (err) => alert(context, 'error',
            'failed to get address book (${BeError.msg(err)})'));
  }

  void _updateSaveRecipient(bool? value) {
    if (value == null) return;
    setState(() => _saveRecipient = value);
  }

  void _withdrawalCreate() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      // ask user to confirm
      var userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => WithdrawalCheckScreen(
                  _testnet,
                  widget.asset,
                  widget.l2Network,
                  _amountController.text,
                  _recipientController.text)));
      if (userOk == null || !userOk) return;
      // ask two factor code
      String? tfCode = null;
      if (widget.userInfo?.tfEnabled == true) {
        var res = await beUserTwoFactorSend();
        if (!res.when<bool>((twoFactor) => true, error: (e) {
          log.severe('failed to send two factor code', e);
          alert(context, 'error', 'failed to create withdrawal');
          return false;
        })) return;
        tfCode = await askString(
            context, 'Enter your two factor code to make your withdrawal', '');
        if (tfCode == null || tfCode.isEmpty) return;
      }
      if (widget.asset.isCrypto) {
        showAlertDialog(context, 'creating withdrawal..');
        var res = await beCryptoWithdrawalCreate(
            widget.asset.symbol,
            widget.l2Network?.symbol,
            widget.l2Network == null
                ? Decimal.parse(_amountController.text)
                : Decimal.zero,
            _recipientController.text,
            _saveRecipient,
            _recipientDescriptionController.text,
            tfCode);
        Navigator.pop(context);
        res.when(
            (withdrawal) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CryptoWithdrawalDetailScreen(
                        withdrawal, widget.websocket))),
            error: (err) => alert(context, 'error',
                'failed to create withdrawal (${BeError.msg(err)})'));
      } else {
        showAlertDialog(context, 'creating withdrawal..');
        var res = await beFiatWithdrawalCreate(
            widget.asset.symbol,
            Decimal.parse(_amountController.text),
            _recipientController.text,
            _saveRecipient,
            _recipientDescriptionController.text,
            tfCode);
        Navigator.pop(context);
        res.when(
            (withdrawal) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FiatWithdrawalDetailScreen(
                        withdrawal, widget.websocket))),
            error: (err) => alert(context, 'error',
                'failed to create withdrawal (${BeError.msg(err)})'));
      }
    }
  }

  void _scanRecipient() async {
    var data = await QrScan.scan(context);
    if (data != null)
      _recipientController.text = assetStripUriPrefix(widget.asset.symbol, widget.l2Network?.symbol, data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Withdrawal'),
          actions: [
            assetLogo(
                widget.l2Network != null
                    ? widget.l2Network!.symbol
                    : widget.asset.symbol,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Visibility(
                      visible:
                          !widget.asset.isCrypto || widget.l2Network == null,
                      child: TextFormField(
                          controller: _amountController,
                          decoration: InputDecoration(labelText: 'Amount'),
                          keyboardType: TextInputType.numberWithOptions(
                              signed: false, decimal: true),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var d = Decimal.tryParse(value.trim());
                            if (d == null) return 'Invalid value';
                            if (d <= Decimal.fromInt(0))
                              return 'Please enter a value greater then 0';
                            return null;
                          })),
                  Visibility(
                      visible:
                          widget.asset.isCrypto && widget.l2Network == null,
                      child: TextFormField(
                          controller: _recipientController,
                          decoration: InputDecoration(
                              labelText: 'Wallet Address',
                              suffix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.alternate_email),
                                        tooltip: 'Address Book',
                                        onPressed: _addressBook),
                                    IconButton(
                                        onPressed: _scanRecipient,
                                        icon: Icon(Icons.qr_code))
                                  ])),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = addressValidate(
                                widget.asset.symbol, _testnet, value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                  Visibility(
                      visible:
                          widget.asset.isCrypto && widget.l2Network != null,
                      child: TextFormField(
                          controller: _recipientController,
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: 'Recipient',
                              suffixIcon: IconButton(
                                  onPressed: _scanRecipient,
                                  icon: Icon(Icons.qr_code))),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = l2RecipientValidate(
                                widget.l2Network!.symbol, _testnet, value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                  Visibility(
                      visible: !widget.asset.isCrypto,
                      child: TextFormField(
                          controller: _recipientController,
                          decoration: InputDecoration(
                              labelText: 'Bank Account',
                              suffix: IconButton(
                                  icon: Icon(Icons.alternate_email),
                                  tooltip: 'Address Book',
                                  onPressed: _addressBook)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = bankValidate(value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                  Visibility(
                      visible:
                          !widget.asset.isCrypto || widget.l2Network == null,
                      child: CheckboxFormField(
                          Text(widget.asset.isCrypto
                              ? 'Save Wallet Address'
                              : 'Save Bank Account'),
                          _saveRecipient,
                          onChanged: _updateSaveRecipient)),
                  Visibility(
                      visible: _saveRecipient,
                      child: TextFormField(
                          controller: _recipientDescriptionController,
                          decoration: InputDecoration(
                              labelText: widget.asset.isCrypto
                                  ? 'Wallet Address Description'
                                  : 'Bank Account Description'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            return null;
                          })),
                  raisedButton(
                      onPressed: _withdrawalCreate,
                      child: Text('Create Withdrawal'))
                ]))));
  }
}

class WithdrawalSelectScreen extends StatefulWidget {
  final List<BeAsset> assets;
  final Websocket websocket;
  final UserInfo? userInfo;

  WithdrawalSelectScreen(this.assets, this.websocket, this.userInfo);

  @override
  State<WithdrawalSelectScreen> createState() => _WithdrawalSelectScreenState();
}

class _WithdrawalSelectScreenState extends State<WithdrawalSelectScreen> {
  Future<void> _assetTap(BeAsset asset, BeAsset? l2Network) async {
    if (assetIsCrypto(asset.symbol))
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CryptoWithdrawalsScreen(
                  asset, l2Network, widget.websocket, widget.userInfo)));
    else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FiatWithdrawalsScreen(
                  asset, widget.websocket, widget.userInfo)));
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
        title: Text('Withdrawals'),
      ),
      body: ListView.builder(itemBuilder: _listItem, itemCount: _listCount()),
    );
  }
}

class CryptoWithdrawalsScreen extends StatefulWidget {
  final BeAsset asset;
  final BeAsset? l2Network;
  final Websocket websocket;
  final UserInfo? userInfo;

  CryptoWithdrawalsScreen(
      this.asset, this.l2Network, this.websocket, this.userInfo);

  @override
  State<CryptoWithdrawalsScreen> createState() =>
      _CryptoWithdrawalsScreenState();
}

class _CryptoWithdrawalsScreenState extends State<CryptoWithdrawalsScreen> {
  List<BeCryptoWithdrawal> _withdrawals = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initWithdrawals(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.cryptoWithdrawalNew) {
      if (_pageCount == 0) {
        _withdrawals.insert(
            0, BeCryptoWithdrawal.fromJson(jsonDecode(args.msg)));
        if (_withdrawals.length > _itemsPerPage) _withdrawals.removeLast();
        setState(() => _withdrawals = _withdrawals);
      }
    }
  }

  Future<void> _initWithdrawals(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beCryptoWithdrawals(widget.asset.symbol,
        widget.l2Network?.symbol, pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    res.when(
        (withdrawals, offset, limit, total) => setState(() {
              _withdrawals = withdrawals;
              _pageNumber = pageNumber;
              _pageCount = (total / _itemsPerPage).ceil();
            }),
        error: (err) => alert(context, 'error',
            'failed to get withdrawals (${BeError.msg(err)})'));
  }

  Future<void> _withdrawalTap(BeCryptoWithdrawal withdrawal) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CryptoWithdrawalDetailScreen(withdrawal, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var withdrawal = _withdrawals[n];
    return ListTile(
      title: Text(
          '${assetFormat(withdrawal.asset, withdrawal.amount)} ${withdrawal.asset} - ${withdrawal.status.toUpperCase()}'),
      onTap: () => _withdrawalTap(withdrawal),
    );
  }

  Future<void> _actionButtonTap() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WithdrawalFormScreen(widget.asset,
                widget.l2Network, widget.websocket, widget.userInfo)));
  }

  @override
  Widget build(BuildContext context) {
    var symbol = widget.l2Network != null
        ? widget.l2Network?.symbol
        : widget.asset.symbol;
    return Scaffold(
        appBar: AppBar(
          title: Text('$symbol Withdrawals'),
          actions: [assetLogo('$symbol', margin: EdgeInsets.all(10))],
        ),
        body: ListView.builder(
            itemBuilder: _listItem, itemCount: _withdrawals.length),
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initWithdrawals(n))
            : null,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: _actionButtonTap));
  }
}

class CryptoWithdrawalDetailScreen extends StatefulWidget {
  final BeCryptoWithdrawal withdrawal;
  final Websocket websocket;

  CryptoWithdrawalDetailScreen(this.withdrawal, this.websocket);

  @override
  State<CryptoWithdrawalDetailScreen> createState() =>
      _CryptoWithdrawalDetailScreenState(withdrawal);
}

class _CryptoWithdrawalDetailScreenState
    extends State<CryptoWithdrawalDetailScreen> {
  BeCryptoWithdrawal _withdrawal;
  var _testnet = Testnet;

  _CryptoWithdrawalDetailScreenState(this._withdrawal);

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
    if (args.event == WebsocketEvent.cryptoWithdrawalUpdate) {
      var newWithdrawal = BeCryptoWithdrawal.fromJson(jsonDecode(args.msg));
      if (_withdrawal.token == newWithdrawal.token) {
        setState(() => _withdrawal = newWithdrawal);
        snackMsg(context, 'withdrawal updated ${newWithdrawal.token}');
      }
    }
  }

  void _addrLaunch() {
    var url = addressBlockExplorer(
        _withdrawal.asset, _testnet, _withdrawal.recipient);
    if (url == null) return;
    urlLaunch(url);
  }

  void _copyRecipient() {
    Clipboard.setData(ClipboardData(text: _withdrawal.recipient));
    snackMsg(context, 'copied recipient');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Withdrawal ${_withdrawal.l2Network != null ? _withdrawal.l2Network : _withdrawal.asset}'),
          actions: [
            assetLogo(
                _withdrawal.l2Network != null
                    ? _withdrawal.l2Network!
                    : _withdrawal.asset,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormat(_withdrawal.asset, _withdrawal.amount)} ${_withdrawal.asset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_withdrawal.date}')),
          ListTile(
              title: Text('Recipient'),
              subtitle: Text(shortenStr(_withdrawal.recipient)),
              onTap: _addrLaunch,
              trailing: IconButton(
                  onPressed: _copyRecipient, icon: Icon(Icons.copy))),
          Visibility(
              visible: _withdrawal.txid != null,
              child: ListTile(
                  title: Text('Transaction Id'),
                  subtitle: Text('${_withdrawal.txid}'))),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_withdrawal.status.toUpperCase()}')),
        ]));
  }
}

class FiatWithdrawalsScreen extends StatefulWidget {
  final BeAsset asset;
  final Websocket websocket;
  final UserInfo? userInfo;

  FiatWithdrawalsScreen(this.asset, this.websocket, this.userInfo);

  @override
  State<FiatWithdrawalsScreen> createState() => _FiatWithdrawalsScreenState();
}

class _FiatWithdrawalsScreenState extends State<FiatWithdrawalsScreen> {
  List<BeFiatWithdrawal> _withdrawals = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initWithdrawals(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.fiatWithdrawalNew) {
      if (_pageCount == 0) {
        _withdrawals.insert(0, BeFiatWithdrawal.fromJson(jsonDecode(args.msg)));
        if (_withdrawals.length > _itemsPerPage) _withdrawals.removeLast();
        setState(() => _withdrawals = _withdrawals);
      }
    }
  }

  Future<void> _initWithdrawals(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beFiatWithdrawals(
        widget.asset.symbol, pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    res.when(
        (withdrawals, offset, limit, total) => setState(() {
              _withdrawals = withdrawals;
              _pageNumber = pageNumber;
              _pageCount = (total / _itemsPerPage).ceil();
            }),
        error: (err) => alert(context, 'error',
            'failed to get withdrawals (${BeError.msg(err)})'));
  }

  Future<void> _withdrawalTap(BeFiatWithdrawal withdrawal) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FiatWithdrawalDetailScreen(withdrawal, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var withdrawal = _withdrawals[n];
    return ListTile(
      title: Text(
          '${assetFormat(withdrawal.asset, withdrawal.amount)} ${withdrawal.asset} - ${withdrawal.status.toUpperCase()}'),
      onTap: () => _withdrawalTap(withdrawal),
    );
  }

  Future<void> _actionButtonTap() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WithdrawalFormScreen(
                widget.asset, null, widget.websocket, widget.userInfo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.asset.symbol} Withdrawals'),
          actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
        ),
        body: ListView.builder(
            itemBuilder: _listItem, itemCount: _withdrawals.length),
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initWithdrawals(n))
            : null,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: _actionButtonTap));
  }
}

class FiatWithdrawalDetailScreen extends StatefulWidget {
  final BeFiatWithdrawal withdrawal;
  final Websocket websocket;

  FiatWithdrawalDetailScreen(this.withdrawal, this.websocket);

  @override
  State<FiatWithdrawalDetailScreen> createState() =>
      _FiatWithdrawalDetailScreenState(withdrawal);
}

class _FiatWithdrawalDetailScreenState
    extends State<FiatWithdrawalDetailScreen> {
  BeFiatWithdrawal _withdrawal;

  _FiatWithdrawalDetailScreenState(this._withdrawal);

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
    if (args.event == WebsocketEvent.fiatWithdrawalUpdate) {
      var newWithdrawal = BeFiatWithdrawal.fromJson(jsonDecode(args.msg));
      if (_withdrawal.token == newWithdrawal.token) {
        setState(() => _withdrawal = newWithdrawal);
        snackMsg(context,
            'withdrawal updated ${newWithdrawal.token} - ${newWithdrawal.status.toUpperCase()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Withdrawal ${_withdrawal.asset}'),
          actions: [assetLogo(_withdrawal.asset, margin: EdgeInsets.all(10))],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormat(_withdrawal.asset, _withdrawal.amount)} ${_withdrawal.asset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_withdrawal.date}')),
          ListTile(
              title: Text('Bank Account'),
              subtitle: Text(_withdrawal.recipient)),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_withdrawal.status.toUpperCase()}')),
        ]));
  }
}
