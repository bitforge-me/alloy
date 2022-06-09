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
import 'colors.dart';

final log = Logger('Exchange');

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
  Timer? _amountTimer;
  String _lastAmount = '';

  _ExchangeWidgetState();

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    // get value
    if (_amountController.text.isEmpty) return;
    var tryValue = Decimal.tryParse(_amountController.text.trim());
    // check value is valid
    if (tryValue == null || tryValue <= Decimal.zero) {
      snackMsg(context, 'invalid amount', category: MessageCategory.Warning);
      return;
    }
    var value = tryValue;
    value = assetAmountFromUser(_fromAsset, value);
    // get user balance
    var resb = await beBalances();
    resb.when((balances) {
      for (var bal in balances)
        if (bal.asset == _fromAsset) if (bal.available < value) {
          value = bal.available;
          _amountController.text = value.toString();
          snackMsg(context, 'adjusted amount to available balance',
              category: MessageCategory.Warning);
        }
    }, error: (err) => log.severe('failed to get user balances $err'));
    // check market is valid
    BeMarket? tryMarket;
    BeMarketSide side = BeMarketSide.ask;
    for (var item in _markets) {
      if ('$_fromAsset-$_toAsset' == item.symbol) {
        tryMarket = item;
        side = BeMarketSide.ask;
        break;
      }
      if ('$_toAsset-$_fromAsset' == item.symbol) {
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
    var quote = res.when<QuoteTotalPrice?>((orderbook) {
      switch (side) {
        case BeMarketSide.bid:
          // first do a basic estimate amount of base asset we will get using the order book
          var quoteAssetAmount = roundAt(value, assetDecimals(_fromAsset));
          var estimate = bidEstimateAmountFromQuoteAssetAmount(
              market, orderbook, quoteAssetAmount);
          if (estimate.errMsg != null) {
            // give user an idea of the estimate if we abort early
            if (estimate.amountBaseAsset != Decimal.zero)
              _receiveController.text = assetFormat(_toAsset,
                  assetAmountToUser(_toAsset, estimate.amountBaseAsset));
            return estimate;
          }
          // find the `smallestAmount` using the number of decimal places in the asset
          var smallestAmount =
              Decimal.one / power(Decimal.fromInt(10), assetDecimals(_toAsset));
          // set an initial `adjustAmount` that we will adjust the estimate each loop
          var adjustAmount = smallestAmount * Decimal.fromInt(100);
          // create our first estimate input
          var estInput =
              roundAt(estimate.amountBaseAsset, assetDecimals(_toAsset));
          // now create our first real estimate using the same method as the server
          //   ie. walk the order book using a set amount of the base asset and increase the quote asset required by the fee percentage
          estimate = bidQuoteAmount(market, orderbook, estInput);
          // now we loop as long as the server method estimate of the quote asset is not what we actually want to pay
          //   note: it should start as larger and we reduce it each loop iteration
          var n = 0;
          while (
              roundAt(estimate.amountQuoteAsset, assetDecimals(_fromAsset)) !=
                  quoteAssetAmount) {
            // adjust estimate input
            estInput -= adjustAmount;
            estInput = roundAt(estInput, assetDecimals(_toAsset));
            // generate new estimate
            estimate = bidQuoteAmount(market, orderbook, estInput);
            if (estimate.errMsg != null) {
              // give user an idea of the estimate if we abort early
              if (estimate.amountBaseAsset != Decimal.zero)
                _receiveController.text = assetFormat(_toAsset,
                    assetAmountToUser(_toAsset, estimate.amountBaseAsset));
              return estimate;
            }
            // if we overshoot we need to walk back the estimate input a bit
            if (estimate.amountQuoteAsset < quoteAssetAmount) {
              n = 0;
              estInput += adjustAmount *
                  Decimal.fromInt(
                      2); // twice because we reduced it at the start of the loop
              // if the adjustAmount is greater then the smallestAmount then we need to make it a bit more fine grained
              if (adjustAmount > smallestAmount) {
                adjustAmount = adjustAmount / Decimal.fromInt(2);
                if (adjustAmount < smallestAmount)
                  adjustAmount = smallestAmount;
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
              roundAt(
                  estimate.amountQuoteAsset, assetDecimals(market.quoteAsset)),
              estimate.errMsg);
        case BeMarketSide.ask:
          return askQuoteAmount(market, orderbook, value);
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
        _receiveController.text = assetFormat(
            _toAsset, assetAmountToUser(_toAsset, quote.amountBaseAsset));
        break;
      case BeMarketSide.ask:
        _receiveController.text = assetFormat(
            _toAsset, assetAmountToUser(_toAsset, quote.amountQuoteAsset));
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
    var from = Column(children: [
      SizedBox(
        width: 200,
        child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: bronzeGradient,
              borderRadius: BorderRadius.circular(10),
            ),
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
      SizedBox(height: 15),
      SizedBox(
          width: 200,
          child: TextField(
              controller: _amountController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixText: assetUnit(_fromAsset),
                  labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(
                  signed: false, decimal: true))),
    ]);
    var arrow = Container(
        margin: EdgeInsets.all(20),
        child: _calculating
            ? CircularProgressIndicator()
            : Icon(Icons.arrow_forward, color: ZapSecondary, size: 24));
    var arrowDown = Container(
        margin: EdgeInsets.all(20),
        child: _calculating
            ? CircularProgressIndicator()
            : Icon(Icons.arrow_downward, color: ZapSecondary, size: 24));
    var to = Column(children: [
      SizedBox(
          width: 200,
          child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: bronzeSecondaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
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
                              children: [
                                Text('  ' + e),
                                assetLogo(e, size: 24)
                              ]),
                          value: e))
                      .toList(),
                  value: _toAsset,
                  onChanged: _toChanged))),
      SizedBox(height: 15),
      SizedBox(
          width: 200,
          child: TextField(
              controller: _receiveController,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixText: assetUnit(_toAsset),
                  labelText: 'Receive')))
    ]);
    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 500)
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [from, arrowDown, to]);
        else
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [from, arrow, to]);
      }),
      _validAmount
          ? RoundedButton(_exchange, ZapOnSecondary, ZapSecondary,
              ZapSecondaryGradient, 'Create Order',
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
