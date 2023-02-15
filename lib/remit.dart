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
import 'withdrawal.dart';

final log = Logger('Remit');

class RemitSelectScreen extends StatefulWidget {
  final Websocket websocket;
  final UserInfo? userInfo;

  RemitSelectScreen(this.websocket, this.userInfo);

  @override
  State<RemitSelectScreen> createState() => _RemitSelectScreenState();
}

class _RemitSelectScreenState extends State<RemitSelectScreen> {
  Future<void> _remitTap() async {
    showAlertDialog(context, 'querying..');
    var resBal = await beBalance(Btc);
    Navigator.pop(context);
    var balance = resBal.when((balance) => balance, error: (err) {
      snackMsg(context, 'failed to query balances',
          category: MessageCategory.Warning);
      return null;
    });
    if (balance == null) return;
    showAlertDialog(context, 'querying..');
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
    showAlertDialog(context, 'querying..');
    var resPm = await beRemitPaymentMethods();
    Navigator.pop(context);
    resPm.when((paymentMethods) async {
      var success = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
              builder: (context) => RemitFormScreen(
                  widget.websocket,
                  widget.userInfo,
                  balance.available,
                  btc,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Remit'),
      ),
      body: BitforgePage(
          child: ListView(children: [
        Padding(
            padding: EdgeInsets.all(50),
            child: Text(
                'Send funds directly to your family and friends bank accounts abroad using our remittance partners')),
        ListTile(
          title: Text('Pouch.ph - Phillipines'),
          leading: _remitLogo(),
          onTap: _remitTap,
        )
      ])),
    );
  }
}

class RemitFormScreen extends StatefulWidget {
  final Websocket websocket;
  final UserInfo? userInfo;
  final Decimal availableBalance;
  final BeAsset asset;
  final BeAsset l2Network;
  final BePaymentMethods paymentMethods;

  RemitFormScreen(this.websocket, this.userInfo, this.availableBalance,
      this.asset, this.l2Network, this.paymentMethods);

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

  var _availableBalance = 'xxx';
  var _max = Decimal.zero;

  var _showPrice = false;
  var _amount = Decimal.zero;

  @override
  void initState() {
    super.initState();
    // initialize payment method
    _paymentMethodCategory = widget.paymentMethods.keys.first;
    _paymentMethod = widget.paymentMethods[_paymentMethodCategory]!.first;
    // initialize max withdrawal
    var withdrawAsset = widget.l2Network;
    if (withdrawAsset.withdrawFeeFixed) {
      var fee = assetFormatWithUnitToUser(
          widget.asset.symbol, withdrawAsset.withdrawFee);
      var maxWithdraw = widget.availableBalance - withdrawAsset.withdrawFee;
      if (maxWithdraw < Decimal.zero) maxWithdraw = Decimal.zero;
      var maxWithdrawStr =
          assetFormatWithUnitToUser(widget.asset.symbol, maxWithdraw);
      _availableBalance =
          'Available to withdraw: $maxWithdrawStr\nWithdrawal fee: $fee';
      if (widget.availableBalance > withdrawAsset.withdrawFee)
        _max = widget.availableBalance - withdrawAsset.withdrawFee;
    } else {
      var feePercent = withdrawAsset.withdrawFee * Decimal.fromInt(100);
      var maxWithdraw =
          widget.availableBalance / (Decimal.one + withdrawAsset.withdrawFee);
      var maxWithdrawRounded = roundAt(maxWithdraw, widget.asset.decimals);
      var maxWithdrawStr =
          assetFormatWithUnitToUser(widget.asset.symbol, maxWithdrawRounded);
      _availableBalance =
          'Available to withdraw: $maxWithdrawStr\nWithdrawal fee: $feePercent%';
      if (widget.availableBalance > Decimal.zero)
        _max = widget.availableBalance -
            widget.availableBalance * withdrawAsset.withdrawFee;
    }
    _showPrice = PriceManager.showPriceFor(widget.asset.symbol);
  }

  void _inputChanged(String? input) {
    if (input == null) return;
    var amount = Decimal.zero;
    var inputAmount = Decimal.tryParse(input);
    if (inputAmount != null)
      amount = assetAmountFromUser(widget.asset.symbol, inputAmount);
    if (amount != _amount)
      setState(() {
        _amount = amount;
      });
  }

