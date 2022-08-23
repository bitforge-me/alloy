import 'package:flutter/material.dart';

import 'beryllium.dart';
import 'websocket.dart';
import 'assets.dart';
import 'widgets.dart';
import 'units.dart';
import 'config.dart' as cfg;

class BalanceScreen extends StatefulWidget {
  final List<BeBalance> balances;
  final Websocket websocket;

  BalanceScreen(this.balances, this.websocket);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  Widget _listItem(BuildContext context, int n) {
    return LayoutBuilder(builder: (context, constraints) {
      var balance = widget.balances[n];
      var total = PriceEquivalent(balance.asset, balance.total, pre: 'Total:');
      var available =
          PriceEquivalent(balance.asset, balance.available, pre: 'Available:');
      return ListTile(
          title: Text('${balance.asset}'),
          leading: assetLogo(balance.asset),
          subtitle: constraints.maxWidth < cfg.MaxColumnWidth
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [total, available])
              : Row(children: [SizedBox(width: 300, child: total), available]));
    });
  }

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
