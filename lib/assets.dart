import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:decimal/decimal.dart';

import 'beryllium.dart';

String shortenStr(String? s) {
  if (s == null) return '';
  if (s.length <= 100) return s;
  return '${s.substring(0, 15)}.....${s.substring(s.length - 15)}';
}

String _svgAsset(String symbol) {
  switch (symbol) {
    case 'NZD':
      return 'assets/crypto_logos/nzd.svg';
    case 'BTC-LN':
      return 'assets/crypto_logos/bitcoin-lightning.svg';
    case 'BTC':
      return 'assets/crypto_logos/bitcoin.svg';
    case 'ETH':
      return 'assets/crypto_logos/ethereum.svg';
    case 'DOGE':
      return 'assets/crypto_logos/dogecoin.svg';
    case 'LTC':
      return 'assets/crypto_logos/litecoin.svg';
    case 'WAVES':
      return 'assets/crypto_logos/waves.svg';
  }
  return 'assets/crypto_logos/default.svg';
}

String assetStripUriPrefix(String asset, String? l2Network, String recipient) {
  if (asset == 'BTC') {
    if (l2Network == 'BTC-LN' && recipient.startsWith('lightning:'))
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
    case 'NZD':
      return 2;
    case 'BTC-LN':
    case 'BTC':
      return 8;
    case 'ETH':
      return 18;
    case 'DOGE':
      return 8;
    case 'LTC':
      return 8;
    case 'WAVES':
      return 8;
  }
  return -1;
}

bool assetIsCrypto(String asset) {
  switch (asset) {
    case 'BTC-LN':
    case 'BTC':
    case 'ETH':
    case 'DOGE':
    case 'LTC':
    case 'WAVES':
      return true;
  }
  return false;
}

String assetFormat(String symbol, Decimal amount) {
  var decimals = assetDecimals(symbol);
  if (decimals <= 0) return amount.toString();
  return amount.toStringAsFixed(decimals);
}

String? addressBlockExplorer(String symbol, bool testnet, String address) {
  switch (symbol) {
    case 'BTC':
      if (testnet) return 'https://blockstream.info/testnet/address/$address';
      return 'https://blockstream.info/address/$address';
    case 'ETH':
      if (testnet)
        return 'https://ropsten.etherscan.io/testnet/address/$address';
      return 'https://etherscan.io/address/$address';
    case 'DOGE':
      if (testnet) return null;
      return 'https://blockchair.com/dogecoin/address/$address';
    case 'LTC':
      if (testnet) return null;
      return 'https://blockchair.com/litecoin/address/$address';
    case 'WAVES':
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
