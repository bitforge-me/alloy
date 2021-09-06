import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'cryptocurrency.dart';
import 'prefs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'websocket.dart';
import 'utils.dart';

String findSvg(String asset) {
  String svgRes = 'assets/crypto_icons/Default.svg';
  switch (asset) {
    case 'BTC':
      svgRes = 'assets/crypto_icons/Bitcoin.svg';
      break;
    case 'ETH':
      svgRes = 'assets/crypto_icons/Ethereum.svg';
      break;
  }
  return svgRes;
}

Widget assetIcon(String asset, {EdgeInsetsGeometry? margin}) {
  return Container(
      margin: margin,
      width: 32,
      height: 32,
      child: Center(child: SvgPicture.asset(findSvg(asset))));
}

class AssetScreen extends StatelessWidget {
  final List<BeAsset> assets;

  AssetScreen(this.assets);

  Widget _listItem(BuildContext context, int n) {
    var asset = assets[n];
    return ListTile(
      title: Text('${asset.symbol}'),
      leading: assetIcon(asset.symbol),
      subtitle: Text(
          'name: ${asset.name}, status: ${asset.status}, minimum confirmations: ${asset.minConfs}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets'),
      ),
      body: ListView.builder(itemBuilder: _listItem, itemCount: assets.length),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final BeBrokerOrder order;
  final Websocket websocket;

  OrderScreen(this.order, this.websocket);

  @override
  State<OrderScreen> createState() => _OrderScreenState(order);
}

class _OrderScreenState extends State<OrderScreen> {
  BeBrokerOrder _order;
  var processOrderUpdates = true;

  _OrderScreenState(this._order);

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
    if (!processOrderUpdates) return;
    if (args == null) return;
    if (args.event == WebsocketEvent.brokerOrderUpdate) {
      var newOrder = BeBrokerOrder.parse(jsonDecode(args.msg));
      if (_order.token == newOrder.token) {
        setState(() => _order = newOrder);
        flushbarMsg(context,
            'broker order updated ${newOrder.token} - ${describeEnum(newOrder.status)}');
      }
    }
  }

  Future<void> _accept() async {
    processOrderUpdates = false;
    showAlertDialog(context, 'accepting..');
    var res = await beOrderAccept(_order.token);
    Navigator.pop(context);
    processOrderUpdates = true;
    if (res.error.type == ErrorType.None) {
      setState(() => _order = res.order);
      urlLaunch(_order.paymentUrl);
    } else
      alert(context, 'error', 'failed to accept order (${res.error.msg})');
  }

  Future<void> _update() async {
    processOrderUpdates = false;
    showAlertDialog(context, 'updating..');
    var res = await beOrderStatus(_order.token);
    Navigator.pop(context);
    processOrderUpdates = true;
    if (res.error.type == ErrorType.None) {
      setState(() => _order = res.order);
    } else
      alert(
          context, 'error', 'failed to update order status (${res.error.msg})');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order ${_order.token}'),
          actions: [assetIcon(_order.baseAsset, margin: EdgeInsets.all(10))],
        ),
        body: ListView(children: [
          ListTile(title: Text('Market'), subtitle: Text('${_order.market}')),
          ListTile(
              title: Text('Action'),
              subtitle: Text('${marketSideNice(_order.side)}')),
          ListTile(
              title: Text('Amount'),
              subtitle: Text('${_order.baseAmount} ${_order.baseAsset}')),
          ListTile(
              title: Text('Price'),
              subtitle: Text('${_order.quoteAmount} ${_order.quoteAsset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_order.date}')),
          _order.status == BeOrderStatus.created ||
                  _order.status == BeOrderStatus.ready
              ? ListTile(
                  title: Text('Expiry'), subtitle: Text('${_order.expiry}'))
              : SizedBox(),
          ListTile(
              title: Text('Recipient'), subtitle: Text('${_order.recipient}')),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${describeEnum(_order.status)}')),
          _order.paymentUrl != null
              ? ListTile(
                  title: Text('Payment URL'),
                  subtitle: Text('${_order.paymentUrl}'),
                  onTap: () => urlLaunch(_order.paymentUrl))
              : SizedBox(),
          _order.status == BeOrderStatus.created
              ? ListTile(
                  title:
                      raisedButton(onPressed: _accept, child: Text('Accept')))
              : SizedBox(),
          _order.status != BeOrderStatus.expired &&
                  _order.status != BeOrderStatus.cancelled &&
                  _order.status != BeOrderStatus.completed
              ? ListTile(
                  title:
                      raisedButton(onPressed: _update, child: Text('Update')))
              : SizedBox(),
          _order.status == BeOrderStatus.completed
              ? ListTile(
                  title: raisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('OK')))
              : SizedBox(),
        ]));
  }
}

