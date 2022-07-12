import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'assets.dart';
import 'widgets.dart';
import 'beryllium.dart';

class CachedPrice {
  final DateTime updated;
  final Decimal rate;
  final bool invertedMarket;

  CachedPrice(this.updated, this.rate, this.invertedMarket);
}

class PriceManager {
  static Map<String, CachedPrice> _prices = {};
  static List<BeMarket> _markets = [];

  static String _market(String assetBase, String assetQuote) {
    return '${assetBase}-${assetQuote}';
  }

  static Future<CachedPrice?> _queryPrice(
      String assetBase, String assetQuote) async {
    if (_markets.isEmpty) {
      var res = await beMarkets();
      res.when((markets) => _markets = markets, error: (err) => null);
    }
    if (_markets.isEmpty) return null;
    // look for market
    var inverted = false;
    var market = _market(assetBase, assetQuote);
    if (!_markets.any((element) => element.symbol == market)) {
      inverted = true;
      market = _market(assetQuote, assetBase);
      if (!_markets.any((element) => element.symbol == market)) return null;
    }
    // if we have a market get the orderbook
    var res = await beOrderbook(market);
    return res.when((orderbook) {
      if (orderbook.asks.length > 0 && orderbook.bids.length > 0) {
        var price = CachedPrice(
            DateTime.now(),
            (orderbook.asks[0].rate + orderbook.bids[0].rate) /
                Decimal.fromInt(2),
            inverted);
        _prices[market] = price; // update cache
        return price;
      }
      return null;
    }, error: (err) => null);
  }

  static Future<CachedPrice?> price(String assetBase, String assetQuote) async {
    var market = _market(assetBase, assetQuote);
    if (_prices.containsKey(market)) {
      var price = _prices[market]!;
      if (price.updated.add(Duration(minutes: 5)).isAfter(DateTime.now()))
        return price;
    }
    var price = await _queryPrice(assetBase, assetQuote);
    return price;
  }

  static bool showPriceFor(String asset) {
    var priceAsset = assetUnitToAsset(assetPricesUnit);
    return priceAsset != asset;
  }
}

class PriceEquivalent extends StatefulWidget {
  final String asset;
  final Decimal amount;
  final bool showAssetAmount;
  final String? extra;
  final TextAlign? textAlign;
  PriceEquivalent(this.asset, this.amount,
      {this.showAssetAmount = true, this.extra, this.textAlign});

  @override
  State<PriceEquivalent> createState() => _PriceEquivalentState();
}

class _PriceEquivalentState extends State<PriceEquivalent> {
  CachedPrice? _price;
  String? _priceAsset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _priceAsset = assetUnitToAsset(assetPricesUnit);
      _price = await PriceManager.price(widget.asset, _priceAsset!);
      setState(() {}); // rerender
    });
  }

  String _formattedPrice() {
    if (_price == null || _priceAsset == null) return '...';
    Decimal price;
    if (_price!.invertedMarket)
      price = widget.amount / _price!.rate;
    else
      price = widget.amount * _price!.rate;
    return '~${assetFormatUnit(_priceAsset!, assetPricesUnit, price)} $assetPricesUnit';
  }

  @override
  Widget build(BuildContext context) {
    String text;
    if (!widget.showAssetAmount) {
      if (_price == null || _priceAsset == null)
        return CircularProgressIndicator();
      text = _formattedPrice();
    } else {
      var assetAmount = widget.showAssetAmount
          ? assetFormatWithUnitToUser(widget.asset, widget.amount)
          : '';
      var endText = widget.extra != null ? ' ${widget.extra}' : '';
      if (assetPricesEnabled &&
          widget.asset != assetUnitToAsset(assetPricesUnit))
        text = '$assetAmount (${_formattedPrice()})$endText';
      else
        text = '$assetAmount$endText';
    }
    return Text(text, textAlign: widget.textAlign);
  }
}

class UnitSelector extends StatelessWidget {
  final String asset;
  final String selectedUnit;
  final void Function(String, String)? onSelect;
  late final List<String> unitOptions;

  UnitSelector(this.asset, this.selectedUnit, {this.onSelect}) {
    unitOptions = assetUnitOptions(asset);
  }

  void onPressed(int index) {
    if (onSelect != null) onSelect!(asset, unitOptions[index]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [];
    List<bool> isSelected = [];
    unitOptions.forEach((t) {
      options.add(Text(t));
      isSelected.add(t == selectedUnit);
    });
    return ToggleButtons(
      children: options,
      onPressed: onSelect != null ? onPressed : null,
      isSelected: isSelected,
    );
  }
}

class UnitsScreen extends StatefulWidget {
  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  late final List<DropdownMenuItem<String>> assetsDropdownItems = [];

  _UnitsScreenState() {
    assetUnits.keys.forEach((asset) {
      var options = assetUnitOptions(asset);
      options.forEach((o) => assetsDropdownItems
          .add(DropdownMenuItem<String>(value: o, child: Text(o))));
    });
  }

  void onAssetPriceChanged(String? value) {
    if (value == null) return;
    assetPricesSet(value).then((_) {
      setState(() {}); // force rerender
    });
  }

  void onAssetPricesChecked(bool? value) {
    if (value == null) return;
    assetPricesEnabledSet(value).then((_) {
      setState(() {}); // force rerender
    });
  }

  void onUnitSelect(String asset, String newUnit) {
    assetUnitSet(asset, newUnit).then((_) {
      setState(() {}); // force rerender
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Units'),
        ),
        body: BiforgePage(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              VerticalSpacer(),
              Text('Estimated Market Value'),
              VerticalSpacer(),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show estimated market value:'),
                    Checkbox(
                        value: assetPricesEnabled,
                        onChanged: onAssetPricesChecked),
                    SizedBox(width: 20),
                    Text('Market value currency:'),
                    SizedBox(width: 5),
                    DropdownButton<String>(
                        items: assetsDropdownItems,
                        onChanged: onAssetPriceChanged,
                        value: assetPricesUnit)
                  ]),
              VerticalSpacer(),
              Text('Currency Units'),
              VerticalSpacer(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: assetUnits.length,
                  itemBuilder: (context, index) {
                    var asset = assetUnits.keys.elementAt(index);
                    var unit = assetUnits[asset]!;
                    return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          assetLogo(asset),
                          SizedBox(width: 10),
                          UnitSelector(asset, unit, onSelect: onUnitSelect)
                        ]);
                  })
            ])));
  }
}
