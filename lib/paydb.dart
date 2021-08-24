import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/hmac.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart';
import 'prefs.dart';

Future<String?> _server() async {
  var testnet = await Prefs.testnetGet();
  return testnet ? PayDBServerTestnet : PayDBServerMainnet;
}

const ActionIssue = 'issue';
const ActionTransfer = 'transfer';
const ActionDestroy = 'destroy';

enum PayDbError { None, Network, Auth }

enum PayDbPermission { receive, balance, history, transfer, issue }
enum PayDbRole { admin, proposer, authorizer }

class UserInfo {
  final String email;
  final int balance;
  final String? photo;
  final String? photoType;
  final Iterable<PayDbPermission> permissions;
  final Iterable<PayDbRole> roles;

  UserInfo(this.email, this.balance, this.photo, this.photoType,
      this.permissions, this.roles);
}

class UserInfoResult {
  final UserInfo? info;
  final PayDbError error;

  UserInfoResult(this.info, this.error);
}

class PayDbApiKey {
  final String token;
  final String secret;

  PayDbApiKey(this.token, this.secret);
}

class PayDbApiKeyResult {
  final PayDbApiKey? apikey;
  final PayDbError error;

  PayDbApiKeyResult(this.apikey, this.error);
}

class PayDbApiKeyRequestResult {
  final String? token;
  final PayDbError error;

  PayDbApiKeyRequestResult(this.token, this.error);
}

class PayDbTx {
  final String token;
  final String action;
  final int timestamp;
  final String sender;
  final String recipient;
  final int amount;
  final String? attachment;

  PayDbTx(this.token, this.action, this.timestamp, this.sender, this.recipient,
      this.amount, this.attachment);
}

class PayDbUserTxsResult {
  final Iterable<PayDbTx>? txs;
  final PayDbError error;

  PayDbUserTxsResult(this.txs, this.error);
}

class PayDbTxResult {
  final PayDbTx? tx;
  final PayDbError error;

  PayDbTxResult(this.tx, this.error);
}

class PayDbRewardCategoriesResult {
  final List<String> categories;
  final PayDbError error;

  PayDbRewardCategoriesResult(this.categories, this.error);
}

class ZcAsset {
  final String symbol;
  final String name;
  final String coinType;
  final String status;
  final int minConfs;
  final String message;
  final int decimals;

  ZcAsset(this.symbol, this.name, this.coinType, this.status, this.minConfs,
      this.message, this.decimals);

  static List<ZcAsset> parseAssets(dynamic assets) {
    List<ZcAsset> assetList = [];
    for (var item in assets)
      assetList.add(ZcAsset(
          item['symbol'],
          item['name'],
          item['coin_type'],
          item['status'],
          item['min_confs'],
          item['message'],
          item['decimals']));
    return assetList;
  }
}

class ZcAssetResult {
  final List<ZcAsset> assets;
  final PayDbError error;

  ZcAssetResult(this.assets, this.error);

  static ZcAssetResult parse(String data) {
    var assets = ZcAsset.parseAssets(jsonDecode(data)['assets']);
    return ZcAssetResult(assets, PayDbError.None);
  }
}

class ZcMarket {
  final String symbol;
  final String baseSymbol;
  final String quoteSymbol;
  final int precision;
  final String status;
  final String minTrade;
  final String message;

  ZcMarket(this.symbol, this.baseSymbol, this.quoteSymbol, this.precision,
      this.status, this.minTrade, this.message);

  static List<ZcMarket> parseMarkets(dynamic markets) {
    List<ZcMarket> marketList = [];
    for (var item in markets)
      marketList.add(ZcMarket(
          item['symbol'],
          item['base_symbol'],
          item['quote_symbol'],
          item['precision'],
          item['status'],
          item['min_trade'],
          item['message']));
    return marketList;
  }
}

class ZcMarketResult {
  final List<ZcMarket> markets;
  final PayDbError error;

  ZcMarketResult(this.markets, this.error);

  static ZcMarketResult parse(String data) {
    var markets = ZcMarket.parseMarkets(jsonDecode(data)['markets']);
    return ZcMarketResult(markets, PayDbError.None);
  }
}

class ZcRate {
  final Decimal quantity;
  final Decimal rate;

  ZcRate(this.quantity, this.rate);
}

class ZcOrderbook {
  final List<ZcRate> bids;
  final List<ZcRate> asks;

  ZcOrderbook(this.bids, this.asks);

