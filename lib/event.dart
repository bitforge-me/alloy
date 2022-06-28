import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/colors.dart';

import 'assets.dart';
import 'widgets.dart';
import 'config.dart';

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
        body: ColumnView(
            scrollChild: true,
            child: Container(
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
                  BronzeRoundedButton(() => Navigator.of(context).pop(),
                      Colors.white, Colors.white30, null, 'Close',
                      width: ButtonWidth, height: ButtonHeight)
                ]))));
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
        body: ColumnView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                          child: Icon(Icons.keyboard_double_arrow_down_rounded,
                              size: 150, color: ZapOnSecondary))),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                          key: _formKey,
                          child: Container(
                              // Fudge factor of 14.0 to match border radius of button
                              width: ButtonWidth + 14.0,
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                BronzeValueInput(
                                  controller: _amountController,
                                  suffixText: '${assetUnit(widget.asset)}',
                                  labelText:
                                      'Amount (${assetUnit(widget.asset)})',
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
                                  },
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: false, decimal: true),
                                ),
                              ])))),
                  BronzeRoundedButton(_ok, ZapOnPrimary, ZapPrimary,
                      ZapPrimaryGradient, 'Continue',
                      width: ButtonWidth, height: ButtonHeight),
                  BronzeRoundedButton(() => Navigator.of(context).pop(),
                      Colors.white, Colors.white30, null, 'Cancel',
                      width: ButtonWidth, height: ButtonHeight)
                ]))));
  }
}

enum DepositMethod { account2account, bankDeposit }

class DepositMethodDetails {
  final DepositMethod method;
  final String name;
  final String description;
  final String asset;

  DepositMethodDetails(this.method, this.name, this.description, this.asset);

  Widget logo({EdgeInsetsGeometry? margin, double size = 48}) {
    return Container(
        margin: margin,
        width: size,
        height: size,
        child: Center(child: Image.asset(this.asset)));
  }

  static String _methodName(DepositMethod method) {
    switch (method) {
      case DepositMethod.account2account:
        return 'Account2Account';
      case DepositMethod.bankDeposit:
        return 'Bank Deposit';
    }
  }

  static String _methodDescription(DepositMethod method) {
    switch (method) {
      case DepositMethod.account2account:
        return 'Deposit immediately using Account2Account (ANZ, ASB, BNZ, COOP, Kiwibank, TSB, Westpac)';
      case DepositMethod.bankDeposit:
        return 'Deposit using a standard bank transfer (all banks)';
    }
  }

  static String _methodAsset(DepositMethod method) {
    switch (method) {
      case DepositMethod.account2account:
        return 'assets/deposit_methods/account2account.png';
      case DepositMethod.bankDeposit:
        return 'assets/deposit_methods/bank_deposit.jpg';
    }
  }

  static DepositMethodDetails fromMethod(DepositMethod method) {
    var name = _methodName(method);
    var description = _methodDescription(method);
    var asset = _methodAsset(method);
    return DepositMethodDetails(method, name, description, asset);
  }
}

class DepositMethodScreen extends StatefulWidget {
  final String asset;
  final String? l2Network;
  final List<DepositMethod> methods;

  DepositMethodScreen(this.asset, this.l2Network, this.methods);

  @override
  State<DepositMethodScreen> createState() => _DepositMethodScreenState();
}

class _DepositMethodScreenState extends State<DepositMethodScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildMethod(BuildContext context, int index) {
    var method = DepositMethodDetails.fromMethod(widget.methods[index]);
    return ListTile(
      onTap: () => Navigator.of(context).pop(method),
      leading: method.logo(),
      title: Text(method.name),
      subtitle: Text(method.description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deposit Method'),
          actions: [
            assetLogo(
                widget.l2Network != null ? widget.l2Network! : widget.asset,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: ColumnView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                          child: Icon(Icons.keyboard_double_arrow_down_rounded,
                              size: 150, color: ZapOnSecondary))),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.methods.length,
                          itemBuilder: _buildMethod)),
                ]))));
  }
}
