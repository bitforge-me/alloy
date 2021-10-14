import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
import 'orders.dart';

class AddressBookScreen extends StatefulWidget {
  final String asset;
  final List<BeAddressBookEntry> entries;

  AddressBookScreen(this.asset, this.entries);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _entryTap(BeAddressBookEntry entry) async {
    Navigator.pop<String>(context, entry.recipient);
  }

  Widget _listItem(BuildContext context, int n) {
    var entry = widget.entries[n];
    return ListTile(
        title: Text('${entry.recipient}'),
        subtitle: Text('${entry.date} - ${entry.description}'),
        onTap: () => _entryTap(entry));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Address Book - ${widget.asset}'),
          actions: [assetLogo(widget.asset, margin: EdgeInsets.all(10))]),
      body: ListView.builder(
          itemBuilder: _listItem, itemCount: widget.entries.length),
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

  var _quote = '-';
  var _amount = Decimal.zero;
  var _side = BeMarketSide.bid;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _amountController.addListener(_updateQuote);
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

    var amountTotal = amount;
    var filled = Decimal.zero;
    var totalPrice = Decimal.zero;
    var n = 0;
    while (amountTotal > filled) {
      if (n >= widget.orderbook.bids.length) {
        break;
      }
      var rate = widget.orderbook.bids[n].rate;
      var quantity = widget.orderbook.bids[n].quantity;
      var quantityToUse = quantity;
      if (quantityToUse > amountTotal - filled)
        quantityToUse = amountTotal - filled;
      filled += quantityToUse;
      totalPrice += quantityToUse * rate;
      if (filled == amountTotal) {
        return QuoteTotalPrice(
            totalPrice *
                    (Decimal.one -
                        widget.orderbook.brokerFee / Decimal.fromInt(100)) -
                widget.orderbook.quoteAssetWithdrawFee,
            null);
      }
      n++;
    }
    return QuoteTotalPrice(Decimal.zero, 'not enough liquidity');
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
    var value = Decimal.tryParse(_amountController.text.trim());
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
      else {
        var baseAmount = assetFormat(widget.market.baseAsset, value);
        var quoteAmount =
            assetFormat(widget.market.quoteAsset, totalPrice.amount);
        quote =
            '$baseAmount ${widget.market.baseAsset} = $quoteAmount ${widget.market.quoteAsset}';
      }
    }
    setState(() {
      _quote = quote;
      _amount = amount;
    });
  }

  void _orderCreate() async {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      showAlertDialog(context, 'creating order..');
      var res = await beOrderCreate(widget.market.symbol, _side, _amount);
      Navigator.pop(context);
      res.when(
          (order) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderScreen(order, widget.websocket))),
          error: (err) => alert(context, 'error',
              'failed to create order (${BeError2.msg(err)})'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Order'),
          actions: [
            assetLogo(widget.market.baseAsset, margin: EdgeInsets.all(10))
          ],
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        Text(_quote),
                  ])),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Radio<BeMarketSide>(
                      value: BeMarketSide.bid,
                      groupValue: _side,
                      onChanged: (value) => _updateSide(value!),
                    ),
                    Text('Buy'),
                    SizedBox(width: 20),
                    Radio<BeMarketSide>(
                      value: BeMarketSide.ask,
                      groupValue: _side,
                      onChanged: (value) => _updateSide(value!),
                    ),
                    Text('Sell')
                  ]),
                  TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter a value';
                        var d = Decimal.tryParse(value.trim());
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
    res.when(
        (orderbook) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    QuoteScreen(market, orderbook, widget.websocket))),
        error: (err) => flushbarMsg(context, 'failed to get orderbook',
            category: MessageCategory.Warning));
  }

  Widget _listItem(BuildContext context, int n) {
    var market = widget.markets[n];
    return ListTile(
        title: Text('${market.symbol}'),
        leading: assetLogo(market.baseAsset),
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