class OrdersScreen extends StatefulWidget {
  final List<BeBrokerOrder> orders;
  final Websocket websocket;

  OrdersScreen(this.orders, this.websocket);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState(orders);
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<BeBrokerOrder> _orders;

  _OrdersScreenState(this._orders);

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
    if (args.event == WebsocketEvent.brokerOrderNew) {
      var newOrder = BeBrokerOrder.parse(jsonDecode(args.msg));
      _orders.insert(0, newOrder);
      setState(() => _orders = _orders);
      flushbarMsg(context,
          'broker order created ${newOrder.token} - ${describeEnum(newOrder.status)}');
    }
    if (args.event == WebsocketEvent.brokerOrderUpdate) {
      var newOrders = <BeBrokerOrder>[];
      var newOrder = BeBrokerOrder.parse(jsonDecode(args.msg));
      for (var order in _orders)
        if (order.token == newOrder.token)
          newOrders.add(newOrder);
        else
          newOrders.add(order);
      setState(() => _orders = newOrders);
      flushbarMsg(context,
          'broker order updated ${newOrder.token} - ${describeEnum(newOrder.status)}');
    }
  }

  Future<void> _orderTap(BeBrokerOrder order) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderScreen(order, widget.websocket)));
  }

  Widget _listItem(BuildContext context, int n) {
    var order = _orders[n];
    return ListTile(
        title: Text('${order.token}'),
        leading: assetIcon(order.baseAsset),
        subtitle: Text(
            '${order.market}, ${marketSideNice(order.side)}, ${order.baseAmount} ${order.baseAsset}, ${describeEnum(order.status)}',
            style: order.status == BeOrderStatus.expired ||
                    order.status == BeOrderStatus.cancelled
                ? TextStyle(color: ZapBlackLight)
                : order.status == BeOrderStatus.created ||
                        order.status == BeOrderStatus.ready
                    ? null
                    : TextStyle(color: ZapGreen)),
        onTap: () => _orderTap(order));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(itemBuilder: _listItem, itemCount: _orders.length),
    );
  }
}

class QuoteTotalPrice {
  final Decimal amount;
  final String? errMsg;

  QuoteTotalPrice(this.amount, this.errMsg);
}

class QuoteScreen extends StatefulWidget {
  final BeMarket market;
  final BeOrderbook orderbook;
  final Websocket websocket;

  QuoteScreen(this.market, this.orderbook, this.websocket);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _withdrawalAddressController = TextEditingController();
  final _withdrawalBankController = TextEditingController();

  var _quote = '-';
  var _amount = Decimal.zero;
  var _side = BeMarketSide.bid;
  var _address = '-';
  var _bank = '-';
  var _testnet = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _amountController.addListener(_updateQuote);
    _withdrawalAddressController.addListener(_updateAddress);
    _withdrawalBankController.addListener(_updateBank);

