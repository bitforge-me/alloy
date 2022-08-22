import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:decimal/decimal.dart';

import 'beryllium.dart';
import 'prefs.dart';

const String Nzd = 'NZD';
const String Cents = 'cents';
const String Btc = 'BTC';
const String BtcLn = 'BTC-LN';
const String Sats = 'sats';
const String Usdt = 'USDT';
const String Usdc = 'USDC';
const String Eth = 'ETH';
const String Gwei = 'gwei';
const String Doge = 'DOGE';
const String Ltc = 'LTC';
const String Waves = 'WAVES';

var assetPricesEnabled = true;
var assetPricesUnit = Nzd;
var assetUnits = {
  Nzd: Nzd,
  Btc: Sats,
  /*
  Usdt: Usdt,
  Usdc: Usdc,
  Eth: Gwei,
  Doge: Doge,
  Ltc: Ltc,
  Waves: Waves
  */
};

String shortenStr(String? s) {
  if (s == null) return '';
  if (s.length <= 100) return s;
  return '${s.substring(0, 15)}.....${s.substring(s.length - 15)}';
}

String _svgAsset(String symbol) {
  switch (symbol) {
    case Nzd:
      return 'assets/crypto_logos/nzd.svg';
    case BtcLn:
      return 'assets/crypto_logos/bitcoin-lightning.svg';
    case Btc:
      return 'assets/crypto_logos/bitcoin.svg';
    case Usdt:
      return 'assets/crypto_logos/usdt.svg';
    case Usdc:
      return 'assets/crypto_logos/usdc.svg';
    case Eth:
      return 'assets/crypto_logos/ethereum.svg';
    case Doge:
      return 'assets/crypto_logos/dogecoin.svg';
    case Ltc:
      return 'assets/crypto_logos/litecoin.svg';
    case Waves:
      return 'assets/crypto_logos/waves.svg';
  }
  return 'assets/crypto_logos/default.svg';
}

String assetStripUriPrefix(String asset, String? l2Network, String recipient) {
  if (asset == Btc) {
    if (l2Network == BtcLn && recipient.startsWith('lightning:'))
      return recipient.substring('lightning:'.length);
    else if (l2Network == null && recipient.startsWith('bitcoin:'))
      return recipient.substring('bitcoin:'.length);
  }
  return recipient;
}

Widget assetLogo(String symbol,
    {EdgeInsetsGeometry? margin, double size = 32}) {
  return Container(
      margin: margin,
      width: size,
      height: size,
      child: Center(child: SvgPicture.asset(_svgAsset(symbol))));
}

LinearGradient assetGradient(String symbol) {
  switch (symbol) {
    case Nzd:
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff182848),
          Color(0xff4b6cb7),
        ],
      );
    case Btc:
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xfff46b45), Color(0xffeea849)],
      );
  }
  return LinearGradient(colors: [Colors.white, Colors.grey]);
}

String assetBackgroundPng(String symbol) {
  switch (symbol) {
    case Nzd:
      return 'crypto_logos/southern-cross.png';
    case Btc:
      return 'crypto_logos/bitcoin-white.png';
  }
  return 'crypto_logos/default-background.png';
}

int assetDecimals(String symbol) {
  switch (symbol) {
    case Nzd:
      return 2;
    case Cents:
      return 0;
    case BtcLn:
    case Btc:
      return 8;
    case Sats:
      return 0;
    case Usdt:
      return 2;
    case Usdc:
      return 2;
    case Eth:
      return 18;
    case Gwei:
      return 9;
    case Doge:
      return 8;
    case Ltc:
      return 8;
    case Waves:
      return 8;
  }
  return -1;
}

bool assetIsCrypto(String asset) {
  switch (asset) {
    case BtcLn:
    case Btc:
    case Usdt:
    case Usdc:
    case Eth:
    case Doge:
    case Ltc:
    case Waves:
      return true;
  }
  return false;
}

String assetFormatUnit(String asset, String unit, Decimal amount) {
  amount = assetAmountToUnit(asset, unit, amount);
  var decimals = assetDecimals(unit);
  if (decimals <= 0) return amount.round().toString();
  return amount.toStringAsFixed(decimals);
}

String assetFormat(String symbol, Decimal amount) {
  var decimals = assetDecimals(assetUnit(symbol));
  if (decimals <= 0) return amount.round().toString();
  return amount.toStringAsFixed(decimals);
}

String _assetFormatWithUnit(String symbol, Decimal amount) {
  return '${assetFormat(symbol, amount)} ${assetUnit(symbol)}';
}

String assetFormatWithUnitToUser(String symbol, Decimal amount) {
  return '${_assetFormatWithUnit(symbol, assetAmountToUser(symbol, amount))}';
}

