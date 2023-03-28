import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:zapdart/utils.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
//import 'markets.dart';
import 'snack.dart';
import 'paginator.dart';
import 'widgets.dart';
import 'config.dart' as cfg;

class OrderFees extends StatelessWidget {
  final BeBrokerOrder? order;
  final bool centerText;

  OrderFees(this.order, {this.centerText = false});

  String? exchangeFee() {
    if (order != null && order!.quoteFee != null)
      return assetFormatWithUnitToUser(order!.quoteAsset, order!.quoteFee!);
    return null;
  }

  String? processingFee() {
    if (order != null && order!.quoteFeeFixed != null)
      return assetFormatWithUnitToUser(
          order!.quoteAsset, order!.quoteFeeFixed!);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: cfg.ButtonWidth,
        child: Text(
            'Exchange Fee: ${exchangeFee()}\nProcessing Fee: ${processingFee()}',
            style: TextStyle(color: ZapOnBackgroundLight, fontSize: 10),
            textAlign: centerText ? TextAlign.center : TextAlign.start));
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
      var newOrder = BeBrokerOrder.fromJson(jsonDecode(args.msg));
      if (_order.token == newOrder.token) {
        setState(() => _order = newOrder);
        snackMsg(context,
            'broker order updated ${newOrder.token} - ${describeEnum(newOrder.status).toUpperCase()}');
      }
    }
  }

  Future<void> _accept() async {
    processOrderUpdates = false;
    showAlertDialog(context, 'accepting..');
    var res = await beOrderAccept(_order.token);
    Navigator.pop(context);
    processOrderUpdates = true;
    res.when((order) => setState(() => _order = order),
        error: (err) => alert(
            context, 'error', 'failed to accept order (${BeError.msg(err)})'));
  }

  @override
  Widget build(BuildContext context) {
    var baseAmount =
        assetFormatWithUnitToUser(_order.baseAsset, _order.baseAmount);
    var quoteAmount =
        assetFormatWithUnitToUser(_order.quoteAsset, _order.quoteAmount);
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Information'),
          actions: [assetLogo(_order.baseAsset, margin: EdgeInsets.all(10))],
        ),
        body: BitforgePage(
            child: ListView(children: [
          ListTile(
              title: Text('Market'),
              subtitle: Text(
                  '${_order.market} - ${marketSideNice(_order.side)} $baseAmount')),
          ListTile(
              title: Text('Price'),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$baseAmount for $quoteAmount'),
                    OrderFees(_order)
                  ])),
          ListTile(title: Text('Date'), subtitle: Text('${_order.date}')),
          _order.status == BeOrderStatus.created ||
                  _order.status == BeOrderStatus.ready
              ? ListTile(
                  title: Text('Expiry'), subtitle: Text('${_order.expiry}'))
              : SizedBox(),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${describeEnum(_order.status).toUpperCase()}')),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _order.status == BeOrderStatus.created
                    ? BronzeRoundedButton(_accept, ZapOnPrimary, ZapPrimary,
                        ZapPrimaryGradient, 'Accept',
                        fwdArrow: true,
                        width: cfg.ButtonWidth,
                        height: cfg.ButtonHeight)
                    : SizedBox(),
                BronzeRoundedButton(() {
                  Navigator.pop(context);
                }, ZapOnSurface, ZapSurface, null, 'Close',
                    width: cfg.ButtonWidth, height: cfg.ButtonHeight)
              ])
        ])));
  }
}

class OrdersScreen extends StatefulWidget {
  final Websocket websocket;

  OrdersScreen(this.websocket);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<BeBrokerOrder> _orders = [];
  final int _itemsPerPage = 10;
  int _pageNumber = 0;
  int _pageCount = 0;

  _OrdersScreenState();

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initOrders(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  Future<void> _initOrders(int pageNumber) async {
    showAlertDialog(context, 'querying..');
    var res = await beOrderList(pageNumber * _itemsPerPage, _itemsPerPage);
    Navigator.pop(context);
    res.when(
        (orders, offset, limit, total) => setState(() {
              _orders = orders;
              _pageNumber = pageNumber;
              _pageCount = (total / _itemsPerPage).ceil();
            }),
        error: (err) => alert(
            context, 'error', 'failed to query orders (${BeError.msg(err)})'));
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    var orders = _orders.toList();
    if (args.event == WebsocketEvent.brokerOrderNew) {
      var newOrder = BeBrokerOrder.fromJson(jsonDecode(args.msg));
      if (_pageNumber == 0) {
        orders.insert(0, newOrder);
        if (orders.length > _itemsPerPage) orders.removeLast();
        setState(() => _orders = orders);
      }
      snackMsg(context,
          'broker order created ${newOrder.token} - ${describeEnum(newOrder.status).toUpperCase()}');
    }
    if (args.event == WebsocketEvent.brokerOrderUpdate) {
      var updatedOrder = BeBrokerOrder.fromJson(jsonDecode(args.msg));
      for (var i = 0; i < orders.length; i++) {
        var order = orders[i];
        if (updatedOrder.token == order.token) {
          orders[i] = updatedOrder;
          setState(() => _orders = orders);
          snackMsg(context, 'broker order updated ${updatedOrder.token}');
          break;
        }
      }
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
    var content = Row(children: [
      assetLogo(order.baseAsset),
      SizedBox(width: 5),
      Text(describeEnum(order.status).toUpperCase())
    ]);
    return ListTx(
        () => _orderTap(order),
        order.date,
        content,
        order.baseAmount,
        order.baseAsset,
        order.side == BeMarketSide.ask ? ListTxDir.up : ListTxDir.down,
        last: n == _orders.length - 1);
  }

/*
  Future<void> _actionButtonTap() async {
    showAlertDialog(context, 'querying..');
    var res = await beMarkets();
    Navigator.pop(context);
    res.when(
        (markets) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MarketScreen(markets, widget.websocket))),
        error: (err) => snackMsg(context, 'failed to query markets',
            category: MessageCategory.Warning));
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: BitforgePage(
            child: _orders.length == 0
                ? Container(
                    margin: EdgeInsets.all(20),
                    child: Center(child: Text('No orders')))
                : ListView.builder(
                    itemBuilder: _listItem, itemCount: _orders.length)),
        /*
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: _actionButtonTap),
        */
        bottomNavigationBar: _pageCount > 0
            ? Paginator(_pageCount, _pageNumber, (n) => _initOrders(n))
            : null);
  }
}
