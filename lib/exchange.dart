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

enum SliderAmount { none, min, half, max }

class MarketType {
  BeMarket market;
  BeMarketSide side;
  MarketType(this.market, this.side);
}

class MarketMin {
  BeMarket market;
  Decimal min;
  String? error;
  MarketMin(this.market, this.min, {this.error});
  factory MarketMin.Err(String error) =>
      MarketMin(BeMarket.empty(), Decimal.zero, error: error);
}

class ExchangeModel extends ChangeNotifier {
  List<BeMarket> _markets = [];
  bool _failedMarkets = false;
  String _fromAsset = 'NZD';
  String _toAsset = 'BTC';
  List<String> _fromAssets = [];
  List<String> _toAssets = [];
  BeBrokerOrder? _validatedOrder = null;
  BeMarketSide _side = BeMarketSide.ask;
  BeMarket _market = BeMarket('', '', '', 0, '', Decimal.zero, '');
  Decimal _amountFrom = Decimal.zero;
  Decimal _amountTo = Decimal.zero;
  String? _minAmount;
  SliderAmount _sliderSelected = SliderAmount.none;

  Timer? _updateTimer;
  bool _calculating = false;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _receiveController = TextEditingController();
  String _lastAmount = '';
  String _lastReceive = '';

  ExchangeModel();

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }

  void cancelTimer() {
    _updateTimer?.cancel();
  }

  Future<bool> initMarkets() async {
    _failedMarkets = false;
    notifyListeners();
    var res = await beMarkets();
    res.when((markets) => _genAssets(markets), error: (err) {
      _failedMarkets = true;
      notifyListeners();
    });
    return !_failedMarkets;
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
    this._fromAssets = fromAssets;
    this._toAssets = toAssets;
    this._markets = markets;
    notifyListeners();
    setMinAmount();
  }

  void clearSlider() {
    _sliderSelected = SliderAmount.none;
    notifyListeners();
  }

  void clearInputs() {
    _minAmount = null;
    _amountFrom = Decimal.zero;
    _amountTo = Decimal.zero;
    _lastAmount = '';
    _lastReceive = '';
    _amountController.text = '';
    _receiveController.text = '';
    _validatedOrder = null;
    setMinAmount();
    notifyListeners();
  }

  void fromChanged(BuildContext context, Websocket websocket, String? value) {
    _amountController.text = '';
    _receiveController.text = '';
    clearSlider();
    if (value == null) return;
    _fromAsset = value;
    _genAssets(_markets);
    setMinAmount();
    _amountUpdate(context, websocket, force: true, timerSeconds: 0);
    notifyListeners();
  }

  void toChanged(BuildContext context, Websocket websocket, String? value) {
    _amountController.text = '';
    _receiveController.text = '';
    clearSlider();
    if (value == null) return;
    _toAsset = value;
    setMinAmount();
    _amountUpdate(context, websocket, force: true, timerSeconds: 0);
    notifyListeners();
  }

  void setMinAmount() async {
    var tryMarket = _checkMarket(_fromAsset, _toAsset);
    if (tryMarket == null) return;
    var marketMin = await _marketMin(tryMarket.market);
    if (marketMin.error != null) return;
    _minAmount = assetFormatToUser(_fromAsset, marketMin.min);
    notifyListeners();
  }

  void setProcessing(FieldUpdated field) {
    if (field == FieldUpdated.amount) _receiveController.text = '';
    if (field == FieldUpdated.receive) _amountController.text = '';
    _calculating = true;
    _validatedOrder = null;
    notifyListeners();
  }

  void amountsRecalc() {
    if (_side == BeMarketSide.ask) {
      if (_amountFrom != Decimal.zero)
        _amountController.text =
            assetFormatToUser(_fromAsset, _amountFrom, noGroupSeperator: true);
      if (_amountTo != Decimal.zero)
        _receiveController.text =
            assetFormatToUser(_toAsset, _amountTo, noGroupSeperator: true);
    } else {
      if (_amountFrom != Decimal.zero)
        _amountController.text =
            assetFormatToUser(_fromAsset, _amountTo, noGroupSeperator: true);
      if (_amountTo != Decimal.zero)
        _receiveController.text =
            assetFormatToUser(_toAsset, _amountFrom, noGroupSeperator: true);
    }
  }

  void amountChanged(BuildContext context, Websocket websocket, String? value) {
    _amountUpdate(context, websocket);
    clearSlider();
  }

  void _amountUpdate(BuildContext context, Websocket websocket,
      {bool force = false, int timerSeconds = 1}) {
    // cancel any running timer
    _updateTimer?.cancel();
    // check we actually want to start the timer
    if (!force &&
        (_amountController.text.isEmpty ||
            _amountController.text == _lastAmount)) return;
    _lastAmount = _amountController.text;
    // in the mean time update the state
    setProcessing(FieldUpdated.amount);
    // start the quote timer
    _updateTimer = Timer(Duration(seconds: timerSeconds), () async {
      await _updateQuote(context, websocket, FieldUpdated.amount);
      _calculating = false;
      notifyListeners();
    });
  }

  void recieveChanged(
      BuildContext context, Websocket websocket, String? value) {
    _receiveUpdate(context, websocket);
    clearSlider();
  }

  void _receiveUpdate(BuildContext context, Websocket websocket,
      {bool force = false, int timerSeconds = 1}) {
    // cancel any running timer
    _updateTimer?.cancel();
    // check we actually want to start the timer
    if (!force &&
        (_receiveController.text.isEmpty ||
            _receiveController.text == _lastReceive)) return;
    _lastAmount = '';
    _lastReceive = _receiveController.text;
    // in the mean time update the state
    setProcessing(FieldUpdated.receive);
    // start the quote timer
    _updateTimer = Timer(Duration(seconds: timerSeconds), () async {
      await _updateQuote(context, websocket, FieldUpdated.receive);
      _calculating = false;
      notifyListeners();
    });
  }

  Future<void> _updateQuote(
      BuildContext context, Websocket websocket, FieldUpdated field) async {
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
          var res = await _amountTooHigh(context, bal, value);
          switch (res) {
            case AmountTooHighChoice.adjust:
              value = bal.available;
              _amountController.text =
                  assetAmountToUser(_fromAsset, bal.available).toString();
              snackMsg(context, 'adjusted amount to available balance',
                  category: MessageCategory.Warning);
              return true;
            case AmountTooHighChoice.gotoDeposit:
              _makeDeposit(context, websocket);
              clearInputs();
              return false;
            case AmountTooHighChoice.none:
              clearInputs();
              return false;
          }
        }
      // default case is to continue processing
      return true;
    }, error: (err) async {
      log.severe('failed to get user balances $err');
      return false;
    });
    if (!continueResult) return;
    // check market is valid
    MarketType? tryMarket = _checkMarket(_fromAsset, _toAsset);
    if (tryMarket == null) {
      snackMsg(context, 'invalid market', category: MessageCategory.Warning);
      return;
    }
    var market = tryMarket.market;
    var side = tryMarket.side;
    // get market orderbook and quote
    var res = await beOrderbook(market.symbol);
    var quote = await res.when<QuoteTotalPrice?>((orderbook) {
      switch (field) {
        case FieldUpdated.amount:
          switch (side) {
            case BeMarketSide.bid:
              return bruteForceQuote(value, market, side, orderbook);
            case BeMarketSide.ask:
              return askQuoteAmount(market, orderbook, value);
          }
        case FieldUpdated.receive:
          switch (side) {
            case BeMarketSide.bid:
              return bidQuoteAmount(market, orderbook, value);
            case BeMarketSide.ask:
              return bruteForceQuote(value, market, side, orderbook);
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
    var validatedOrder =
        res2.when<BeBrokerOrder?>((order) => order, error: (err) {
      snackMsg(context, 'failed to validate order (${BeError.msg(err)})',
          category: MessageCategory.Warning);
      return null;
    });
    if (validatedOrder == null) return;
    log.info(
        '$side ${validatedOrder.baseAmount} ${validatedOrder.baseAsset}, ${validatedOrder.quoteAmount} ${validatedOrder.quoteAsset}');
    // set amount
    switch (side) {
      case BeMarketSide.bid:
        if (field == FieldUpdated.receive)
          targetController.text = assetFormatToUser(
              fromAsset, quote.amountQuoteAsset,
              noGroupSeperator: true);
        else
          targetController.text = assetFormatToUser(
              toAsset, quote.amountBaseAsset,
              noGroupSeperator: true);
        break;
      case BeMarketSide.ask:
        if (field == FieldUpdated.receive)
          targetController.text = assetFormatToUser(
              fromAsset, quote.amountBaseAsset,
              noGroupSeperator: true);
        else
          targetController.text = assetFormatToUser(
              toAsset, quote.amountQuoteAsset,
              noGroupSeperator: true);
        break;
    }
    _side = side;
    _market = market;
    _amountFrom = quote.amountBaseAsset;
    _amountTo = quote.amountQuoteAsset;
    log.info(quote.toString(
        baseAsset: market.baseAsset, quoteAsset: market.quoteAsset));
    _validatedOrder = validatedOrder;
    notifyListeners();
  }

  Future<AmountTooHighChoice> _amountTooHigh(
      BuildContext context, BeBalance bal, Decimal amount) async {
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

  Future<void> _makeDeposit(BuildContext context, Websocket websocket) async {
    showAlertDialog(context, 'querying..');
    var res = await beAssets();
    Navigator.pop(context);
    res.when(
        (assets) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DepositSelectScreen(assets, websocket))),
        error: (err) => snackMsg(context, 'failed to query deposits',
            category: MessageCategory.Warning));
  }

  MarketType? _checkMarket(String fromAsset, String toAsset) {
    for (var item in _markets) {
      if ('$fromAsset-$toAsset' == item.symbol)
        return MarketType(item, BeMarketSide.ask);
      if ('$toAsset-$fromAsset' == item.symbol)
        return MarketType(item, BeMarketSide.bid);
    }
    return null;
  }

  Future<MarketMin> _marketMin(BeMarket market) async {
    // min trade of baseAsset from dasset
    var minValue = market.minTrade;
    var res = await beOrderbook(market.symbol);
    return await res.when((orderbook) {
      var bids = orderbook.bids;
      if (bids.length > 0) {
        // get best buy rate for baseAsset
        var rate = bids[0].rate;
        // convert min value from baseAsset to quoteAsset if required
        if (market.quoteAsset == _fromAsset) minValue = minValue * rate;
        // apply fee
        minValue *= Decimal.one + orderbook.brokerFee;
        // apply fixed fee
        var fixedFee = getFixedFee(market, orderbook);
        if (market.baseAsset == _fromAsset) fixedFee /= rate;
        minValue += fixedFee;
        // add 2% margin
        minValue *= Decimal.parse('1.02');
        return MarketMin(market, minValue);
      } else
        return MarketMin.Err('failed to calculate minimum order size');
    }, error: (err) {
      return MarketMin.Err('failed to get orderbook');
    });
  }

  Future<void> setMin(BuildContext context, Websocket websocket) async {
    var tryMarket = _checkMarket(_fromAsset, _toAsset);
    if (tryMarket == null) {
      snackMsg(context, 'invalid market', category: MessageCategory.Warning);
      return;
    }
    var marketMin = await _marketMin(tryMarket.market);
    if (marketMin.error != null)
      snackMsg(context, marketMin.error!, category: MessageCategory.Warning);
    else
      _setSliderValue(context, websocket, SliderAmount.min, marketMin.min);
  }

  Future<void> setHalf(BuildContext context, Websocket websocket) async {
    var res = await beBalances();
    res.when((balances) {
      for (var bal in balances)
        if (bal.asset == _fromAsset)
          _setSliderValue(context, websocket, SliderAmount.half,
              bal.available / Decimal.fromInt(2));
    },
        error: (err) => snackMsg(context, 'failed to get balances $err',
            category: MessageCategory.Warning));
  }

  Future<void> setMax(BuildContext context, Websocket websocket) async {
    var res = await beBalances();
    res.when((balances) {
      for (var bal in balances)
        if (bal.asset == _fromAsset)
          _setSliderValue(context, websocket, SliderAmount.max, bal.available);
    },
        error: (err) => snackMsg(context, 'failed to get balances $err',
            category: MessageCategory.Warning));
  }

  void _setSliderValue(BuildContext context, Websocket websocket,
      SliderAmount sliderSelected, Decimal value) {
    clearSlider();
    _sliderSelected = sliderSelected;
    var valueForUser = assetAmountToUser(_fromAsset, value);
    _amountController.text =
        ceil(valueForUser, scale: assetDecimals(_fromAsset)).toString();
    _amountUpdate(context, websocket, timerSeconds: 0);
  }

  void exchange(BuildContext context, Websocket websocket) async {
    showAlertDialog(context, 'creating order..');
    var res = await beOrderCreate(_market.symbol, _side, _amountFrom);
    Navigator.pop(context);
    res.when((order) {
      clearInputs();
      clearSlider();
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderScreen(order, websocket)));
    },
        error: (err) => alert(
            context, 'error', 'failed to create order (${BeError.msg(err)})'));
  }
}

