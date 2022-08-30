import 'package:alloy/websocket.dart';
import 'package:flutter/material.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';

import 'widgets.dart';
import 'beryllium.dart';
import 'deposit.dart';
import 'snack.dart';

class AutobuyButton extends StatelessWidget {
  final BeAsset asset;
  final BeAsset autobuyAsset;
  final Websocket websocket;

  AutobuyButton(this.asset, this.autobuyAsset, this.websocket);

  void onPressed(BuildContext context) async {
    showAlertDialog(context, 'querying..');
    var res = await beFiatDepositAutobuy(autobuyAsset.symbol);
    Navigator.pop(context);
    res.when(
        (deposit) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FiatAccountNumberScreen(
                    asset, deposit, websocket,
                    extraInfo:
                        'Any deposits made using this specific code will automatically be used to create an order to buy ${autobuyAsset.symbol}'))),
        error: (err) => snackMsg(context, 'failed to query deposits',
            category: MessageCategory.Warning));
  }

  @override
  Widget build(BuildContext context) {
    return raisedButton(
        onPressed: () => onPressed(context),
        child: Text(
            'Autobuy ${autobuyAsset.symbol} with ${asset.symbol} deposit'));
  }
}

class AutobuyScreen extends StatefulWidget {
  final List<BeMarket> markets;
  final List<BeAsset> assets;
  final Websocket websocket;

  AutobuyScreen(this.markets, this.assets, this.websocket);

  @override
  State<AutobuyScreen> createState() => _AutobuyScreenState();
}

class _AutobuyScreenState extends State<AutobuyScreen> {
  @override
  Widget build(BuildContext context) {
    List<AutobuyButton> buttons = [];
    for (var quoteAsset in widget.assets)
      if (!quoteAsset.isCrypto)
        for (var market in widget.markets)
          if (market.quoteAsset == quoteAsset.symbol)
            for (var baseAsset in widget.assets)
              if (market.baseAsset == baseAsset.symbol)
                buttons.add(
                    AutobuyButton(quoteAsset, baseAsset, widget.websocket));
    return Scaffold(
        appBar: AppBar(
          title: Text('Automatic Buy (DCA)'),
        ),
        body: BiforgePage(
            child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'Here you can create special bank deposit codes and if you make a deposit we will automatically create a buy order for you'),
                      VerticalSpacer(),
                      Row(children: buttons)
                    ]))));
  }
}
