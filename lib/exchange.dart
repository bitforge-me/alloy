import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'dart:async';

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
  BeMarket _market = BeMarket('', '', '', 0, '', '', '');
  Decimal _amount = Decimal.zero;
  bool _calculating = false;
  Timer? _amountTimer;
  String _lastAmount = '';

  _ExchangeWidgetState();

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initMarkets();
    });
    _amountController.addListener(_amountListener);
  }

  @override
  void dispose() {
    super.dispose();
    _amountTimer?.cancel();
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
    _amountListener(force: true);
  }

  void _toChanged(String? value) {
    if (value == null) return;
    setState(() => _toAsset = value);
    _amountListener(force: true);
  }

  void _setProcessing() {
    _receiveController.text = '';
    setState(() {
      _validAmount = false;
      _calculating = true;
    });
  }

  void _amountListener({bool force = false}) {
    // cancel any running timer
    _amountTimer?.cancel();
    // check we actually want to start the timer
    if (!force &&
        (_amountController.text.isEmpty ||
            _amountController.text == _lastAmount)) return;
    _lastAmount = _amountController.text;
    // in the mean time update the state
    _setProcessing();
    // start the quote timer
    _amountTimer = Timer(Duration(seconds: 2), () async {
      await _updateQuote();
      setState(() => _calculating = false);
    });
  }

  Future<void> _updateQuote() async {
    // check value is valid
    if (_amountController.text.isEmpty) return;
    var value = Decimal.tryParse(_amountController.text.trim());
    if (value == null || value <= Decimal.zero) {
      snackMsg(context, 'Invalid amount', category: MessageCategory.Warning);
      return;
    }
    // check market is valid
    BeMarket? market;
    BeMarketSide side = BeMarketSide.ask;
    for (var item in _markets) {
      if ('$_fromAsset-$_toAsset' == item.symbol) {
        market = item;
        side = BeMarketSide.ask;
        break;
      }
      if ('$_toAsset-$_fromAsset' == item.symbol) {
        market = item;
        side = BeMarketSide.bid;
        break;
      }
    }
    if (market == null) {
      snackMsg(context, 'Invalid market', category: MessageCategory.Warning);
      return;
    }
    // get market orderbook and quote
    var res = await beOrderbook(market.symbol);
    var quote = res.when<QuoteTotalPrice?>((orderbook) {
      switch (side) {
        case BeMarketSide.bid:
          var estimate =
              bidEstimateAmountFromQuoteAssetAmount(orderbook, value);
          if (estimate.errMsg != null) return estimate;
          // double check result with 'bidQuoteAmount()'
          var smallestAmount =
              Decimal.one / power(Decimal.fromInt(10), assetDecimals(_toAsset));
          var adjustAmount = smallestAmount * Decimal.fromInt(100);
          var estAmount =
              roundAt(estimate.amountBaseAsset, assetDecimals(_toAsset));
          estimate = bidQuoteAmount(orderbook, estAmount);
          var n = 0;
          while (estimate.amountQuoteAsset > value ||
              adjustAmount > smallestAmount) {
            estAmount -= adjustAmount;
            estAmount = roundAt(estAmount, assetDecimals(_toAsset));
            estimate = bidQuoteAmount(orderbook, estAmount);
            if (estimate.errMsg != null) return estimate;
            if (estimate.amountQuoteAsset < value &&
                adjustAmount > smallestAmount) {
              n = 0;
              estAmount += adjustAmount;
              adjustAmount = adjustAmount / Decimal.fromInt(2);
              if (adjustAmount < smallestAmount) adjustAmount = smallestAmount;
              continue;
            }
            if (n > 10) {
              n = 0;
              adjustAmount = adjustAmount * Decimal.fromInt(10);
            } else
              n = n + 1;
          }
          return QuoteTotalPrice(
              estimate.amountBaseAsset,
              roundAt(
                  estimate.amountQuoteAsset, assetDecimals(market!.quoteAsset)),
              estimate.errMsg);
        case BeMarketSide.ask:
          return askQuoteAmount(orderbook, value);
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
    res2.when(
        (order) => alert(context, 'info',
            '$side ${order.baseAmount} ${order.baseAsset}, ${order.quoteAmount} ${order.quoteAsset}'),
        error: (err) => alert(context, 'error',
            'failed to validate order (${BeError.msg(err)})'));
    // set amount
    switch (side) {
      case BeMarketSide.bid:
        _receiveController.text = quote.amountBaseAsset.toString();
        break;
      case BeMarketSide.ask:
        _receiveController.text = quote.amountQuoteAsset.toString();
        break;
    }
    _side = side;
    _market = market;
    _amount = quote.amountBaseAsset;
    setState(() => _validAmount = true);
  }

  void _exchange() async {
    showAlertDialog(context, 'creating order..');
    var res = await beOrderCreate(_market.symbol, _side, _amount);
    Navigator.pop(context);
    res.when(
        (order) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderScreen(order, widget.websocket))),
        error: (err) => alert(
            context, 'error', 'failed to create order (${BeError.msg(err)})'));
  }

  Widget _buildWidget() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: 200,
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: ZapBlue,
                ),
                items: _fromAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: _fromAsset,
                onChanged: _fromChanged)),
        Container(
            margin: EdgeInsets.all(20),
            child: _calculating
                ? CircularProgressIndicator()
                : Icon(Icons.arrow_forward, color: ZapBlue, size: 24)),
        SizedBox(
            width: 200,
            child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: ZapBlue,
                ),
                items: _toAssets
                    .map((e) => DropdownMenuItem<String>(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(e), assetLogo(e, size: 24)]),
                        value: e))
                    .toList(),
                value: _toAsset,
                onChanged: _toChanged))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: 200,
            child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true))),
        SizedBox(width: 64),
        SizedBox(
            width: 200,
            child: TextField(
                controller: _receiveController,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()))),
      ]),
      _validAmount
          ? RoundedButton(
              _exchange, ZapWhite, ZapBlue, ZapBlueGradient, 'Create Order',
              holePunch: true, width: 200)
          : SizedBox()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _failedMarkets
          ? raisedButton(onPressed: _initMarkets, child: Text('Try Again'))
          : SizedBox(),
      _markets.length == 0 && !_failedMarkets
          ? CircularProgressIndicator()
          : SizedBox(),
      _markets.length > 0 ? _buildWidget() : SizedBox(),
      SizedBox(height: 50)
    ]);
  }
}
