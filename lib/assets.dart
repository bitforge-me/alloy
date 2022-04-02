import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:decimal/decimal.dart';

import 'beryllium.dart';
import 'prefs.dart';

const String Nzd = 'NZD';
const String Btc = 'BTC';
const String BtcLn = 'BTC-LN';
const String Sats = 'sats';
const String Eth = 'ETH';
const String Gwei = 'gwei';
const String Doge = 'DOGE';
const String Ltc = 'LTC';
const String Waves = 'WAVES';

var assetUnits = {
  Nzd: Nzd,
  Btc: Sats,
  Eth: Gwei,
  Doge: Doge,
  Ltc: Ltc,
  Waves: Waves
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

int assetDecimals(String symbol) {
  switch (symbol) {
    case Nzd:
      return 2;
    case BtcLn:
    case Btc:
      return 8;
    case Btc:
      return 0;
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
    case Eth:
    case Doge:
    case Ltc:
    case Waves:
      return true;
  }
  return false;
}

String assetFormat(String symbol, Decimal amount) {
  var decimals = assetDecimals(assetUnit(symbol));
  if (decimals <= 0) return amount.round().toString();
  return amount.toStringAsFixed(decimals);
}

String assetFormatWithUnit(String symbol, Decimal amount) {
  return '${assetFormat(symbol, amount)} ${assetUnit(symbol)}';
}

String assetUnit(String symbol) {
  if (assetUnits.keys.contains(symbol)) return assetUnits[symbol]!;
  return '!ERR!';
}

List<String> assetUnitOptions(String symbol) {
  switch (symbol) {
    case Nzd:
      return [symbol];
    case Btc:
      return [Btc, Sats];
    case Eth:
      return [Eth, Gwei];
    case Doge:
    case Ltc:
    case Waves:
      return [symbol];
  }
  return [];
}

void assetUnitSet(String symbol, String unit) {
  if (assetUnitOptions(symbol).contains(unit)) {
    assetUnits[symbol] = unit;
    Prefs.assetUnitSet(symbol, unit);
  }
}

Future<void> assetUnitsInit() async {
  for (var asset in assetUnits.keys)
    assetUnitSet(asset, await Prefs.assetUnitGet(asset, assetUnit(asset)));
}

Decimal assetAmountToUser(String symbol, Decimal amount) {
  switch (symbol) {
    case Nzd:
      return amount;
    case Btc:
      if (assetUnit(symbol) == Sats) return amount * Decimal.fromInt(100000000);
      return amount;
    case Eth:
      if (assetUnit(symbol) == Gwei)
        return amount * Decimal.fromInt(1000000000);
      return amount;
    case Doge:
    case Ltc:
    case Waves:
      return amount;
  }
  return -Decimal.one;
}

Decimal assetAmountFromUser(String symbol, Decimal amount) {
  switch (symbol) {
    case Nzd:
      return amount;
    case Btc:
      if (assetUnit(symbol) == Sats) return amount / Decimal.fromInt(100000000);
      return amount;
    case Eth:
      if (assetUnit(symbol) == Gwei)
        return amount / Decimal.fromInt(1000000000);
      return amount;
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
