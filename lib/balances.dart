import 'package:flutter/material.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';

class BalanceScreen extends StatefulWidget {
  final List<BeBalance> balances;
  final Websocket websocket;

  BalanceScreen(this.balances, this.websocket);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  Widget _listItem(BuildContext context, int n) {
    var balance = widget.balances[n];
    return ListTile(
        title: Text('${balance.asset}'),
        leading: assetLogo(balance.asset),
        subtitle: Text(
            'total: ${assetFormatWithUnit(balance.asset, assetAmountToUser(balance.asset, balance.total))}, available: ${assetFormatWithUnit(balance.asset, assetAmountToUser(balance.asset, balance.available))}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balances'),
      ),
      body: ListView.builder(
          itemBuilder: _listItem, itemCount: widget.balances.length),
    );
  }
}
