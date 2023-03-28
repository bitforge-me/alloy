import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:logging/logging.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';
import 'snack.dart';
import 'widgets.dart';
import 'config.dart';
import 'units.dart';
import 'remit_status.dart';
import 'quote.dart';
import 'cryptocurrency.dart';

final log = Logger('Remit');

class RemitSelectPage extends StatefulWidget {
  final Websocket websocket;
  final UserInfo? userInfo;

  RemitSelectPage(this.websocket, this.userInfo);

  @override
  State<RemitSelectPage> createState() => _RemitSelectPageState();
}

class _RemitSelectPageState extends State<RemitSelectPage> {
  Future<void> _remitTap() async {
    showAlertDialog(context, 'querying balances..');
    var resBal = await beBalances();
    Navigator.pop(context);
    var balances = resBal.when((balances) => balances, error: (err) {
      snackMsg(context, 'failed to query balances',
          category: MessageCategory.Warning);
      return null;
    });
    if (balances == null) return;
    showAlertDialog(context, 'querying markets..');
    var resMkt = await beMarkets();
    Navigator.pop(context);
    var markets = resMkt.when((markets) => markets, error: (err) {
      snackMsg(context, 'failed to query markets',
          category: MessageCategory.Warning);
      return null;
    });
    if (markets == null) return;
    showAlertDialog(context, 'querying assets..');
    var resAss = await beAssets();
    Navigator.pop(context);
    var assets = resAss.when((assets) => assets, error: (err) {
      snackMsg(context, 'failed to query assets',
          category: MessageCategory.Warning);
      return null;
    });
    if (assets == null) return;
    var btc = assets.firstWhereOrNull((e) => e.symbol == Btc);
    var btcLn = btc?.l2Network;
    if (btc == null || btcLn == null) {
      log.severe('unable to find btc and btcLn assets!');
      snackMsg(context, 'failed to query assets',
          category: MessageCategory.Warning);
      return;
    }
    showAlertDialog(context, 'querying payment methods..');
    var resPm = await beRemitPaymentMethods();
    Navigator.pop(context);
    resPm.when((paymentMethods) async {
      var success = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
              builder: (context) => RemitFormScreen(
                  widget.websocket,
                  widget.userInfo,
                  balances,
                  markets,
                  assets,
                  btcLn,
                  paymentMethods)));
      // hide this selection screen if remit succesfully created
      if (success != null && success) Navigator.pop(context);
    },
        error: (err) => snackMsg(
            context, 'failed to query remit payment methods',
            category: MessageCategory.Warning));
  }

  Widget _remitLogo({EdgeInsetsGeometry? margin, double size = 32}) {
    return Container(
        margin: margin,
        width: size,
        height: size,
        child: Center(child: Image.asset('assets/pouch-logo.png')));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
          padding: EdgeInsets.all(50),
          child: Text(
              'Send funds directly to your family and friends bank accounts abroad using our remittance partners')),
      ListTile(
        title: Text('Pouch.ph - Phillipines'),
        leading: _remitLogo(),
        onTap: _remitTap,
      )
    ]);
  }
}

class RemitFormScreen extends StatefulWidget {
  final Websocket websocket;
  final UserInfo? userInfo;
  final List<BeBalance> balances;
  final List<BeMarket> markets;
  final List<BeAsset> assets;
  final BeAsset l2Network;
  final BePaymentMethods paymentMethods;

  RemitFormScreen(this.websocket, this.userInfo, this.balances, this.markets,
      this.assets, this.l2Network, this.paymentMethods);

  @override
  State<RemitFormScreen> createState() => _RemitFormScreenState();
}

