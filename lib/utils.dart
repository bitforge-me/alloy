import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

import 'snack.dart';

Decimal _scaleAndApply(int scale, Decimal e) {
  final scaleFactor = Decimal.fromInt(10).pow(scale);
  return ((e * scaleFactor).ceil() / scaleFactor);
}

Decimal ceil(Decimal e, {int scale = 0}) => _scaleAndApply(scale, e);

var lastNonce = 0;
int nextNonce() {
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  if (nonce <= lastNonce) nonce = lastNonce + 1;
  lastNonce = nonce;
  return nonce;
}

String vs(String? s) {
  if (s != null) return s;
  return '';
}

Future<void> urlLaunch(String? url, {Function(String? url)? cantLaunch}) async {
  if (url == null) return;
  if (await canLaunchUrlString(url))
    await launchUrlString(url);
  else if (cantLaunch != null) cantLaunch(url);
}

Decimal roundAt(Decimal value, int digit) {
  final m = Decimal.parse('1' + '0' * digit);
  return (value * m).round() / m;
}

Decimal power(Decimal value, int n) {
  var result = value;
  while (n > 1) {
    result = result * value;
    n--;
  }
  if (n == 1) return result;
  if (n == 0) return Decimal.one;
  throw ArgumentError();
}

void unfocusText() {
  // unfocus any text input to stop keyboards popping up
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<void> saveCsvFile(BuildContext context, String name, String data) async {
  var date = DateFormat('yyyy_MM_dd').format(DateTime.now());
  var filename = await FileSaver.instance.saveFile(
      name: '${name}_$date',
      ext: 'csv',
      bytes: Uint8List.fromList(utf8.encode(data)));
  snackMsg(context, 'saved to "$filename"');
}
