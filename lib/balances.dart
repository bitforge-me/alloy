import 'package:flutter/material.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
import 'widgets.dart';

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
            'total: ${assetFormatWithUnitToUser(balance.asset, balance.total)}, available: ${assetFormatWithUnitToUser(balance.asset, balance.available)}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Balances'),
        ),
        body: BiforgePage(
          child: ListView.builder(
              itemBuilder: _listItem, itemCount: widget.balances.length),
        ));
  }
}