  static ZcOrderbook parse(String data) {
    List<ZcRate> bids = [];
    List<ZcRate> asks = [];
    var orderbook = jsonDecode(data)['order_book'];
    for (var item in orderbook['bid'])
      bids.add(
          ZcRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    for (var item in orderbook['ask'])
      asks.add(
          ZcRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    return ZcOrderbook(bids, asks);
  }

  static ZcOrderbook empty() {
    return ZcOrderbook([], []);
  }
}

class ZcOrderbookResult {
  final ZcOrderbook orderbook;
  final PayDbError error;

  ZcOrderbookResult(this.orderbook, this.error);
}

enum ZcMarketSide { bid, ask }

enum ZcOrderStatus {
  none,
  created,
  ready,
  incoming,
  confirmed,
  payment_pending,
  completed,
  expired,
  cancelled
}

extension EnumEx on String {
  ZcOrderStatus toEnum() =>
      ZcOrderStatus.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

class ZcBrokerOrder {
  final String token;
  final DateTime date;
  final DateTime expiry;
  final String market;
  final String baseAsset;
  final String quoteAsset;
  final Decimal baseAmount;
  final Decimal quoteAmount;
  final String recipient;
  final ZcOrderStatus status;
  final String? paymentUrl;

  ZcBrokerOrder(
      this.token,
      this.date,
      this.expiry,
      this.market,
      this.baseAsset,
      this.quoteAsset,
      this.baseAmount,
      this.quoteAmount,
      this.recipient,
      this.status,
      this.paymentUrl);

  static ZcBrokerOrder parse(dynamic data) {
    var date = DateTime.parse(data['date']);
    var expiry = DateTime.parse(data['expiry']);
    var baseAmount = Decimal.parse(data['base_amount_dec']);
    var quoteAmount = Decimal.parse(data['quote_amount_dec']);
    var status = (data['status'] as String).toEnum();
    return ZcBrokerOrder(
        data['token'],
        date,
        expiry,
        data['market'],
        data['base_asset'],
        data['quote_asset'],
        baseAmount,
        quoteAmount,
        data['recipient'],
        status,
        data['payment_url']);
  }

  static ZcBrokerOrder empty() {
    return ZcBrokerOrder('', DateTime.now(), DateTime.now(), '', '', '',
        Decimal.zero, Decimal.zero, '', ZcOrderStatus.none, null);
  }
}

class ZcBrokerOrderResult {
  final ZcBrokerOrder order;
  final PayDbError error;

  ZcBrokerOrderResult(this.order, this.error);

  static ZcBrokerOrderResult parse(String data) {
    var json = jsonDecode(data);
    ZcBrokerOrder order = ZcBrokerOrder.parse(json['broker_order']);
    return ZcBrokerOrderResult(order, PayDbError.None);
  }
}

class ZcBrokerOrdersResult {
  final List<ZcBrokerOrder> orders;
  final PayDbError error;

  ZcBrokerOrdersResult(this.orders, this.error);

  static ZcBrokerOrdersResult parse(String data) {
    List<ZcBrokerOrder> orderList = [];
    var orders = jsonDecode(data)['broker_orders'];
    for (var item in orders) orderList.add(ZcBrokerOrder.parse(item));
    return ZcBrokerOrdersResult(orderList, PayDbError.None);
  }
}

Future<http.Response?> postAndCatch(String url, String body,
    {Map<String, String>? extraHeaders}) async {
  try {
    return await httpPost(Uri.parse(url), body, extraHeaders: extraHeaders);
  } on SocketException catch (e) {
    print(e);
    return null;
  } on TimeoutException catch (e) {
    print(e);
    return null;
  } on http.ClientException catch (e) {
    print(e);
    return null;
  } on ArgumentError catch (e) {
    print(e);
    return null;
  } on HandshakeException catch (e) {
    print(e);
    return null;
  }
}

Future<String?> paydbServer() async {
  return await _server();
}

String? paydbParseRecipient(String value) {
  if (EmailValidator.validate(value)) return value;
  return null;
}

Future<PayDbError> paydbUserRegister(AccountRegistration reg) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl + "user_register";
  var body = jsonEncode({
    "first_name": reg.firstName,
    "last_name": reg.lastName,
    "email": reg.email,
    "mobile_number": reg.mobileNumber,
    "address": reg.address,
    "password": reg.newPassword,
    "photo": reg.photo,
    "photo_type": reg.photoType
  });
  var response = await postAndCatch(url, body);
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

Future<PayDbApiKeyResult> paydbApiKeyCreate(
    String email, String password, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbApiKeyResult(null, PayDbError.Network);
  var url = baseUrl + "api_key_create";
  var body = jsonEncode(
      {"email": email, "password": password, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null) return PayDbApiKeyResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = PayDbApiKey(jsnObj["token"], jsnObj["secret"]);
    return PayDbApiKeyResult(info, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbApiKeyResult(null, PayDbError.Auth);
  print(response.statusCode);
  return PayDbApiKeyResult(null, PayDbError.Network);
}

Future<PayDbApiKeyRequestResult> paydbApiKeyRequest(
    String email, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return PayDbApiKeyRequestResult(null, PayDbError.Network);
  var url = baseUrl + "api_key_request";
  var body = jsonEncode({"email": email, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null)
    return PayDbApiKeyRequestResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var token = jsnObj["token"];
    return PayDbApiKeyRequestResult(token, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbApiKeyRequestResult(null, PayDbError.Auth);
  print(response.statusCode);
  return PayDbApiKeyRequestResult(null, PayDbError.Network);
}

Future<PayDbApiKeyResult> paydbApiKeyClaim(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbApiKeyResult(null, PayDbError.Network);
  var url = baseUrl + "api_key_claim";
  var body = jsonEncode({"token": token});
  var response = await postAndCatch(url, body);
  if (response == null) return PayDbApiKeyResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = PayDbApiKey(jsnObj["token"], jsnObj["secret"]);
    return PayDbApiKeyResult(info, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbApiKeyResult(null, PayDbError.Auth);
  print(response.statusCode);
  return PayDbApiKeyResult(null, PayDbError.Network);
}

Future<UserInfoResult> paydbUserInfo({String? email}) async {
  var baseUrl = await _server();
  if (baseUrl == null) return UserInfoResult(null, PayDbError.Network);
  var url = baseUrl + "user_info";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return UserInfoResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var perms = <PayDbPermission>[];
    for (var permName in jsnObj["permissions"])
      for (var perm in PayDbPermission.values)
        if (describeEnum(perm) == permName) perms.add(perm);
    var roles = <PayDbRole>[];
    for (var roleName in jsnObj["roles"])
      for (var role in PayDbRole.values)
        if (describeEnum(role) == roleName) roles.add(role);
    var info = UserInfo(jsnObj["email"], jsnObj["balance"], jsnObj["photo"],
        jsnObj["photo_type"], perms, roles);
    return UserInfoResult(info, PayDbError.None);
  } else if (response.statusCode == 400)
    return UserInfoResult(null, PayDbError.Auth);
  print(response.statusCode);
  return UserInfoResult(null, PayDbError.Network);
}

Future<PayDbError> paydbUserResetPassword() async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl + "user_reset_password";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

Future<PayDbError> paydbUserUpdateEmail(String email) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl + "user_update_email";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

Future<PayDbError> paydbUserUpdatePassword(
    String currentPassword, String newPassword) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl + "user_update_password";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "current_password": currentPassword,
    "new_password": newPassword
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

Future<PayDbError> paydbUserUpdatePhoto(
    String? photo, String? photoType) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl + "user_update_photo";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "photo": photo,
    "photo_type": photoType
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

PayDbTx parseTx(dynamic jsn) {
  var timestamp = 0;
  if (jsn["timestamp"] != null) timestamp = jsn["timestamp"];
  var amount = 0;
  if (jsn["amount"] != null) amount = jsn["amount"];
  return PayDbTx(jsn["token"], jsn["action"], timestamp, jsn["sender"],
      jsn["recipient"], amount, jsn["attachment"]);
}

Future<PayDbUserTxsResult> paydbUserTransactions(int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbUserTxsResult(null, PayDbError.Network);
  var url = baseUrl + "user_transactions";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode(
      {"api_key": apikey, "nonce": nonce, "offset": offset, "limit": limit});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbUserTxsResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var txs = <PayDbTx>[];
    for (var tx in jsnObj["txs"]) {
      txs.add(parseTx(tx));
    }
    return PayDbUserTxsResult(txs, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbUserTxsResult(null, PayDbError.Auth);
  print(response.statusCode);
  return PayDbUserTxsResult(null, PayDbError.Network);
}

bool paydbRecipientCheck(String recipient) {
  // check valid email address (from https://stackoverflow.com/a/61512807/206529)
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(recipient);
}

Future<PayDbTxResult> paydbTransactionCreate(
    String action, String recipient, int amount, String? attachment) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbTxResult(null, PayDbError.Network);
  var url = baseUrl + "transaction_create";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "action": action,
    "recipient": recipient,
    "amount": amount,
    "attachment": attachment
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbTxResult(null, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var tx = parseTx(jsnObj["tx"]);
    return PayDbTxResult(tx, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbTxResult(null, PayDbError.Auth);
  print(response.statusCode);
  return PayDbTxResult(null, PayDbError.Network);
}

Future<PayDbRewardCategoriesResult> paydbRewardCategories() async {
  var categories = <String>[];
  var baseUrl = await _server();
  if (baseUrl == null)
    return PayDbRewardCategoriesResult(categories, PayDbError.Network);
  var url = baseUrl.replaceFirst('/paydb/', '/reward/') +
      'reward_categories'; //TODO: hacky url fiddling
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return PayDbRewardCategoriesResult(categories, PayDbError.Network);
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    categories = jsnObj["categories"].map<String>((e) => e as String).toList();
    return PayDbRewardCategoriesResult(categories, PayDbError.None);
  } else if (response.statusCode == 400)
    return PayDbRewardCategoriesResult(categories, PayDbError.Auth);
  print(response.statusCode);
  return PayDbRewardCategoriesResult(categories, PayDbError.Network);
}

Future<PayDbError> paydbRewardCreate(String reason, String category,
    String recipient, int amount, String? message) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbError.Network;
  var url = baseUrl.replaceFirst('/paydb/', '/reward/') +
      'reward_create'; //TODO: hacky url fiddling
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "reason": reason,
    "category": category,
    "recipient": recipient,
    "amount": amount,
    "message": message
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return PayDbError.Network;
  if (response.statusCode == 200) {
    return PayDbError.None;
  } else if (response.statusCode == 400) return PayDbError.Auth;
  print(response.statusCode);
  return PayDbError.Network;
}

Future<ZcAssetResult> zcAssets() async {
  List<ZcAsset> assets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return ZcAssetResult(assets, PayDbError.Network);
  var url = baseUrl + "assets";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ZcAssetResult(assets, PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcAssetResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcAssetResult(assets, PayDbError.Auth);
  print(response.statusCode);
  return ZcAssetResult(assets, PayDbError.Network);
}

Future<ZcMarketResult> zcMarkets() async {
  List<ZcMarket> markets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return ZcMarketResult(markets, PayDbError.Network);
  var url = baseUrl + "markets";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ZcMarketResult(markets, PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcMarketResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcMarketResult(markets, PayDbError.Auth);
  print(response.statusCode);
  return ZcMarketResult(markets, PayDbError.Network);
}

Future<ZcOrderbookResult> zcOrderbook(String symbol) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcOrderbookResult(ZcOrderbook.empty(), PayDbError.Network);
  var url = baseUrl + "order_book";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "symbol": symbol});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return ZcOrderbookResult(ZcOrderbook.empty(), PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcOrderbookResult(ZcOrderbook.parse(response.body), PayDbError.None);
  } else if (response.statusCode == 400)
    return ZcOrderbookResult(ZcOrderbook.empty(), PayDbError.Auth);
  print(response.statusCode);
  return ZcOrderbookResult(ZcOrderbook.empty(), PayDbError.Network);
}

Future<ZcBrokerOrderResult> zcOrderCreate(
    String market, ZcMarketSide side, Decimal amount, String recipient) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  var url = baseUrl + "broker_order_create";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "market": market,
    "side": describeEnum(side),
    "amount_dec": amount.toString(),
    "recipient": recipient
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Auth);
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
}

Future<ZcBrokerOrderResult> zcOrderAccept(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  var url = baseUrl + "broker_order_accept";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Auth);
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
}

Future<ZcBrokerOrderResult> zcOrderStatus(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  var url = baseUrl + "broker_order_status";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Auth);
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), PayDbError.Network);
}

Future<ZcBrokerOrdersResult> zcOrderList(int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcBrokerOrdersResult([], PayDbError.Network);
  var url = baseUrl + "broker_orders";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode(
      {"api_key": apikey, "nonce": nonce, "offset": offset, "limit": limit});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ZcBrokerOrdersResult([], PayDbError.Network);
  if (response.statusCode == 200) {
    return ZcBrokerOrdersResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrdersResult([], PayDbError.Auth);
  print(response.statusCode);
  return ZcBrokerOrdersResult([], PayDbError.Network);
}
