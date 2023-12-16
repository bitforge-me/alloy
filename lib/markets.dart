import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
import 'orders.dart';
import 'snack.dart';
import 'quote.dart';
import 'widgets.dart';

class AddressBookScreen extends StatefulWidget {
  final BeAsset asset;
  final List<BeAddressBookEntry> entries;

  AddressBookScreen(this.asset, this.entries);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState(asset);
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  late final String addressBookName;

  _AddressBookScreenState(BeAsset asset) {
    addressBookName = asset.isCrypto ? 'Address Book' : 'Saved Bank Accounts';
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _entryTap(BeAddressBookEntry entry) async {
    Navigator.pop<BeAddressBookEntry>(context, entry);
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
          title: Text('$addressBookName - ${widget.asset.symbol}'),
          actions: [
            assetLogo(widget.asset.symbol, margin: EdgeInsets.all(10))
          ]),
      body: BitforgePage(
          child: ListView.builder(
              itemBuilder: _listItem, itemCount: widget.entries.length)),
    );
  }
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
          totalPrice = bidQuoteAmount(widget.market, widget.orderbook, value);
          break;
        case BeMarketSide.ask:
          totalPrice = askQuoteAmount(widget.market, widget.orderbook, value);
          break;
      }
      if (totalPrice.errMsg != null)
        quote = totalPrice.errMsg!;
      else {
        var baseAmount =
            assetFormatWithUnitToUser(widget.market.baseAsset, value);
        var quoteAmount = assetFormatWithUnitToUser(
            widget.market.quoteAsset, totalPrice.amountQuoteAsset);
        quote = '$baseAmount = $quoteAmount';
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
              'failed to create order (${BeError.msg(err)})'));
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
                            totalPrice = bidQuoteAmount(
                                widget.market, widget.orderbook, d);
                            break;
                          case BeMarketSide.ask:
                            totalPrice = askQuoteAmount(
                                widget.market, widget.orderbook, d);
                            break;
                        }
                        if (totalPrice.errMsg != null) return totalPrice.errMsg;
                        return null;
                      }),
                  VerticalSpacer(),
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
        error: (err) => snackMsg(context, 'failed to get orderbook',
            category: MessageCategory.Warning));
  }

  Widget _listItem(BuildContext context, int n) {
    var market = widget.markets[n];
    return ListTile(
        title: Text('${market.symbol}'),
        leading: assetLogo(market.baseAsset),
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
