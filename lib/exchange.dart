import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'dart:async';
import 'package:logging/logging.dart';

import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';
import 'package:zapdart/utils.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
import 'snack.dart';
import 'quote.dart';
import 'orders.dart';
import 'utils.dart';
import 'widgets.dart';
import 'config.dart' as cfg;
import 'deposit.dart';

final log = Logger('Exchange');

enum FieldUpdated { amount, receive }

enum AmountTooHighChoice { none, adjust, gotoDeposit }

class ExchangeWidget extends StatefulWidget {
  final Websocket websocket;

  ExchangeWidget(this.websocket);

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  List<BeMarket> _markets = [];
  bool _failedMarkets = false;
  String _fromAsset = 'NZD';
  String _toAsset = 'BTC';
  List<String> _fromAssets = [];
  List<String> _toAssets = [];
  TextEditingController _amountController = TextEditingController();
  TextEditingController _receiveController = TextEditingController();
  bool _validAmount = false;
  BeMarketSide _side = BeMarketSide.ask;
  BeMarket _market = BeMarket('', '', '', 0, '', Decimal.zero, '');
  Decimal _amount = Decimal.zero;
  bool _calculating = false;
  Timer? _updateTimer;
  String _lastAmount = '';
  String _lastReceive = '';

  _ExchangeWidgetState();

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initMarkets();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _updateTimer?.cancel();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {}

  Future<void> _initMarkets() async {
    setState(() => _failedMarkets = false);
    var res = await beMarkets();
    res.when((markets) => _genAssets(markets), error: (err) {
      setState(() => _failedMarkets = true);
      snackMsg(context, 'failed to get markets',
          category: MessageCategory.Warning);
    });
  }

  void _genAssets(List<BeMarket> markets) {
    var fromAssets = <String>[];
    for (var market in markets) {
      if (!fromAssets.contains(market.baseAsset))
        fromAssets.add(market.baseAsset);
      if (!fromAssets.contains(market.quoteAsset))
        fromAssets.add(market.quoteAsset);
    }
    var toAssets = <String>[];
    for (var market in markets) {
      var paredAsset;
      if (market.baseAsset == _fromAsset)
        paredAsset = market.quoteAsset;
      else if (market.quoteAsset == _fromAsset)
        paredAsset = market.baseAsset;
      else
        continue;
      if (!toAssets.contains(paredAsset)) toAssets.add(paredAsset);
    }
    if (!toAssets.contains(_toAsset)) _toAsset = toAssets.first;
    if (!fromAssets.contains(_fromAsset)) _fromAsset = fromAssets.first;
    setState(() {
      _fromAssets = fromAssets;
      _toAssets = toAssets;
      _markets = markets;
      _toAsset = _toAsset;
      _fromAsset = _fromAsset;
    });
  }

  void _fromChanged(String? value) {
    if (value == null) return;
    setState(() => _fromAsset = value);
    _genAssets(_markets);
    _amountUpdate(force: true);
  }

  void _toChanged(String? value) {
    if (value == null) return;
    setState(() => _toAsset = value);
    _amountUpdate(force: true);
  }

  void _setProcessing(FieldUpdated field) {
    if (field == FieldUpdated.amount) _receiveController.text = '';
    if (field == FieldUpdated.receive) _amountController.text = '';
    setState(() {
      _validAmount = false;
      _calculating = true;
    });
  }

  void _amountChanged(String? value) {
    _amountUpdate();
  }

  void _amountUpdate({bool force = false}) {
    // cancel any running timer
    _updateTimer?.cancel();
    // check we actually want to start the timer
    if (!force &&
        (_amountController.text.isEmpty ||
            _amountController.text == _lastAmount)) return;
    _lastAmount = _amountController.text;
    // in the mean time update the state
    _setProcessing(FieldUpdated.amount);
    // start the quote timer
    _updateTimer = Timer(Duration(seconds: 2), () async {
      await _updateQuote(FieldUpdated.amount);
      setState(() => _calculating = false);
    });
  }

  void _recieveChanged(String? value) {
    _receiveUpdate();
  }

  void _receiveUpdate({bool force = false}) {
    // cancel any running timer
    _updateTimer?.cancel();
    // check we actually want to start the timer
    if (!force &&
        (_receiveController.text.isEmpty ||
            _receiveController.text == _lastReceive)) return;
    _lastReceive = _receiveController.text;
    // in the mean time update the state
    _setProcessing(FieldUpdated.receive);
    // start the quote timer
    _updateTimer = Timer(Duration(seconds: 2), () async {
      await _updateQuote(FieldUpdated.receive);
      setState(() => _calculating = false);
    });
  }

