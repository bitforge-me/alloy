import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:logging/logging.dart';
import 'package:jiffy/jiffy.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/utils.dart';

import 'beryllium.dart';
import 'assets.dart';
import 'cryptocurrency.dart';
import 'widgets.dart';
import 'config.dart';
import 'units.dart';

final log = Logger('RemitStatus');

enum RemitCheckType { creation, payment, status }

class RemitCheckScreen extends StatefulWidget {
  final bool testnet;
  final String asset;
  final String? l2Network;
  final RemitCheckType type;
  final BePaymentMethodCategory category;
  final BePaymentMethod paymentMethod;
  final String name;
  final String? accountNumber;
  final String? mobileNumber;
  final Decimal amount;
  final String? description;
  final BeRemitInvoice? invoice;

  RemitCheckScreen(
      this.testnet,
      this.asset,
      this.l2Network,
      this.type,
      this.category,
      this.paymentMethod,
      this.name,
      this.accountNumber,
      this.mobileNumber,
      this.amount,
      this.description,
      this.invoice);

  @override
  State<RemitCheckScreen> createState() => _RemitCheckScreenState();
}

class _RemitCheckScreenState extends State<RemitCheckScreen> {
  var _extractedAmount = -Decimal.one;
  DateTime? _extractedExpiry;

  @override
  void initState() {
    _extractedAmount = widget.amount;
    if (widget.invoice != null && widget.l2Network != null) {
      var res = l2RecipientValidate(
          widget.l2Network!, widget.testnet, widget.invoice!.bolt11);
      if (res.result) {
        if (res.amount != null) _extractedAmount = res.amount!;
        if (res.expiry != null) _extractedExpiry = res.expiry!;
      }
    }
    super.initState();
  }

  void _cancel() {
    Navigator.pop(context, false);
  }

  void _ok() {
    Navigator.pop(context, true);
  }

  Widget? _fees() {
    assert(widget.invoice != null);
    var feeWidgets = <Widget>[];
    for (var fee in widget.invoice!.fees.entries) {
      feeWidgets
          .add(Text('${fee.key}: ${fee.value.amount} ${fee.value.currency}'));
    }
    return Row(children: feeWidgets);
  }

  String _titleText() {
    switch (widget.type) {
      case RemitCheckType.creation:
        return 'Create Remit Invoice';
      case RemitCheckType.payment:
        return 'Pay Remit Invoice';
      case RemitCheckType.status:
        return 'Remit Invoice Status';
    }
  }

  String _okText() {
    switch (widget.type) {
      case RemitCheckType.creation:
        return 'Create';
      case RemitCheckType.payment:
        return 'Pay';
      case RemitCheckType.status:
        return 'Close';
    }
  }

  String _cancelText() {
    switch (widget.type) {
      case RemitCheckType.creation:
        return 'Cancel';
      case RemitCheckType.payment:
        return 'Cancel';
      case RemitCheckType.status:
        return 'Close';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleText()),
          actions: [
            assetLogo(
                widget.l2Network != null ? widget.l2Network! : widget.asset,
                margin: EdgeInsets.all(10))
          ],
        ),
        body: BitforgePage(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  ListView(shrinkWrap: true, children: [
                    ListTile(
                      title: Text('Payment Method'),
                      subtitle: Text(widget.paymentMethod.name),
                    ),
                    ListTile(
                      title: Text('Account Name'),
                      subtitle: Text(widget.name),
                    ),
                    ListTile(
                      title: Text(
                          widget.category == BePaymentMethodCategory.bank
                              ? 'Account Number'
                              : 'Mobile Number'),
                      subtitle: Text(
                          widget.category == BePaymentMethodCategory.bank
                              ? '${widget.accountNumber}'
                              : '${widget.mobileNumber}'),
                    ),
                    ListTile(
                        title: Text('Amount to Send'),
                        subtitle:
                            PriceEquivalent(widget.asset, _extractedAmount)),
                    widget.description != null
                        ? ListTile(
                            title: Text('Description'),
                            subtitle: Text('${widget.description}'))
                        : SizedBox(),
                    widget.invoice != null
                        ? ListTile(
                            title: Text('Amount to Receive'),
                            subtitle: Text(
                                '${widget.invoice!.recipient.amount} ${widget.invoice!.recipient.currency}'))
                        : SizedBox(),
                    widget.invoice != null
                        ? ListTile(title: Text('Fees'), subtitle: _fees())
                        : SizedBox(),
                    widget.invoice != null
                        ? ListTile(
                            title: Text('Status'),
                            subtitle: Text(widget.invoice!.status))
                        : SizedBox(),
                    widget.invoice != null
                        ? ListTile(
                            title: Text('Expiry'),
                            subtitle: Text(_extractedExpiry != null
                                ? '$_extractedExpiry (${Jiffy(_extractedExpiry).fromNow()})'
                                : '-'))
                        : SizedBox(),
                  ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.type != RemitCheckType.status
                            ? BronzeRoundedButton(_ok, ZapOnPrimary, ZapPrimary,
                                ZapPrimaryGradient, _okText(),
                                width: ButtonWidth, height: ButtonHeight)
                            : SizedBox(),
                        BronzeRoundedButton(_cancel, ZapOnSurface, ZapSurface,
                            null, _cancelText(),
                            width: ButtonWidth, height: ButtonHeight)
                      ])
                ]))));
  }
}

Future<void> remitStatus(
    BuildContext context,
    String refId,
    BePaymentMethodCategory category,
    BePaymentMethod paymentMethod,
    bool testnet,
    String asset,
    String? l2Network) async {
  showAlertDialog(context, 'getting invoice..');
  var res = await beRemitInvoiceStatus(refId);
  Navigator.pop(context);
  var invoice = res.when((remit, invoice, withdrawal) => invoice, error: (err) {
    alert(context, 'error', 'failed to obtain invoice (${BeError.msg(err)})');
    return null;
  });
  if (invoice == null) return;
  var amount = (Decimal.fromInt(invoice.sender.amount) /
      Decimal.fromInt(100000000)); //TODO - do these conversions server side?
  await Navigator.push(
      context,
      MaterialPageRoute<bool>(
          builder: (context) => RemitCheckScreen(
              testnet,
              asset,
              l2Network,
              RemitCheckType.status,
              category,
              paymentMethod,
              invoice.recipient.name,
              invoice.recipient.accountNumber,
              invoice.recipient.mobileNumber,
              amount,
              null,
              invoice)));
}