String assetUnit(String symbol) {
  if (assetUnits.keys.contains(symbol)) return assetUnits[symbol]!;
  return '!ERR!';
}

List<String> assetUnitOptions(String symbol) {
  switch (symbol) {
    case Nzd:
      return [Nzd, Cents];
    case Btc:
      return [Btc, Sats];
    case Eth:
      return [Eth, Gwei];
    case Usdt:
    case Usdc:
    case Doge:
    case Ltc:
    case Waves:
      return [symbol];
  }
  return [];
}

String assetUnitToAsset(String unit) {
  switch (unit) {
    case Nzd:
    case Cents:
      return Nzd;
    case Btc:
    case Sats:
      return Btc;
    case Eth:
    case Gwei:
      return Eth;
    case Usdt:
      return Usdt;
    case Usdc:
      return Usdc;
    case Doge:
      return Doge;
    case Ltc:
      return Ltc;
    case Waves:
      return Waves;
  }
  throw Exception('invalid asset unit');
}

Future<void> assetPricesEnabledSet(bool value) async {
  assetPricesEnabled = value;
  await Prefs.assetPriceUnitEnabledSet(value);
}

Future<bool> assetPricesEnabledGet(bool defaultVal) async {
  return await Prefs.assetPriceUnitEnabledGet(defaultVal);
}

Future<String> assetPricesGet(String defaultVal) async {
  var res = await Prefs.assetPriceUnitGet();
  if (res == null) return defaultVal;
  return res;
}

Future<void> assetPricesSet(String priceUnit) async {
  assetPricesUnit = priceUnit;
  await Prefs.assetPriceUnitSet(priceUnit);
}

Future<void> assetUnitSet(String symbol, String unit) async {
  if (assetUnitOptions(symbol).contains(unit)) {
    assetUnits[symbol] = unit;
    await Prefs.assetUnitSet(symbol, unit);
  }
}

Future<void> assetUnitsInit() async {
  assetPricesEnabled = await assetPricesEnabledGet(assetPricesEnabled);
  assetPricesUnit = await assetPricesGet(assetPricesUnit);
  for (var asset in assetUnits.keys)
    assetUnitSet(asset, await Prefs.assetUnitGet(asset, assetUnit(asset)));
}

Decimal assetAmountToUnit(String symbol, String unit, Decimal amount) {
  switch (symbol) {
    case Nzd:
      if (unit == Cents) return amount * Decimal.fromInt(100);
      return amount;
    case Btc:
      if (unit == Sats) return amount * Decimal.fromInt(100000000);
      return amount;
    case Eth:
      if (unit == Gwei) return amount * Decimal.fromInt(1000000000);
      return amount;
    case Usdt:
    case Usdc:
    case Doge:
    case Ltc:
    case Waves:
      return amount;
  }
  return -Decimal.one;
}

Decimal assetAmountToUser(String symbol, Decimal amount) {
  return assetAmountToUnit(symbol, assetUnit(symbol), amount);
}

Decimal assetAmountFromUser(String symbol, Decimal amount) {
  switch (symbol) {
    case Nzd:
      if (assetUnit(symbol) == Cents) return amount / Decimal.fromInt(100);
      return amount;
    case Btc:
      if (assetUnit(symbol) == Sats) return amount / Decimal.fromInt(100000000);
      return amount;
    case Eth:
      if (assetUnit(symbol) == Gwei)
        return amount / Decimal.fromInt(1000000000);
      return amount;
    case Usdt:
    case Usdc:
    case Doge:
    case Ltc:
    case Waves:
      return amount;
  }
  return -Decimal.one;
}

String? addressBlockExplorer(String symbol, bool testnet, String address) {
  switch (symbol) {
    case Btc:
      if (testnet) return 'https://blockstream.info/testnet/address/$address';
      return 'https://blockstream.info/address/$address';
    case Usdt:
    case Usdc:
    case Eth:
      if (testnet)
        return 'https://ropsten.etherscan.io/testnet/address/$address';
      return 'https://etherscan.io/address/$address';
    case Doge:
      if (testnet) return null;
      return 'https://blockchair.com/dogecoin/address/$address';
    case Ltc:
      if (testnet) return null;
      return 'https://blockchair.com/litecoin/address/$address';
    case Waves:
      if (testnet) return 'https://testnet.wavesexplorer.com/address/$address';
      return 'https://wavesexplorer.com/address/$address';
  }
  return null;
}

class AssetScreen extends StatelessWidget {
  final List<BeAsset> assets;

  AssetScreen(this.assets);

  Widget _listItem(BuildContext context, int n) {
    var asset = assets[n];
    return ListTile(
      title: Text('${asset.symbol}'),
      leading: assetLogo(asset.symbol),
      subtitle: Text('name: ${asset.name}'),
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