    // get testnet
    Prefs.testnetGet().then((value) => _testnet = value);
  }

  QuoteTotalPrice _bidQuoteAmount(Decimal amount) {
    if (amount < widget.orderbook.minOrder)
      return QuoteTotalPrice(Decimal.zero, 'amount too low');

    var amountTotal = amount + widget.orderbook.baseAssetWithdrawFee;
    var filled = Decimal.zero;
    var totalPrice = Decimal.zero;
    var n = 0;
    while (amountTotal > filled) {
      if (n >= widget.orderbook.asks.length) {
        break;
      }
      var rate = widget.orderbook.asks[n].rate;
      var quantity = widget.orderbook.asks[n].quantity;
      var quantityToUse = quantity;
      if (quantityToUse > amountTotal - filled)
        quantityToUse = amountTotal - filled;
      filled += quantityToUse;
      totalPrice += quantityToUse * rate;
      if (filled == amountTotal) {
        return QuoteTotalPrice(
            totalPrice *
                (Decimal.one +
                    widget.orderbook.brokerFee / Decimal.fromInt(100)),
            null);
      }
      n++;
    }
    return QuoteTotalPrice(Decimal.zero, 'not enough liquidity');
  }

  QuoteTotalPrice _askQuoteAmount(Decimal amount) {
    if (amount < widget.orderbook.minOrder)
      return QuoteTotalPrice(Decimal.zero, 'amount too low');

    // TODO - implement me
    return QuoteTotalPrice(Decimal.one, null);
  }

  void _updateSide(BeMarketSide side) {
    setState(() {
      _side = side;
      _updateQuote();
    });
  }

  void _updateQuote() {
    var quote = '-';
    var amount = Decimal.zero;
    var value = Decimal.tryParse(_amountController.text);
    if (value != null && value > Decimal.zero) {
      amount = value;
      QuoteTotalPrice totalPrice;
      switch (_side) {
        case BeMarketSide.bid:
          totalPrice = _bidQuoteAmount(value);
          break;
        case BeMarketSide.ask:
          totalPrice = _askQuoteAmount(value);
          break;
      }
      if (totalPrice.errMsg != null)
        quote = totalPrice.errMsg!;
      else
        quote =
            '$value ${widget.market.baseAsset} = ${totalPrice.amount} ${widget.market.quoteAsset}';
    }
    setState(() {
      _quote = quote;
      _amount = amount;
    });
  }

  void _updateAddress() {
    var addr = '-';
    var res = addressValidate(
        widget.market.baseAsset, _testnet, _withdrawalAddressController.text);
    if (res.result) addr = _withdrawalAddressController.text;
    setState(() => _address = addr);
  }

  void _updateBank() {
    var bank = '-';
    var res = bankValidate(_withdrawalBankController.text);
    if (res.result) bank = _withdrawalBankController.text;
    setState(() => _bank = bank);
  }

  void _orderCreate() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      showAlertDialog(context, 'creating order..');
      var res =
          await beOrderCreate(widget.market.symbol, _side, _amount, _address);
      Navigator.pop(context);
      if (res.error.type == ErrorType.None) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OrderScreen(res.order, widget.websocket)));
      } else
        alert(context, 'error', 'failed to create order (${res.error.msg})');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Order'),
          actions: [
            assetIcon(widget.market.baseAsset, margin: EdgeInsets.all(10))
          ],
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text(_quote),
                  Text(
                      'Send $_amount to ${_side == BeMarketSide.bid ? _address : _bank}'),
                  DropdownButtonFormField<BeMarketSide>(
                      value: _side,
                      items: BeMarketSide.values
                          .map((e) => DropdownMenuItem<BeMarketSide>(
                              value: e, child: Text(marketSideNice(e))))
                          .toList(),
                      onChanged: (value) => _updateSide(value!)),
                  TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter a value';
                        var d = Decimal.tryParse(value);
                        if (d == null) return 'Invalid value';
                        if (d <= Decimal.fromInt(0))
                          return 'Please enter a value greater then 0';
                        QuoteTotalPrice totalPrice;
                        switch (_side) {
                          case BeMarketSide.bid:
                            totalPrice = _bidQuoteAmount(d);
                            break;
                          case BeMarketSide.ask:
                            totalPrice = _askQuoteAmount(d);
                            break;
                        }
                        if (totalPrice.errMsg != null) return totalPrice.errMsg;
                        return null;
                      }),
                  Visibility(
                      visible: _side == BeMarketSide.bid,
                      child: TextFormField(
                          controller: _withdrawalAddressController,
                          decoration:
                              InputDecoration(labelText: 'Wallet Address'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = addressValidate(
                                widget.market.baseAsset, _testnet, value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                  Visibility(
                      visible: _side == BeMarketSide.ask,
                      child: TextFormField(
                          controller: _withdrawalBankController,
                          decoration:
                              InputDecoration(labelText: 'Bank Account'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a value';
                            var res = bankValidate(value);
                            if (!res.result) return res.reason;
                            return null;
                          })),
                  raisedButton(
                      onPressed: _orderCreate, child: Text('Create Order'))
                ]))));
  }
}

class MarketScreen extends StatefulWidget {
  final List<BeMarket> markets;
  final Websocket websocket;

  MarketScreen(this.markets, this.websocket);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  Future<void> _marketTap(BeMarket market) async {
    showAlertDialog(context, 'querying..');
    var res = await beOrderbook(market.symbol);
    Navigator.pop(context);
    if (res.error.type == ErrorType.None) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  QuoteScreen(market, res.orderbook, widget.websocket)));
    }
  }

  Widget _listItem(BuildContext context, int n) {
    var market = widget.markets[n];
    return ListTile(
        title: Text('${market.symbol}'),
        leading: assetIcon(market.baseAsset),
        subtitle: Text('status: ${market.status}'),
        onTap: () => _marketTap(market));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markets'),
      ),
      body: ListView.builder(
          itemBuilder: _listItem, itemCount: widget.markets.length),
    );
  }
}
