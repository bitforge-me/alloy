import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'utils.dart';
import 'assets.dart';

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
  var _testnet = false;

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
            'broker order updated ${newOrder.token} - ${describeEnum(newOrder.status).toUpperCase()}');
      }
    }
  }

  void _addrLaunch() {
    var url =
        addressBlockExplorer(_order.baseAsset, _testnet, _order.recipient);
    if (url == null) return;
    urlLaunch(url);
  }

  Future<void> _accept() async {
    processOrderUpdates = false;
    showAlertDialog(context, 'accepting..');
    var res = await beOrderAccept(_order.token);
    Navigator.pop(context);
    processOrderUpdates = true;
    if (res.error.type == ErrorType.None)
      setState(() => _order = res.order);
    else
      alert(context, 'error', 'failed to accept order (${res.error.msg})');
  }

  Future<void> _update() async {
    processOrderUpdates = false;
    showAlertDialog(context, 'updating..');
    var res = await beOrderStatus(_order.token);
    Navigator.pop(context);
    processOrderUpdates = true;
    if (res.error.type == ErrorType.None)
      setState(() => _order = res.order);
    else
      alert(
          context, 'error', 'failed to update order status (${res.error.msg})');
  }

  @override
  Widget build(BuildContext context) {
    var baseAmount = assetFormat(_order.baseAsset, _order.baseAmount);
    var quoteAmount = assetFormat(_order.quoteAsset, _order.quoteAmount);
    return Scaffold(
        appBar: AppBar(
          title: Text('Order ${_order.token}'),
          actions: [assetLogo(_order.baseAsset, margin: EdgeInsets.all(10))],
        ),
        body: ListView(children: [
          ListTile(
              title: Text('Market'),
              subtitle: Text(
                  '${_order.market} - ${marketSideNice(_order.side)} $baseAmount ${_order.baseAsset}')),
          ListTile(
              title: Text('Price'),
              subtitle: Text(
                  '$baseAmount ${_order.baseAsset} for $quoteAmount ${_order.quoteAsset}')),
          ListTile(title: Text('Date'), subtitle: Text('${_order.date}')),
          _order.status == BeOrderStatus.created ||
                  _order.status == BeOrderStatus.ready
              ? ListTile(
                  title: Text('Expiry'), subtitle: Text('${_order.expiry}'))
              : SizedBox(),
          ListTile(
              title: Text('Recipient'),
              subtitle: Text('${_order.recipient}'),
              onTap: _addrLaunch),
          ListTile(
              title: Text('Status'),
              subtitle: Text('${describeEnum(_order.status).toUpperCase()}')),
          _order.paymentUrl != null && _order.status == BeOrderStatus.ready
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
          'broker order created ${newOrder.token} - ${describeEnum(newOrder.status).toUpperCase()}');
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
          'broker order updated ${newOrder.token} - ${describeEnum(newOrder.status).toUpperCase()}');
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
    var baseAmount = assetFormat(order.baseAsset, order.baseAmount);
    return ListTile(
        title: Text('${order.token}'),
        leading: assetLogo(order.baseAsset),
        subtitle: Text(
            '${order.market} - ${marketSideNice(order.side)} $baseAmount ${order.baseAsset} - ${describeEnum(order.status).toUpperCase()}',
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