  Future<AmountTooHighChoice> _amountTooHigh(
      BeBalance bal, Decimal amount) async {
    var res = await showDialog<AmountTooHighChoice>(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Not enough funds for order'),
              content: Text(
                  'Your current balance is ${assetFormatWithUnitToUser(bal.asset, bal.available)}, but you have tried to convert ${assetFormatWithUnitToUser(bal.asset, amount)}.\n\nWhat would you like to do?'),
              actions: [
                BronzeRoundedButton(
                    () => Navigator.of(context)
                        .pop(AmountTooHighChoice.gotoDeposit),
                    ZapOnSurface,
                    ZapSurface,
                    null,
                    'Deposit More Funds',
                    fwdArrow: true,
                    width: cfg.ButtonWidth,
                    height: cfg.ButtonHeight),
                BronzeRoundedButton(
                    () => Navigator.of(context).pop(AmountTooHighChoice.adjust),
                    ZapOnSurface,
                    ZapSurface,
                    null,
                    'Adjust Amount to Balance',
                    fwdArrow: true,
                    width: cfg.ButtonWidth,
                    height: cfg.ButtonHeight),
              ]);
        });
    if (res == null) return AmountTooHighChoice.none;
    return res;
  }

  Future<void> _makeDeposit() async {
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

  Future<void> _updateQuote(FieldUpdated field) async {
    // unfocus text input
    unfocusText();
    // init local values
    var fromAsset = _fromAsset;
    var toAsset = _toAsset;
    var sourceController = _amountController;
    var targetController = _receiveController;
    if (field == FieldUpdated.receive) {
      sourceController = _receiveController;
      targetController = _amountController;
    }
    // get entered value
    if (sourceController.text.isEmpty) return;
    var tryValue = Decimal.tryParse(sourceController.text.trim());
    // check value is valid
    if (tryValue == null || tryValue <= Decimal.zero) {
      snackMsg(context, 'invalid amount', category: MessageCategory.Warning);
      return;
    }
    var value = tryValue;
    // convert value unit
    if (field == FieldUpdated.receive)
      value = assetAmountFromUser(toAsset, value);
    else
      value = assetAmountFromUser(fromAsset, value);
    // get user balance
    var balanceResult = await beBalances();
    var continueResult = await balanceResult.when((balances) async {
      if (field == FieldUpdated.receive) return true;
      for (var bal in balances)
        if (bal.asset == fromAsset && bal.available < value) {
          var res = await _amountTooHigh(bal, value);
          switch (res) {
            case AmountTooHighChoice.adjust:
              value = assetAmountToUser(_fromAsset, bal.available);
              _amountController.text = value.toString();
              snackMsg(context, 'adjusted amount to available balance',
                  category: MessageCategory.Warning);
              return true;
            case AmountTooHighChoice.gotoDeposit:
              _makeDeposit();
              _clearInputs();
              return false;
            case AmountTooHighChoice.none:
              _clearInputs();
              return false;
          }
        }
    }, error: (err) async {
      log.severe('failed to get user balances $err');
      return false;
    });
    if (continueResult == null || !continueResult) return;
    // check market is valid
    BeMarket? tryMarket;
    var side = BeMarketSide.ask;
    for (var item in _markets) {
      if ('$fromAsset-$toAsset' == item.symbol) {
        tryMarket = item;
        side = BeMarketSide.ask;
        break;
      }
      if ('$toAsset-$fromAsset' == item.symbol) {
        tryMarket = item;
        side = BeMarketSide.bid;
        break;
      }
    }
    if (tryMarket == null) {
      snackMsg(context, 'invalid market', category: MessageCategory.Warning);
      return;
    }
    var market = tryMarket;
    // get market orderbook and quote
    var res = await beOrderbook(market.symbol);
    var quote = await res.when<QuoteTotalPrice?>((orderbook) {
      switch (field) {
        case FieldUpdated.amount:
          switch (side) {
            case BeMarketSide.bid:
              return _bruteForceQuote(value, market, side, orderbook);
            case BeMarketSide.ask:
              return askQuoteAmount(market, orderbook, value);
          }
        case FieldUpdated.receive:
          switch (side) {
            case BeMarketSide.bid:
              return bidQuoteAmount(market, orderbook, value);
            case BeMarketSide.ask:
              return _bruteForceQuote(value, market, side, orderbook);
          }
      }
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
    // double check amount with server
    BeBrokerOrderResult res2 =
        await beOrderValidate(market.symbol, side, quote.amountBaseAsset);
    if (!res2.when<bool>((order) {
      log.info(
          '$side ${order.baseAmount} ${order.baseAsset}, ${order.quoteAmount} ${order.quoteAsset}');
      return true;
    }, error: (err) {
      snackMsg(context, 'failed to validate order (${BeError.msg(err)})',
          category: MessageCategory.Warning);
      return false;
    })) return;
    // set amount
    switch (side) {
      case BeMarketSide.bid:
        if (field == FieldUpdated.receive)
          targetController.text = assetFormat(
              fromAsset, assetAmountToUser(fromAsset, quote.amountQuoteAsset));
        else
          targetController.text = assetFormat(
              toAsset, assetAmountToUser(toAsset, quote.amountBaseAsset));
        break;
      case BeMarketSide.ask:
        if (field == FieldUpdated.receive)
          targetController.text = assetFormat(
              fromAsset, assetAmountToUser(fromAsset, quote.amountBaseAsset));
        else
          targetController.text = assetFormat(
              toAsset, assetAmountToUser(toAsset, quote.amountQuoteAsset));
        break;
    }
    _side = side;
    _market = market;
    _amount = quote.amountBaseAsset;
    log.info(quote.toString(
        baseAsset: market.baseAsset, quoteAsset: market.quoteAsset));
    setState(() => _validAmount = true);
  }

  QuoteTotalPrice? _bruteForceQuote(Decimal value, BeMarket market,
      BeMarketSide side, BeOrderbook orderbook) {
    // first do a basic estimate amount of quote asset we will need using the order book
    var quoteAssetAmount = roundAt(value, assetDecimals(market.quoteAsset));
    var estimate =
        estimateFromQuoteAssetAmount(side, market, orderbook, quoteAssetAmount);
    if (estimate.errMsg != null) {
      // give user an idea of the estimate if we abort early
      //if (estimate.amountBaseAsset != Decimal.zero)
      //  targetController.text = assetFormat(toAsset,
      //      assetAmountToUser(toAsset, estimate.amountBaseAsset));
      return estimate;
    }
    // find the `smallestAmount` using the number of decimal places in the asset
    var smallestAmount = Decimal.one /
        power(Decimal.fromInt(10), assetDecimals(market.baseAsset));
    // set an initial `adjustAmount` that we will adjust the estimate each loop
    var adjustAmount = smallestAmount * Decimal.fromInt(100);
    // create our first estimate input
    var estInput =
        roundAt(estimate.amountBaseAsset, assetDecimals(market.baseAsset));
    // now create our first real estimate using the same method as the server
    //   ie. walk the order book using a set amount of the base asset and increase the quote asset required by the fee percentage
    if (side == BeMarketSide.ask)
      estimate = askQuoteAmount(market, orderbook, estInput);
    else
      estimate = bidQuoteAmount(market, orderbook, estInput);
    // now we loop as long as the server method estimate of the quote asset is not what we actually want to pay
    //   note: it should start as larger and we reduce it each loop iteration
    var n = 0;
    while (
        roundAt(estimate.amountQuoteAsset, assetDecimals(market.quoteAsset)) !=
            quoteAssetAmount) {
      // adjust estimate input
      if (side == BeMarketSide.ask)
        estInput += adjustAmount;
      else
        estInput -= adjustAmount;
      estInput = roundAt(estInput, assetDecimals(market.baseAsset));
      // generate new estimate
      if (side == BeMarketSide.ask)
        estimate = askQuoteAmount(market, orderbook, estInput);
      else
        estimate = bidQuoteAmount(market, orderbook, estInput);
      if (estimate.errMsg != null) {
        // give user an idea of the estimate if we abort early
        //if (estimate.amountBaseAsset != Decimal.zero)
        //  targetController.text = assetFormat(toAsset,
        //      assetAmountToUser(toAsset, estimate.amountBaseAsset));
        return estimate;
      }
      // if we overshoot we need to walk back the estimate input a bit
      if (side == BeMarketSide.ask &&
              estimate.amountQuoteAsset > quoteAssetAmount ||
          side == BeMarketSide.bid &&
              estimate.amountQuoteAsset < quoteAssetAmount) {
        n = 0;
        if (side == BeMarketSide.ask)
          estInput -= adjustAmount *
              Decimal.fromInt(
                  2); // twice because we reduced it at the start of the loop
        else
          estInput += adjustAmount *
              Decimal.fromInt(
                  2); // twice because we reduced it at the start of the loop
        // if the adjustAmount is greater then the smallestAmount then we need to make it a bit more fine grained
        if (adjustAmount > smallestAmount) {
          adjustAmount = adjustAmount / Decimal.fromInt(2);
          if (adjustAmount < smallestAmount) adjustAmount = smallestAmount;
        }
        continue;
      }
      // we will short cut the loop by periodically increasing the adjustment amount
      if (n > 10) {
        n = 0;
        adjustAmount = adjustAmount * Decimal.fromInt(10);
      } else
        n = n + 1;
    }
    return QuoteTotalPrice(
        estimate.amountBaseAsset,
        roundAt(estimate.amountQuoteAsset, assetDecimals(market.quoteAsset)),
        estimate.feeQuoteAsset,
        estimate.fixedFeeQuoteAsset,
        estimate.errMsg);
  }

  void _submit() {
    if (_validAmount) _exchange();
  }

  void _clearInputs() {
    _amountController.text = '';
    _receiveController.text = '';
    setState(() => _validAmount = false);
  }

  void _exchange() async {
    showAlertDialog(context, 'creating order..');
    var res = await beOrderCreate(_market.symbol, _side, _amount);
    Navigator.pop(context);
    res.when((order) {
      _clearInputs();
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderScreen(order, widget.websocket)));
    },
        error: (err) => alert(
            context, 'error', 'failed to create order (${BeError.msg(err)})'));
  }

  Widget _buildWidget() {
    const inputWidth = cfg.ButtonWidth;
    var from = Column(children: [
      SizedBox(
        width: inputWidth,
        child: RoundedEdgeBox(
            borderColor: ZapSurface,
            gradient: assetGradient(_fromAsset),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: _fromAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('  ' + e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: _fromAsset,
                onChanged: _fromChanged)),
      ),
      VerticalSpacer(),
      SizedBox(
        width: inputWidth,
        child: BronzeValueInput(
          controller: _amountController,
          suffixText: assetUnit(_fromAsset),
          labelText: 'Amount',
          onChanged: _amountChanged,
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
    ]);
    var arrow = Container(
        margin: EdgeInsets.all(10),
        child: _calculating
            ? CircularProgressIndicator()
            : Icon(Icons.arrow_forward, color: ZapPrimary, size: 24));
    var arrowDown = Container(
        margin: EdgeInsets.all(20),
        child: _calculating
            ? CircularProgressIndicator()
            : Icon(Icons.arrow_downward, color: ZapPrimary, size: 24));
    var to = Column(children: [
      SizedBox(
        width: inputWidth,
        child: RoundedEdgeBox(
            borderColor: ZapSurface,
            gradient: assetGradient(_toAsset),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: _toAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('  ' + e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: _toAsset,
                onChanged: _toChanged)),
      ),
      VerticalSpacer(),
      SizedBox(
        width: inputWidth,
        child: BronzeValueInput(
          controller: _receiveController,
          suffixText: assetUnit(_toAsset),
          labelText: 'Receive',
          onChanged: _recieveChanged,
          onFieldSubmitted: (_) => _submit(),
        ),
      )
    ]);
    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < cfg.MaxColumnWidth)
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [from, arrowDown, to]);
        else
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [from, arrow, to]);
      }),
      _validAmount
          ? Padding(
              padding: EdgeInsets.only(top: 20),
              child: BronzeRoundedButton(_exchange, ZapOnPrimary, ZapPrimary,
                  ZapPrimaryGradient, 'Create Order',
                  fwdArrow: true, width: inputWidth, height: cfg.ButtonHeight))
          : SizedBox()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(children: [
          _failedMarkets
              ? raisedButton(onPressed: _initMarkets, child: Text('Try Again'))
              : SizedBox(),
          _markets.length == 0 && !_failedMarkets
              ? CircularProgressIndicator()
              : SizedBox(),
          _markets.length > 0 ? _buildWidget() : SizedBox(),
        ]));
  }
}
