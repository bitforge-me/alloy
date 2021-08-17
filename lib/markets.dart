import 'package:flutter/material.dart';

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

class MarketScreen extends StatelessWidget {
  final List<ZcMarket> markets;

  MarketScreen(this.markets);

  Widget _listItem(BuildContext context, int n) {
    var market = markets[n];
    return ListTile(
        title: Text('${market.symbol}'),
        subtitle:
            Text('status: ${market.status}, min trade: ${market.minTrade}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: _listItem, itemCount: markets.length),
    );
  }
}