class ExchangeWidget extends StatefulWidget {
  final Websocket websocket;
  final ExchangeModel model;

  ExchangeWidget(this.websocket, this.model);

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState(model);
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  final ExchangeModel model;

  _ExchangeWidgetState(this.model);

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance.addPostFrameCallback((_) => _initMarkets());
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _initMarkets() {
    widget.model.initMarkets().then((value) {
      if (!value)
        snackMsg(context, 'failed to get markets',
            category: MessageCategory.Warning);
    });
  }

  void _websocketEvent(WsEventArgs? args) {}

  void _submit() {
    if (model._validatedOrder != null)
      model.exchange(context, widget.websocket);
  }

  Widget _buildWidget() {
    const inputWidth = cfg.ButtonWidth;
    var from = Column(children: [
      SizedBox(
        width: inputWidth,
        child: RoundedEdgeBox(
            borderColor: ZapSurface,
            gradient: assetGradient(model._fromAsset),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: model._fromAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('  ' + e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: model._fromAsset,
                onChanged: (val) =>
                    model.fromChanged(context, widget.websocket, val))),
      ),
      VerticalSpacer(),
      SizedBox(
        width: inputWidth,
        child: BronzeValueInput(
          controller: model._amountController,
          suffixText: assetUnit(model._fromAsset),
          labelText: model._minAmount == null
              ? 'Amount'
              : 'Amount (minimum ${model._minAmount})',
          onChanged: (val) =>
              model.amountChanged(context, widget.websocket, val),
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
    ]);
    var arrow = Container(
        margin: EdgeInsets.all(10),
        child: model._calculating
            ? SizedBox(
                width: 24, height: 24, child: CircularProgressIndicator())
            : Icon(Icons.arrow_forward, color: ZapPrimary, size: 24));
    var arrowDown = Container(
        margin: EdgeInsets.all(20),
        child: model._calculating
            ? SizedBox(
                width: 24, height: 24, child: CircularProgressIndicator())
            : Icon(Icons.arrow_downward, color: ZapPrimary, size: 24));
    var to = Column(children: [
      SizedBox(
        width: inputWidth,
        child: RoundedEdgeBox(
            borderColor: ZapSurface,
            gradient: assetGradient(model._toAsset),
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: model._toAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('  ' + e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: model._toAsset,
                onChanged: (val) =>
                    model.toChanged(context, widget.websocket, val))),
      ),
      VerticalSpacer(),
      SizedBox(
        width: inputWidth,
        child: BronzeValueInput(
          controller: model._receiveController,
          suffixText: assetUnit(model._toAsset),
          labelText: 'Receive',
          onChanged: (val) =>
              model.recieveChanged(context, widget.websocket, val),
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
    ]);
    var exchangeSlider = SliderBar<SliderAmount>((v) {
      switch (v) {
        case SliderAmount.none:
          break;
        case SliderAmount.min:
          model.setMin(context, widget.websocket);
          break;
        case SliderAmount.half:
          model.setHalf(context, widget.websocket);
          break;
        case SliderAmount.max:
          model.setMax(context, widget.websocket);
          break;
      }
    }, model._sliderSelected, [
      SliderItem(SliderAmount.min, 'MIN'),
      SliderItem(SliderAmount.half, 'HALF'),
      SliderItem(SliderAmount.max, 'MAX')
    ]);
    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < cfg.MaxColumnWidth)
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            from,
            SizedBox(height: 7.0),
            exchangeSlider,
            arrowDown,
            to
          ]);
        else
          return Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [from, arrow, to]),
            SizedBox(height: 7.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(width: 8.0), exchangeSlider]),
          ]);
      }),
      VerticalSpacer(),
      Visibility(
          visible: model._validatedOrder != null,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BronzeRoundedButton(_submit, ZapOnPrimary, ZapPrimary,
                        ZapPrimaryGradient, 'Create Order',
                        fwdArrow: true,
                        width: inputWidth,
                        height: cfg.ButtonHeight),
                    OrderFees(model._validatedOrder, centerText: true)
                  ])))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(children: [
          model._failedMarkets
              ? raisedButton(onPressed: _initMarkets, child: Text('Try Again'))
              : SizedBox(),
          model._markets.length == 0 && !model._failedMarkets
              ? CircularProgressIndicator()
              : SizedBox(),
          model._markets.length > 0 ? _buildWidget() : SizedBox(),
        ]));
  }
}
