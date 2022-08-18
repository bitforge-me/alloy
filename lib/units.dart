import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:rxdart/rxdart.dart';

import 'assets.dart';
import 'widgets.dart';
import 'beryllium.dart';

class CachedPrice {
  final DateTime updated;
  final Decimal rate;
  final bool invertedMarket;

  CachedPrice(this.updated, this.rate, this.invertedMarket);

  static String market(String assetBase, String assetQuote) {
    return '${assetBase}-${assetQuote}';
  }
}

class PriceRequest {
  final String assetBase;
  final String assetQuote;
  late final BehaviorSubject<CachedPrice?> _streamController;
  late final DateTime created;

  static List<BeMarket> _markets = [];

  PriceRequest(this.assetBase, this.assetQuote) {
    created = DateTime.now();
    _streamController = BehaviorSubject(onListen: _queryPrice);
  }

  void close() {
    _streamController.close();
  }

  Future<CachedPrice?> result() async {
    return await _streamController.stream.first;
  }

  void _queryPrice() async {
    if (_markets.isEmpty) {
      var res = await beMarkets();
      res.when((markets) => _markets = markets, error: (err) => null);
    }
    if (_markets.isEmpty) {
      _streamController.add(null);
      return;
    }
    // look for market
    var inverted = false;
    var market = CachedPrice.market(assetBase, assetQuote);
    if (!_markets.any((element) => element.symbol == market)) {
      inverted = true;
      market = CachedPrice.market(assetQuote, assetBase);
      if (!_markets.any((element) => element.symbol == market)) return null;
    }
    // if we have a market get the orderbook
    var res = await beOrderbook(market);
    _streamController.add(res.when((orderbook) {
      if (orderbook.asks.length > 0 && orderbook.bids.length > 0) {
        var price = CachedPrice(
            DateTime.now(),
            (orderbook.asks[0].rate + orderbook.bids[0].rate) /
                Decimal.fromInt(2),
            inverted);
        return price;
      }
      return null;
    }, error: (err) => null));
  }
}

class PriceManager {
  static Map<String, CachedPrice> _prices = {};
  static Map<String, PriceRequest> _priceRequests = {};

  static Future<CachedPrice?> _waitPrice(
      String assetBase, String assetQuote) async {
    var market = CachedPrice.market(assetBase, assetQuote);
    PriceRequest req;
    // get exisiting price request
    if (_priceRequests.containsKey(market)) {
      req = _priceRequests[market]!;
      // close and recreate if the request is old/stale
      if (req.created.add(Duration(seconds: 10)).isBefore(DateTime.now())) {
        req.close();
        _priceRequests.remove(market);
        req = PriceRequest(assetBase, assetQuote);
      }
    } else
      // make new request if none exists
      req = PriceRequest(assetBase, assetQuote);
    // store request for future caller
    _priceRequests[market] = req;
    // await the result of the price request
    var price = await req.result();
    if (price != null) _prices[market] = price;
    return price;
  }

  static Future<CachedPrice?> price(String assetBase, String assetQuote) async {
    var market = CachedPrice.market(assetBase, assetQuote);
    // get a cached price
    if (_prices.containsKey(market)) {
      var price = _prices[market]!;
      if (price.updated.add(Duration(minutes: 5)).isAfter(DateTime.now()))
        return price;
    }
    // if none exists (or has expired) then request a new price
    return await _waitPrice(assetBase, assetQuote);
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
  final String? pre;
  final String? post;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool twoLines;
  PriceEquivalent(this.asset, this.amount,
      {this.showAssetAmount = true,
      this.pre,
      this.post,
      this.textAlign,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.twoLines = false});

  @override
  State<PriceEquivalent> createState() => _PriceEquivalentState();
}

class _PriceEquivalentState extends State<PriceEquivalent> {
  CachedPrice? _price;
  String? _priceAsset;
  bool _failedToGetPrice = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _priceAsset = assetUnitToAsset(assetPricesUnit);
      _price = await PriceManager.price(widget.asset, _priceAsset!);
      if (_price == null) _failedToGetPrice = true;
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
      if (_failedToGetPrice) return SizedBox();
      if (_price == null || _priceAsset == null)
        return CircularProgressIndicator();
      text = _formattedPrice();
    } else {
      var assetAmount = widget.showAssetAmount
          ? assetFormatWithUnitToUser(widget.asset, widget.amount)
          : '';
      var startText = widget.pre != null ? '${widget.pre} ' : '';
      var endText = widget.post != null ? ' ${widget.post}' : '';
      if (assetPricesEnabled &&
          !_failedToGetPrice &&
          widget.asset != assetUnitToAsset(assetPricesUnit)) {
        if (widget.twoLines)
          text = '$assetAmount\n${_formattedPrice()}';
        else
          text = '$startText$assetAmount (${_formattedPrice()})$endText';
      } else
        text = '$startText$assetAmount$endText';
    }
    return Text(text,
        textAlign: widget.textAlign,
        style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.color));
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
          title: Text('Preferences'),
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
