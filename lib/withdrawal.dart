import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:logging/logging.dart';
import 'package:flutter/services.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/form_ui.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';
import 'paginator.dart';
import 'markets.dart';
import 'cryptocurrency.dart';
import 'snack.dart';
import 'widgets.dart';
import 'config.dart';
import 'qrscan.dart';

final log = Logger('Withdrawal');

class WithdrawalCheckScreen extends StatefulWidget {
  final bool testnet;
  final BeAsset asset;
  final BeAsset? l2Network;
  final Decimal? amount;
  final String recipient;

  WithdrawalCheckScreen(
      this.testnet, this.asset, this.l2Network, this.amount, this.recipient);

  @override
  State<WithdrawalCheckScreen> createState() => _WithdrawalCheckScreenState();
}

class _WithdrawalCheckScreenState extends State<WithdrawalCheckScreen> {
  var _extractedAmount = -Decimal.one;

  @override
  void initState() {
    if (widget.amount == null && widget.l2Network != null) {
      var res = l2RecipientValidate(
          widget.l2Network!.symbol, widget.testnet, widget.recipient);
      if (res.result && res.amount != null) _extractedAmount = res.amount!;
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
        body: ColumnView(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  ListView(shrinkWrap: true, children: [
                    ListTile(
                        title: Text('Amount'),
                        subtitle: Text(
                            '${assetFormatWithUnitToUser(widget.asset.symbol, widget.amount != null ? widget.amount! : _extractedAmount)}')),
                    ListTile(
                        title: Text('Recipient'),
                        subtitle: Text(shortenStr(widget.recipient)))
                  ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BronzeRoundedButton(_ok, ZapOnPrimary, ZapPrimary,
                            ZapPrimaryGradient, 'Continue',
                            width: ButtonWidth, height: ButtonHeight),
                        BronzeRoundedButton(
                            _cancel, ZapOnSurface, ZapSurface, null, 'Cancel',
                            width: ButtonWidth, height: ButtonHeight),
                      ])
                ]))));
  }
}

class WithdrawalFormScreen extends StatefulWidget {
  final BeAsset asset;
  final BeAsset? l2Network;
  final Websocket websocket;
  final UserInfo? userInfo;
  final Decimal availableBalance;

  WithdrawalFormScreen(this.asset, this.l2Network, this.websocket,
      this.userInfo, this.availableBalance);

  @override
  State<WithdrawalFormScreen> createState() => _WithdrawalFormScreenState();
}