  void _remitCreate() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      assert(_paymentMethod != null);
      // ask user to confirm
      var amount = Decimal.tryParse(_amountController.text);
      if (amount == null) {
        var msg = 'failed to parse amount (${_amountController.text})';
        log.severe(msg);
        alert(context, 'error', msg);
        return;
      }
      amount = assetAmountFromUser(widget.asset.symbol, amount);
      var userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => RemitCheckScreen(
                  _testnet,
                  widget.asset.symbol,
                  widget.l2Network.symbol,
                  RemitCheckType.creation,
                  _paymentMethodCategory,
                  _paymentMethod!,
                  _nameController.text,
                  _accountNumberController.text,
                  _mobileNumberController.text,
                  amount!,
                  _descriptionController.text,
                  null)));
      if (userOk == null || !userOk) return;
      // create invoice
      var amountInt = (amount * Decimal.fromInt(100000000))
          .toInt(); //TODO - do these conversions server side?
      var currency = 'SAT'; //TODO - keep this server side?
      showAlertDialog(context, 'creating invoice..');
      var res = await beRemitInvoiceCreate(
          _paymentMethodCategory,
          _paymentMethod!,
          _nameController.text,
          _accountNumberController.text,
          _mobileNumberController.text,
          currency,
          amountInt,
          _descriptionController.text);
      Navigator.pop(context);
      var invoice =
          res.when((remit, invoice, withdrawal) => invoice, error: (err) {
        alert(
            context, 'error', 'failed to create invoice (${BeError.msg(err)})');
        return null;
      });
      if (invoice == null) return;
      // ask user to confirm again (after seeing fees and final amount)
      userOk = await Navigator.push(
          context,
          MaterialPageRoute<bool>(
              builder: (context) => RemitCheckScreen(
                  _testnet,
                  widget.asset.symbol,
                  widget.l2Network.symbol,
                  RemitCheckType.payment,
                  _paymentMethodCategory,
                  _paymentMethod!,
                  _nameController.text,
                  _accountNumberController.text,
                  _mobileNumberController.text,
                  amount!,
                  _descriptionController.text,
                  invoice)));
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
      // pay invoice
      showAlertDialog(context, 'paying invoice..');
      var res2 = await beRemitInvoicePay(invoice.referenceId, tfCode);
      Navigator.pop(context);
      res2.when((remit, invoice, withdrawal) async {
        if (withdrawal == null) {
          alert(context, 'error', 'failed to pay invoice');
        } else {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CryptoWithdrawalDetailScreen(
                      withdrawal, widget.websocket)));
          Navigator.pop(context, true);
        }
      },
          error: (err) => alert(
              context, 'error', 'failed to pay invoice (${BeError.msg(err)})'));
    }
  }

  void _setMax() {
    _amountController.text =
        assetAmountToUser(widget.asset.symbol, _max).toString();
  }

  List<DropdownMenuItem<BePaymentMethod>> _paymentMethodItems() {
    var pmis = <DropdownMenuItem<BePaymentMethod>>[];
    for (var category in widget.paymentMethods.keys) {
      var pms = widget.paymentMethods[category];
      if (pms != null)
        for (var pm in pms) {
          pmis.add(DropdownMenuItem<BePaymentMethod>(
              child: Text(pm.name), value: pm));
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
                      Container(
                          margin: EdgeInsets.all(5),
                          child: Text(_availableBalance)),
                      BronzeFormInput(_amountController,
                          icon: Icon(Icons.currency_bitcoin),
                          labelText: 'Amount',
                          suffixText: assetUnit(widget.asset.symbol),
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
                              'Please return a value greater then 0';
                            var withdrawAsset = widget.l2Network;
                            var sysAmount = assetAmountFromUser(
                                widget.asset.symbol, userAmount);
                            if (sysAmount < withdrawAsset.minWithdraw)
                              return 'Please enter a value greater then or equal to ${assetAmountToUser(widget.asset.symbol, withdrawAsset.minWithdraw)}';
                            if (sysAmount > _max)
                              return 'Please enter a value less then or equal to ${assetAmountToUser(widget.asset.symbol, _max)}';
                            return null;
                          },
                          onChanged: _inputChanged,
                          onFieldSubmitted: (_) => _remitCreate()),
                      SpacedVisibility(
                          assetPricesEnabled &&
                              _amount > Decimal.zero &&
                              _showPrice,
                          PriceEquivalent(widget.asset.symbol, _amount,
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
