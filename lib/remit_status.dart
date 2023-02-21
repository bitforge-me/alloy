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
import 'snack.dart';

final log = Logger('RemitStatus');

enum RemitCheckType { CHECK, PAY, FINISH }

class RemitCheckScreen extends StatefulWidget {
  final bool testnet;
  final RemitCheckType type;
  final BePaymentMethodCategory category;
  final BePaymentMethod paymentMethod;
  final BeRemitRecipientAmount recipient;
  final String asset;
  final Decimal amount;
  final String? description;
  final BeRemitInvoice? invoice;
  final String? convertedRemitAmount;

  RemitCheckScreen(
      this.testnet,
      this.type,
      this.category,
      this.paymentMethod,
      this.recipient,
      this.asset,
      this.amount,
      this.description,
      this.invoice,
      this.convertedRemitAmount);

  @override
  State<RemitCheckScreen> createState() => _RemitCheckScreenState();
}

class _RemitCheckScreenState extends State<RemitCheckScreen> {
  DateTime? _extractedExpiry;
  BeRemitInvoice? _invoice;

  @override
  void initState() {
    _invoice = widget.invoice;
    if (_invoice != null) {
      var res = l2RecipientValidate(BtcLn, widget.testnet, _invoice!.bolt11);
      if (res.result && res.expiry != null) {
        _extractedExpiry = res.expiry!;
      }
    }
    super.initState();
  }

  List<SliderItem<RemitCheckType>> _sliderItems() {
    return RemitCheckType.values
        .map((e) => SliderItem<RemitCheckType>(e, e.name))
        .toList();
  }

  void _cancel() {
    Navigator.pop(context, false);
  }

  void _ok() {
    Navigator.pop(context, true);
  }

  Future<void> _refund() async {
    assert(_invoice != null);
    showAlertDialog(context, 'refunding invoice..');
    var res = await beRemitInvoiceRefund(_invoice!.referenceId);
    Navigator.pop(context);
    var invoice = res.when((remit, invoice, withdrawal) {
      setState(() => _invoice = invoice);
      snackMsg(context, 'refund in process');
    }, error: (err) {
      alert(context, 'error', 'failed to refund invoice (${BeError.msg(err)})');
      return null;
    });
    if (invoice == null) return;
  }
  /*
  Widget? _fees() {
    assert(_invoice != null);
    var feeWidgets = <Widget>[];
    for (var fee in _invoice!.fees.entries) {
      feeWidgets
          .add(Text('${fee.key}: ${fee.value.amount} ${fee.value.currency}'));
    }
    return Row(children: feeWidgets);
  }
  */
  String _titleText() {
    switch (widget.type) {
      case RemitCheckType.CHECK:
        return 'Create Remit Invoice';
      case RemitCheckType.PAY:
        return 'Pay Remit Invoice';
      case RemitCheckType.FINISH:
        return 'Remit Invoice Status';
    }
  }

  String _okText() {
    switch (widget.type) {
      case RemitCheckType.CHECK:
        return 'Create';
      case RemitCheckType.PAY:
        return 'Pay';
      case RemitCheckType.FINISH:
        return 'Close';
    }
  }

  String _cancelText() {
    switch (widget.type) {
      case RemitCheckType.CHECK:
        return 'Cancel';
      case RemitCheckType.PAY:
        return 'Cancel';
      case RemitCheckType.FINISH:
        return 'Close';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleText()),
          actions: [assetLogo(widget.asset, margin: EdgeInsets.all(10))],
        ),
        body: BitforgePage(
            scrollChild: true,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  ListView(shrinkWrap: true, children: [
                    SliderBar<RemitCheckType>(null, widget.type, _sliderItems(),
                        big: true),
                    ListTile(
                      title: Text('Payment Method'),
                      subtitle: Text(widget.paymentMethod.name),
                    ),
                    ListTile(
                      title: Text('Account Name'),
                      subtitle: Text(widget.recipient.name),
                    ),
                    ListTile(
                      title: Text(
                          widget.category == BePaymentMethodCategory.bank
                              ? 'Account Number'
                              : 'Mobile Number'),
                      subtitle: Text(
                          widget.category == BePaymentMethodCategory.bank
                              ? '${widget.recipient.accountNumber}'
                              : '${widget.recipient.mobileNumber}'),
                    ),
                    ListTile(
                        title: Text('Amount to Send'),
                        subtitle: PriceEquivalent(widget.asset, widget.amount,
                            post: widget.convertedRemitAmount != null
                                ? '(converted to ${widget.convertedRemitAmount})'
                                : null)),
                    widget.description != null
                        ? ListTile(
                            title: Text('Description'),
                            subtitle: Text('${widget.description}'))
                        : SizedBox(),
                    _invoice != null
                        ? ListTile(
                            title: Text('Amount to Receive'),
                            subtitle: Text(
                                '${_invoice!.recipient.amount} ${_invoice!.recipient.currency}'))
                        : SizedBox(),
                    /*
                    _invoice != null
                        ? ListTile(title: Text('Fees'), subtitle: _fees())
                        : SizedBox(),
                    */
                    _invoice != null
                        ? ListTile(
                            title: Text('Status'),
                            subtitle: Text(_invoice!.status.name))
                        : SizedBox(),
                    _invoice != null && _invoice!.status == BeRemitStatus.failed
                        ? ListTile(
                            title: Text('Refund'),
                            subtitle: TextButton(
                                onPressed: _refund,
                                child: Text('Refund to your account')))
                        : SizedBox(),
                    _invoice != null
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
                        widget.type != RemitCheckType.FINISH
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
    String asset) async {
  showAlertDialog(context, 'getting invoice..');
  var res = await beRemitInvoiceStatus(refId);
  Navigator.pop(context);
  var invoice = res.when((remit, invoice, withdrawal) => invoice, error: (err) {
    alert(context, 'error', 'failed to obtain invoice (${BeError.msg(err)})');
    return null;
  });
  if (invoice == null) return;
  var amount =
      assetAmountFromUnit(Btc, Sats, Decimal.fromInt(invoice.sender.amount));
  await Navigator.push(
      context,
      MaterialPageRoute<bool>(
          builder: (context) => RemitCheckScreen(
              testnet,
              RemitCheckType.FINISH,
              category,
              paymentMethod,
              invoice.recipient,
              asset,
              amount,
              null,
              invoice,
              null)));
}