class _WithdrawalFormScreenState extends State<WithdrawalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();
  final _recipientDescriptionController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountAddr01Controller = TextEditingController();
  final _accountAddr02Controller = TextEditingController();
  final _accountAddrCountryController = TextEditingController();

  var _saveRecipient = false;
  var _testnet = testnet();

  var _availableBalance = 'xxx';
  var _max = Decimal.zero;

  @override
  void initState() {
    super.initState();
    var bal =
        assetFormatWithUnitToUser(widget.asset.symbol, widget.availableBalance);
    var withdrawAsset = widget.l2Network ?? widget.asset;
    if (withdrawAsset.withdrawFeeFixed) {
      var fee = assetFormatWithUnitToUser(
          widget.asset.symbol, withdrawAsset.withdrawFee);
      _availableBalance = 'Available: $bal. Withdrawal fee: $fee';
      if (widget.availableBalance > withdrawAsset.withdrawFee)
        _max = widget.availableBalance - withdrawAsset.withdrawFee;
    } else {
      var feePercent = withdrawAsset.withdrawFee * Decimal.fromInt(100);
      _availableBalance = 'Available: $bal. Withdrawal fee: $feePercent%';
      if (widget.availableBalance > Decimal.zero)
        _max = widget.availableBalance -
            widget.availableBalance * withdrawAsset.withdrawFee;
    }
  }

  Future<void> _addressBook() async {
    var asset = widget.asset.symbol;
    showAlertDialog(context, 'querying address book..');
    var res = await beAddressBook(asset);
    Navigator.pop(context);
    res.when((entries) async {
      var entry = await Navigator.push<BeAddressBookEntry?>(
          context,
          MaterialPageRoute(
              builder: (context) => AddressBookScreen(asset, entries)));
      if (entry == null) return;
      _recipientController.text = entry.recipient;
      _recipientDescriptionController.text = entry.description ?? '';
      _accountNameController.text = entry.accountName ?? '';
      _accountAddr01Controller.text = entry.accountAddr01 ?? '';
      _accountAddr02Controller.text = entry.accountAddr02 ?? '';
      _accountAddrCountryController.text = entry.accountAddrCountry ?? '';
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
      var amount = Decimal.tryParse(_amountController.text);
      if (amount != null)
        amount = assetAmountFromUser(widget.asset.symbol, amount);
      var userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => WithdrawalCheckScreen(
                  _testnet,
                  widget.asset,
                  widget.l2Network,
                  amount,
                  _recipientController.text.trim())));
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
                ? assetAmountFromUser(
                    widget.asset.symbol, Decimal.parse(_amountController.text))
                : Decimal.zero,
            _recipientController.text.trim(),
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
            _recipientDescriptionController.text,
            _accountNameController.text,
            _accountAddr01Controller.text,
            _accountAddr02Controller.text,
            _accountAddrCountryController.text,
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
      _recipientController.text = assetStripUriPrefix(
          widget.asset.symbol, widget.l2Network?.symbol, data);
  }

  void _setMax() {
    _amountController.text =
        assetAmountToUser(widget.asset.symbol, _max).toString();
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
        body: ColumnView(
            scrollChild: true,
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Visibility(
                        visible: widget.asset.isCrypto,
                        child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Center(
                                child: Icon(
                                    Icons.keyboard_double_arrow_up_rounded,
                                    size: 150,
                                    color: ZapOnSecondary))),
                      ),
                      SpacedVisibility(
                          widget.asset.withdrawInstr != null,
                          AlertDrawer(
                              () {}, ['${widget.asset.withdrawInstr}'])),
                      Container(
                          margin: EdgeInsets.all(5),
                          child: Text(_availableBalance)),
                      SpacedVisibility(
                          !widget.asset.isCrypto || widget.l2Network == null,
                          BronzeFormInput(_amountController,
                              icon: widget.asset.isCrypto
                                  ? Icon(Icons.currency_bitcoin)
                                  : Icon(Icons.attach_money),
                              labelText:
                                  'Amount (${assetUnit(widget.asset.symbol)})',
                              suffixIcon: TextButton(
                                  child: Text('max',
                                      style: TextStyle(color: ZapOnPrimary)),
                                  onPressed: _setMax),
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: true), validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var userAmount = Decimal.tryParse(value.trim());
                            if (userAmount == null) return 'Invalid value';
                            if (userAmount <= Decimal.zero)
                              'Please return a value greater then 0';
                            var withdrawAsset =
                                widget.l2Network ?? widget.asset;
                            var sysAmount = assetAmountFromUser(
                                widget.asset.symbol, userAmount);
                            if (sysAmount < withdrawAsset.minWithdraw)
                              return 'Please enter a value greater then or equal to ${assetAmountToUser(widget.asset.symbol, withdrawAsset.minWithdraw)}';
                            if (sysAmount > _max)
                              return 'Please enter a value less then or equal to ${assetAmountToUser(widget.asset.symbol, _max)}';
                            return null;
                          })),
                      SpacedVisibility(
                          widget.asset.isCrypto && widget.l2Network == null,
                          BronzeFormInput(_recipientController,
                              labelText: 'Wallet Address',
                              icon: Icon(Icons.person_outlined),
                              suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.alternate_email),
                                        tooltip: 'Address Book',
                                        onPressed: _addressBook),
                                    IconButton(
                                        onPressed: _scanRecipient,
                                        icon: Icon(Icons.qr_code))
                                  ]),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = addressValidate(
                                widget.asset.symbol, _testnet, value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                      SpacedVisibility(
                        widget.asset.isCrypto && widget.l2Network != null,
                        BronzeFormInput(_recipientController,
                            icon: Icon(Icons.person_outlined),
                            labelText: 'Recipient',
                            suffixIcon: IconButton(
                                onPressed: _scanRecipient,
                                icon: Icon(Icons.qr_code)),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter a value';
                          value = value.trim();
                          var res = l2RecipientValidate(
                              widget.l2Network!.symbol, _testnet, value);
                          if (!res.result) return res.reason;
                          return null;
                        }),
                      ),
                      SpacedVisibility(
                          !widget.asset.isCrypto,
                          BronzeFormInput(_recipientController,
                              icon: Icon(Icons.person_outlined),
                              labelText: 'Bank Account',
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.alternate_email),
                                  tooltip: 'Address Book',
                                  onPressed: _addressBook),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = bankValidate(value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                      SpacedVisibility(
                          !widget.asset.isCrypto || widget.l2Network == null,
                          SizedBox(
                              width: ButtonWidth,
                              child: CheckboxFormField(
                                  Text(widget.asset.isCrypto
                                      ? 'Save Wallet Address'
                                      : 'Save Bank Account'),
                                  _saveRecipient || !widget.asset.isCrypto,
                                  onChanged: widget.asset.isCrypto
                                      ? _updateSaveRecipient
                                      : null))),
                      SpacedVisibility(
                          _saveRecipient || !widget.asset.isCrypto,
                          BronzeFormInput(_recipientDescriptionController,
                              icon: Icon(Icons.note_alt),
                              labelText: widget.asset.isCrypto
                                  ? 'Wallet Address Description'
                                  : 'Bank Account Description',
                              keyboardType: TextInputType.text,
                              validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            return null;
                          })),
                      SpacedVisibility(
                          !widget.asset.isCrypto,
                          Card(
                              margin: EdgeInsets.only(top: 10),
                              child: Container(
                                  width: ButtonWidth,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.zero,
                                  child: Column(children: [
                                    Text('Bank Account Details',
                                        style: TextStyle(fontSize: 16)),
                                    TextFormField(
                                        controller: _accountNameController,
                                        decoration: InputDecoration(
                                            labelText: 'Account Name'),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Please enter a value';
                                          return null;
                                        }),
                                    TextFormField(
                                        controller: _accountAddr01Controller,
                                        decoration: InputDecoration(
                                            labelText: 'Address Line 1'),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Please enter a value';
                                          return null;
                                        }),
                                    TextFormField(
                                      controller: _accountAddr02Controller,
                                      decoration: InputDecoration(
                                          labelText: 'Address Line 2'),
                                      keyboardType: TextInputType.text,
                                    ),
                                    TextFormField(
                                        controller:
                                            _accountAddrCountryController,
                                        decoration: InputDecoration(
                                            labelText: 'Country'),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Please enter a value';
                                          return null;
                                        }),
                                  ])))),
                      VerticalSpacer(),
                      BronzeRoundedButton(_withdrawalCreate, ZapOnPrimary,
                          ZapPrimary, ZapPrimaryGradient, 'Create Withdrawal',
                          width: ButtonWidth,
                          height: ButtonHeight,
                          fwdArrow: true),
                      BronzeRoundedButton(() => Navigator.of(context).pop(),
                          ZapOnSurface, ZapSurface, null, 'Cancel',
                          width: ButtonWidth, height: ButtonHeight),
                    ])))));
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
      body: ColumnView(
          child: ListView.builder(
              itemBuilder: _listItem, itemCount: _listCount())),
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      var withdrawal = BeCryptoWithdrawal.fromJson(jsonDecode(args.msg));
      if (withdrawal.asset != widget.asset.symbol ||
          withdrawal.l2Network != widget.l2Network?.symbol) return;
      if (_pageNumber == 0) {
        _withdrawals.insert(
            0, BeCryptoWithdrawal.fromJson(jsonDecode(args.msg)));
        if (_withdrawals.length > _itemsPerPage) _withdrawals.removeLast();
        setState(() => _withdrawals = _withdrawals);
      }
    }
    if (args.event == WebsocketEvent.cryptoWithdrawalUpdate) {
      var newWithdrawal = BeCryptoWithdrawal.fromJson(jsonDecode(args.msg));
      for (var i = 0; i < _withdrawals.length; i++) {
        var withdrawal = _withdrawals[i];
        if (withdrawal.token == newWithdrawal.token) {
          _withdrawals[i] = newWithdrawal;
          setState(() => _withdrawals = _withdrawals);
          snackMsg(context, 'withdrawal updated ${newWithdrawal.token}');
        }
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
      title: new Center(
          child: Text(
              '${assetFormatWithUnitToUser(withdrawal.asset, withdrawal.amount)} - ${withdrawal.status.toUpperCase()}')),
      onTap: () => _withdrawalTap(withdrawal),
    );
  }

  Future<void> _make() async {
    showAlertDialog(context, 'querying..');
    var res = await beBalance(widget.asset.symbol);
    Navigator.pop(context);
    res.when((balance) {
      if (balance != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WithdrawalFormScreen(
                    widget.asset,
                    widget.l2Network,
                    widget.websocket,
                    widget.userInfo,
                    balance.available)));
      }
    },
        error: (err) => snackMsg(context, 'failed to query balances',
            category: MessageCategory.Warning));
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
      body: ColumnView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        VerticalSpacer(),
        BronzeRoundedButton(_make, ZapOnPrimary, ZapPrimary, ZapPrimaryGradient,
            'Make Withdrawal',
            width: ButtonWidth, height: ButtonHeight, fwdArrow: true),
        _withdrawals.length == 0
            ? Container(
                margin: EdgeInsets.all(20),
                child: Center(child: Text('No withdrawals')))
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: _listItem,
                itemCount: _withdrawals.length)
      ])),
      bottomNavigationBar: _pageCount > 0
          ? Paginator(_pageCount, _pageNumber, (n) => _initWithdrawals(n))
          : null,
    );
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
  var _testnet = testnet();

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
        body: ColumnView(
            child: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormatWithUnitToUser(_withdrawal.asset, _withdrawal.amount)}')),
          ListTile(title: Text('Date'), subtitle: Text('${_withdrawal.date}')),
          ListTile(
              title: Text(
                  "${_withdrawal.l2Network == null ? 'Recipient' : 'Invoice'}"),
              subtitle: Text(shortenStr(_withdrawal.recipient)),
              onTap:
                  _withdrawal.l2Network == null ? _addrLaunch : _copyRecipient,
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
          VerticalSpacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            BronzeRoundedButton(() => Navigator.of(context).pop(), Colors.white,
                Colors.white30, null, 'Close',
                width: ButtonWidth, height: ButtonHeight)
          ])
        ])));
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      var withdrawal = BeFiatWithdrawal.fromJson(jsonDecode(args.msg));
      if (withdrawal.asset != widget.asset.symbol) return;
      if (_pageNumber == 0) {
        _withdrawals.insert(0, withdrawal);
        if (_withdrawals.length > _itemsPerPage) _withdrawals.removeLast();
        setState(() => _withdrawals = _withdrawals);
      }
    }
    if (args.event == WebsocketEvent.fiatWithdrawalUpdate) {
      var newWithdrawal = BeFiatWithdrawal.fromJson(jsonDecode(args.msg));
      for (var i = 0; i < _withdrawals.length; i++) {
        var withdrawal = _withdrawals[i];
        if (withdrawal.token == newWithdrawal.token) {
          _withdrawals[i] = newWithdrawal;
          setState(() => _withdrawals = _withdrawals);
          snackMsg(context, 'withdrawal updated ${newWithdrawal.token}');
        }
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
          '${assetFormatWithUnitToUser(withdrawal.asset, withdrawal.amount)} - ${withdrawal.status.toUpperCase()}'),
      onTap: () => _withdrawalTap(withdrawal),
    );
  }

  Future<void> _make() async {
    showAlertDialog(context, 'querying..');
    var res = await beBalance(widget.asset.symbol);
    Navigator.pop(context);
    res.when((balance) {
      if (balance != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WithdrawalFormScreen(widget.asset, null,
                    widget.websocket, widget.userInfo, balance.available)));
      }
    },
        error: (err) => snackMsg(context, 'failed to query balances',
            category: MessageCategory.Warning));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.asset.symbol} Withdrawals'),
        actions: [assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))],
      ),
      body: ColumnView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        VerticalSpacer(),
        BronzeRoundedButton(_make, ZapOnPrimary, ZapPrimary, ZapPrimaryGradient,
            'Make Withdrawal',
            width: ButtonWidth, height: ButtonHeight, fwdArrow: true),
        _withdrawals.length == 0
            ? Container(
                margin: EdgeInsets.all(20),
                child: Center(child: Text('No withdrawals')))
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: _listItem,
                itemCount: _withdrawals.length)
      ])),
      bottomNavigationBar: _pageCount > 0
          ? Paginator(_pageCount, _pageNumber, (n) => _initWithdrawals(n))
          : null,
    );
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
        body: ColumnView(
            child: ListView(children: [
          ListTile(
              title: Text('Amount'),
              subtitle: Text(
                  '${assetFormatWithUnitToUser(_withdrawal.asset, _withdrawal.amount)}')),
          ListTile(title: Text('Date'), subtitle: Text('${_withdrawal.date}')),
          ListTile(
              title: Text('Bank Account'),
              subtitle: Text(_withdrawal.recipient)),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${_withdrawal.status.toUpperCase()}')),
          VerticalSpacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            BronzeRoundedButton(() => Navigator.of(context).pop(), Colors.white,
                Colors.white30, null, 'Close',
                width: ButtonWidth, height: ButtonHeight)
          ])
        ])));
  }
}