class _RemitFormScreenState extends State<RemitFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  BePaymentMethod? _paymentMethod;
  var _paymentMethodCategory = BePaymentMethodCategory.bank;

  var _testnet = testnet();

  late BeAsset _asset;
  late List<BeAsset> _validAssets;
  late List<BeMarket> _validMarkets;
  var _availableBalance = 'xxx';
  var _max = Decimal.zero;

  var _showPrice = false;
  var _amount = Decimal.zero;

  static const remitSymbol = Btc;

  @override
  void initState() {
    super.initState();
    // init valid markets and default asset
    _validMarkets =
        widget.markets.where((e) => e.baseAsset == remitSymbol).toList();
    _validAssets = widget.assets
        .where((e) =>
            e.symbol == remitSymbol ||
            _validMarkets.any((mkt) => e.symbol == mkt.quoteAsset))
        .toList();
    _asset = _validAssets.first;
    // initialize payment method
    _paymentMethodCategory = widget.paymentMethods.keys.first;
    _paymentMethod = widget.paymentMethods[_paymentMethodCategory]!.first;
    // initialize max remit
    _initMaxRemit();
  }

  Decimal _maxWithdrawal(Decimal value, Decimal feePercent) {
    return value - value * feePercent;
  }

  void _initMaxRemit() {
    // setup variables
    var remitAsset = widget.l2Network;
    assert(remitAsset.isCrypto &&
        remitAsset.symbol == BtcLn &&
        !remitAsset.withdrawFeeFixed);
    BeBalance balance =
        widget.balances.firstWhere((e) => e.asset == _asset.symbol);
    // calc max and available balance
    _max = Decimal.zero;
    if (_asset.symbol == remitSymbol) {
      var feePercent = remitAsset.withdrawFee * Decimal.fromInt(100);
      var maxWithdraw =
          balance.available / (Decimal.one + remitAsset.withdrawFee);
      var maxRemitRounded = roundAt(maxWithdraw, _asset.decimals);
      var maxWithdrawStr =
          assetFormatWithUnitToUser(_asset.symbol, maxRemitRounded);
      _availableBalance =
          'Available to remit: $maxWithdrawStr\nNetwork fee: $feePercent%';
      if (balance.available > Decimal.zero)
        _max = _maxWithdrawal(balance.available, remitAsset.withdrawFee);
    } else {
      _availableBalance =
          'Available to remit: ${assetFormatWithUnitToUser(_asset.symbol, balance.available)}\nSent via the Lightning network';
      _max = balance.available;
    }
    _showPrice = PriceManager.showPriceFor(_asset.symbol);
  }

  void _assetChanged(BeAsset? asset) {
    if (asset == null) return;
    setState(() {
      _asset = asset;
      _initMaxRemit();
      _amountController.text = '';
      _amount = Decimal.zero;
    });
  }

  void _inputChanged(String? input) {
    if (input == null) return;
    var amount = Decimal.zero;
    var inputAmount = Decimal.tryParse(input);
    if (inputAmount != null)
      amount = assetAmountFromUser(_asset.symbol, inputAmount);
    if (amount != _amount)
      setState(() {
        _amount = amount;
      });
  }

  void _remitCreate() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      assert(_paymentMethod != null);
      var amount = Decimal.tryParse(_amountController.text.trim());
      if (amount == null) {
        var msg = 'failed to parse amount (${_amountController.text})';
        log.severe(msg);
        alert(context, 'error', msg);
        return;
      }
      var inputAmount = assetAmountFromUser(_asset.symbol, amount);
      var remitAmount = inputAmount;
      // quote the order if necesary
      BeBrokerOrder? orderQuote;
      String? convertedRemitAmount;
      if (_asset.symbol != remitSymbol) {
        var market =
            _validMarkets.firstWhere((e) => e.quoteAsset == _asset.symbol);
        // get market orderbook and quote
        showAlertDialog(context, 'querying orderbook..');
        var res = await beOrderbook(market.symbol);
        Navigator.pop(context);
        var quote = await res.when<QuoteTotalPrice?>((orderbook) {
          return bruteForceQuote(
              remitAmount, market, BeMarketSide.bid, orderbook);
        }, error: (err) {
          snackMsg(context, 'failed to get orderbook',
              category: MessageCategory.Warning);
          return null;
        });
        if (quote == null) return;
        if (quote.errMsg != null) {
          snackMsg(context, quote.errMsg!, category: MessageCategory.Warning);
          return;
        }
        showAlertDialog(context, 'validating order..');
        var resOrderValidate = await beOrderValidate(
            market.symbol, BeMarketSide.bid, quote.amountBaseAsset);
        Navigator.pop(context);
        orderQuote = resOrderValidate.when((order) => order, error: (err) {
          snackMsg(context, 'failed to validate order - ${BeError.msg(err)}',
              category: MessageCategory.Warning);
          return null;
        });
        if (orderQuote == null) return;
        // check amount matches our selected input
        if (orderQuote.quoteAmount != remitAmount) {
          snackMsg(context, 'failed to validate order',
              category: MessageCategory.Warning);
          return;
        }
        // use order amount minus withdrawal fee
        remitAmount =
            _maxWithdrawal(orderQuote.baseAmount, widget.l2Network.withdrawFee);
        convertedRemitAmount =
            assetFormatWithUnitToUser(orderQuote.baseAsset, remitAmount);
      }
      // ask user to confirm
      var recipient = BeRemitRecipientAmount(_nameController.text,
          _accountNumberController.text, _mobileNumberController.text, 0, '');
      var userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => RemitCheckScreen(
                  _testnet,
                  RemitCheckType.CHECK,
                  _paymentMethodCategory,
                  _paymentMethod!,
                  recipient,
                  _asset.symbol,
                  inputAmount,
                  _descriptionController.text,
                  null,
                  convertedRemitAmount)));
      if (userOk == null || !userOk) return;
      // create invoice
      var remitAmountInt = assetAmountToUnit(Btc, Sats, remitAmount).toInt();
      var currency = 'SAT';
      showAlertDialog(context, 'creating invoice..');
      var res = await beRemitInvoiceCreate(
          _paymentMethodCategory,
          _paymentMethod!,
          _nameController.text,
          _accountNumberController.text,
          _mobileNumberController.text,
          currency,
          remitAmountInt,
          _descriptionController.text);
      Navigator.pop(context);
      var invoice =
          res.when((remit, invoice, withdrawal) => invoice, error: (err) {
        alert(
            context, 'error', 'failed to create invoice (${BeError.msg(err)})');
        return null;
      });
      if (invoice == null) return;
      // check invoice amount
      var resRecipient = l2RecipientValidate(BtcLn, _testnet, invoice.bolt11);
      if (!resRecipient.result ||
          resRecipient.amount == null ||
          resRecipient.amount != remitAmount) {
        alert(context, 'error', 'failed to validate invoice');
        return;
      }
      // ask user to confirm again (after seeing fees and final amount)
      userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => RemitCheckScreen(
                  _testnet,
                  RemitCheckType.PAY,
                  _paymentMethodCategory,
                  _paymentMethod!,
                  recipient,
                  _asset.symbol,
                  inputAmount,
                  _descriptionController.text,
                  invoice,
                  convertedRemitAmount)));
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
            context, 'Enter your two factor code to make payment', '');
        if (tfCode == null || tfCode.isEmpty) return;
      }
      // action invoice
      showAlertDialog(context, 'paying invoice..');
      var res2 = await beRemitInvoiceAccept(invoice.referenceId,
          orderQuote?.market, orderQuote?.side, orderQuote?.baseAmount, tfCode);
      Navigator.pop(context);
      res2.when((remit, invoice, withdrawal) async {
        // show user final status
        userOk = await Navigator.push(
            context,
            MaterialPageRoute<bool>(
                builder: (context) => RemitCheckScreen(
                    _testnet,
                    RemitCheckType.FINISH,
                    _paymentMethodCategory,
                    _paymentMethod!,
                    recipient,
                    _asset.symbol,
                    inputAmount,
                    _descriptionController.text,
                    invoice,
                    convertedRemitAmount,
                    alertText:
                        'check email to approve remit confirmation before invoice expiry')));
      },
          error: (err) => alert(
              context, 'error', 'failed to pay invoice (${BeError.msg(err)})'));
    }
  }

  void _setMax() {
    _amountController.text = assetAmountToUser(_asset.symbol, _max).toString();
    _inputChanged(_amountController.text);
  }

  List<DropdownMenuItem<BePaymentMethod>> _paymentMethodItems() {
    var pmis = <DropdownMenuItem<BePaymentMethod>>[];
    for (var category in widget.paymentMethods.keys) {
      var pms = widget.paymentMethods[category];
      if (pms != null)
        for (var pm in pms) {
          pmis.add(DropdownMenuItem<BePaymentMethod>(
              child: SizedBox(
                  width: ButtonWidth - 44,
                  child:
                      Text(pm.name, maxLines: 2, overflow: TextOverflow.fade)),
              value: pm));
        }
    }
    return pmis;
  }

  BePaymentMethodCategory _findCategory(BePaymentMethod? item) {
    for (var category in widget.paymentMethods.keys) {
      var pms = widget.paymentMethods[category];
      if (pms != null)
        for (var pm in pms) {
          if (pm.code == item?.code) return category;
        }
    }
    return BePaymentMethodCategory.bank;
  }

  void _paymentMethodChanged(BePaymentMethod? value) {
    setState(() {
      _paymentMethodCategory = _findCategory(value);
      _paymentMethod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Remit'),
          actions: [
            assetLogo(widget.l2Network.symbol, margin: EdgeInsets.all(10))
          ],
        ),
        body: BitforgePage(
            scrollChild: true,
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Center(
                              child: Icon(
                                  Icons.keyboard_double_arrow_up_rounded,
                                  size: 150,
                                  color: ZapOnSecondary))),
                      SizedBox(
                          width: ButtonWidth,
                          child: RoundedEdgeBox(
                              borderColor: ZapSurface,
                              gradient: assetGradient(_asset.symbol),
                              child: DropdownButton<BeAsset>(
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.transparent,
                                  ),
                                  items: _validAssets
                                      .map((e) => DropdownMenuItem<BeAsset>(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('  ' + e.symbol),
                                                assetLogo(e.symbol, size: 24)
                                              ]),
                                          value: e))
                                      .toList(),
                                  value: _asset,
                                  onChanged: _assetChanged))),
                      Container(
                          margin: EdgeInsets.all(5),
                          child: Text(_availableBalance)),
                      BronzeFormInput(_amountController,
                          icon: _asset.isCrypto
                              ? Icon(Icons.currency_bitcoin)
                              : Icon(Icons.attach_money),
                          labelText: 'Amount',
                          suffixText: assetUnit(_asset.symbol),
                          suffixIcon: TextButton(
                              child: Text('max',
                                  style: TextStyle(color: ZapOnPrimary)),
                              onPressed: _setMax),
                          keyboardType: TextInputType.numberWithOptions(
                              signed: false, decimal: true),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var userAmount = Decimal.tryParse(value.trim());
                            if (userAmount == null) return 'Invalid value';
                            if (userAmount <= Decimal.zero)
                              return 'Please return a value greater then 0';
                            var sysAmount =
                                assetAmountFromUser(_asset.symbol, userAmount);
                            var remitAsset = widget.l2Network;
                            if (_asset.l2Network?.symbol == remitAsset.symbol) {
                              if (sysAmount < remitAsset.minWithdraw)
                                return 'Please enter a value greater then or equal to ${assetAmountToUser(_asset.symbol, remitAsset.minWithdraw)}';
                            } else {}
                            if (sysAmount > _max)
                              return 'Please enter a value less then or equal to ${assetAmountToUser(_asset.symbol, _max)}';
                            return null;
                          },
                          onChanged: _inputChanged,
                          onFieldSubmitted: (_) => _remitCreate()),
                      SpacedVisibility(
                          assetPricesEnabled &&
                              _amount > Decimal.zero &&
                              _showPrice,
                          PriceEquivalent(_asset.symbol, _amount,
                              showAssetAmount: false)),
                      SpacedVisibility(
                        true,
                        BronzeFormInput(_nameController,
                            icon: Icon(Icons.person_outlined),
                            labelText: 'Recipient Name',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter a value';
                              return null;
                            },
                            onFieldSubmitted: (_) => _remitCreate()),
                      ),
                      SpacedVisibility(
                          true,
                          Card(
                              margin: EdgeInsets.only(top: 10),
                              child: Container(
                                  width: ButtonWidth,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.zero,
                                  child: Column(children: [
                                    Text('Recipient Account Details',
                                        style: TextStyle(fontSize: 16)),
                                    DropdownButton<BePaymentMethod>(
                                        items: _paymentMethodItems(),
                                        onChanged: _paymentMethodChanged,
                                        value: _paymentMethod),
                                    Visibility(
                                        visible: _paymentMethodCategory ==
                                            BePaymentMethodCategory.bank,
                                        child: TextFormField(
                                            controller:
                                                _accountNumberController,
                                            decoration: InputDecoration(
                                                labelText:
                                                    'Bank Account Number'),
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty)
                                                return 'Please enter a value';
                                              return null;
                                            },
                                            onFieldSubmitted: (_) =>
                                                _remitCreate())),
                                    Visibility(
                                        visible: _paymentMethodCategory ==
                                            BePaymentMethodCategory.mobileMoney,
                                        child: TextFormField(
                                            controller: _mobileNumberController,
                                            decoration: InputDecoration(
                                                labelText: 'Mobile Number'),
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty)
                                                return 'Please enter a value';
                                              return null;
                                            },
                                            onFieldSubmitted: (_) =>
                                                _remitCreate())),
                                  ])))),
                      SpacedVisibility(
                        true,
                        BronzeFormInput(_descriptionController,
                            icon: Icon(Icons.description),
                            labelText: 'Description',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter a value';
                              return null;
                            },
                            onFieldSubmitted: (_) => _remitCreate()),
                      ),
                      VerticalSpacer(),
                      BronzeRoundedButton(_remitCreate, ZapOnPrimary,
                          ZapPrimary, ZapPrimaryGradient, 'Create Remit',
                          width: ButtonWidth,
                          height: ButtonHeight,
                          fwdArrow: true),
                      BronzeRoundedButton(() => Navigator.of(context).pop(),
                          ZapOnSurface, ZapSurface, null, 'Cancel',
                          width: ButtonWidth, height: ButtonHeight),
                    ])))));
  }
}
