import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';

import 'assets.dart';

class DepositReceivedScreen extends StatefulWidget {
  final String asset;
  final String? l2Network;
  final String recipient;
  final Decimal amount;
  final String? description;

  DepositReceivedScreen(this.asset, this.l2Network, this.recipient, this.amount,
      this.description);

  @override
  State<DepositReceivedScreen> createState() => _DepositReceivedScreenState();
}

class _DepositReceivedScreenState extends State<DepositReceivedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Deposit Received'),
          actions: [
            assetLogo(
                widget.l2Network != null ? widget.l2Network! : widget.asset,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                      child: Icon(Icons.check_circle_rounded,
                          size: 150, color: Color(0xff38ee55)))),
              Text(assetFormatWithUnitToUser(widget.asset, widget.amount),
                  style: TextStyle(fontSize: 18)),
              Card(
                margin: EdgeInsets.all(20),
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: ListView(shrinkWrap: true, children: [
                      ListTile(
                          title: Text('Recipient'),
                          subtitle: Text(shortenStr(widget.recipient))),
                      widget.description != null
                          ? ListTile(
                              title: Text('Description'),
                              subtitle: Text('${widget.description}'))
                          : SizedBox()
                    ])),
              ),
              RoundedButton(() => Navigator.of(context).pop(), ZapOnSecondary,
                  ZapSecondary, ZapSecondaryGradient, 'OK',
                  width: MediaQuery.of(context).size.width - 80)
            ])));
  }
}

class DepositAmountScreen extends StatefulWidget {
  final String asset;
  final String? l2Network;

  DepositAmountScreen(this.asset, this.l2Network);

  @override
  State<DepositAmountScreen> createState() => _DepositAmountScreenState();
}

class _DepositAmountScreenState extends State<DepositAmountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _ok() {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate())
      Navigator.of(context).pop(_amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Deposit'),
          actions: [
            assetLogo(
                widget.l2Network != null ? widget.l2Network! : widget.asset,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                      child: Icon(Icons.keyboard_arrow_down_rounded,
                          size: 150, color: ZapOnSecondary))),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                      key: _formKey,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            TextFormField(
                                controller: _amountController,
                                decoration: InputDecoration(
                                    labelText:
                                        'Amount (${assetUnit(widget.asset)})'),
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: false, decimal: true),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please enter a value';
                                  var userAmount =
                                      Decimal.tryParse(value.trim());
                                  if (userAmount == null)
                                    return 'Invalid value';
                                  if (userAmount <= Decimal.zero)
                                    'Please return a value greater then 0';
                                  return null;
                                })
                          ])))),
              RoundedButton(_ok, ZapOnSecondary, ZapSecondary,
                  ZapSecondaryGradient, 'Continue',
                  width: MediaQuery.of(context).size.width - 80),
              RoundedButton(() => Navigator.of(context).pop(), ZapOnSurface,
                  ZapSurface, null, 'Cancel',
                  width: MediaQuery.of(context).size.width - 80)
            ])));
  }
}
