import 'package:url_launcher/url_launcher.dart';
import 'package:decimal/decimal.dart';

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
  if (await canLaunch(url))
    await launch(url);
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
