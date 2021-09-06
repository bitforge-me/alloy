import 'package:url_launcher/url_launcher.dart';

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

Future<void> urlLaunch(String? url) async {
  if (url == null) return;
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
