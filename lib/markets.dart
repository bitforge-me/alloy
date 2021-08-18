import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';

import 'paydb.dart';

class AssetScreen extends StatelessWidget {
  final List<ZcAsset> assets;

  AssetScreen(this.assets);

  Widget _listItem(BuildContext context, int n) {
    var asset = assets[n];
    return ListTile(
        title: Text('${asset.symbol}'),
        subtitle: Text(
            'name: ${asset.name}, status: ${asset.status}, minimum confirmations: ${asset.minConfs}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: _listItem, itemCount: assets.length),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  final ZcMarket market;
  final ZcOrderbook orderbook;

  QuoteScreen(this.market, this.orderbook);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final amountController = TextEditingController();

  var _quote = '-';

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    amountController.addListener(_updateQuote);
  }

  void _updateQuote() {
    var quote = '-';
    var value = Decimal.tryParse(amountController.text);
    if (value != null && value > Decimal.zero) {
      var filled = Decimal.zero;
      var totalPrice = Decimal.zero;
      var n = 0;
      while (value > filled) {
        if (n >= widget.orderbook.asks.length) {
          quote = 'not enough liquidity';
          break;
        }
        var rate = widget.orderbook.asks[n].rate;
        var quantity = widget.orderbook.asks[n].quantity;
        var quantityToUse = quantity;
        if (quantityToUse > value - filled) quantityToUse = value - filled;
        filled += quantityToUse;
        totalPrice += quantityToUse * rate;
        if (filled == value) {
          quote =
              '$value ${widget.market.baseSymbol} = $totalPrice ${widget.market.quoteSymbol}';
          break;
        }
        n++;
      }
    }
    setState(() => _quote = quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Column(children: [
      TextFormField(
          controller: amountController,
          decoration: InputDecoration(labelText: 'Amount'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null) return 'Please enter a value';
            var d = Decimal.tryParse(value);
            if (d == null) return 'Invalid value';
            if (d <= Decimal.fromInt(0))
              return 'Please enter a value greater then 0';
            return null;
          }),
      Text(_quote)
    ])));
  }
}

class MarketScreen extends StatefulWidget {
  final List<ZcMarket> markets;

  MarketScreen(this.markets);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  Future<void> _marketTap(ZcMarket market) async {
    showAlertDialog(context, 'querying..');
    var res = await zcOrderbook(market.symbol);
    Navigator.pop(context);
    if (res.error == PayDbError.None) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuoteScreen(market, res.orderbook)));
    }
  }

  Widget _listItem(BuildContext context, int n) {
    var market = widget.markets[n];
    return ListTile(
        title: Text('${market.symbol}'),
        subtitle:
            Text('status: ${market.status}, min trade: ${market.minTrade}'),
        onTap: () => _marketTap(market));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: _listItem, itemCount: widget.markets.length),
    );
  }
}
