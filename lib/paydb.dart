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

enum ErrorType { None, Network, Auth }

enum PayDbPermission { receive, balance, history, transfer, issue }
enum PayDbRole { admin, proposer, authorizer }

class ZcError {
  final ErrorType type;
  final String msg;

  ZcError(this.type, this.msg);

  static ZcError none() {
    return ZcError(ErrorType.None, 'no error');
  }

  static ZcError network() {
    return ZcError(ErrorType.Network, 'network error');
  }

  static ZcError auth(String msg) {
    try {
      var json = jsonDecode(msg);
      return ZcError(ErrorType.Auth, json['message']);
    } catch (_) {
      return ZcError(ErrorType.Auth, msg);
    }
  }
}

class UserInfo {
  final String email;
  final int balance;
  final String? photo;
  final String? photoType;
  final Iterable<PayDbPermission> permissions;
  final Iterable<PayDbRole> roles;
  final bool kycValidated;
  final String? kycUrl;

  UserInfo(this.email, this.balance, this.photo, this.photoType,
      this.permissions, this.roles, this.kycValidated, this.kycUrl);

  UserInfo replace({String? newKycUrl}) {
    // get current
    var email = this.email;
    var balance = this.balance;
    var photo = this.photo;
    var photoType = this.photoType;
    var permissions = this.permissions;
    var roles = this.roles;
    var kycValidated = this.kycValidated;
    var kycUrl = this.kycUrl;
    // get replacements
    if (newKycUrl != null) kycUrl = newKycUrl;
    // return new object
    return UserInfo(email, balance, photo, photoType, permissions, roles,
        kycValidated, kycUrl);
  }
}

class UserInfoResult {
  final UserInfo? info;
  final ZcError error;

  UserInfoResult(this.info, this.error);
}

class PayDbApiKey {
  final String token;
  final String secret;

  PayDbApiKey(this.token, this.secret);
}

class PayDbApiKeyResult {
  final PayDbApiKey? apikey;
  final ZcError error;

  PayDbApiKeyResult(this.apikey, this.error);
}

class PayDbApiKeyRequestResult {
  final String? token;
  final ZcError error;

  PayDbApiKeyRequestResult(this.token, this.error);
}

class ZcKycRequestCreateResult {
  final String? kycUrl;
  final ZcError error;

  ZcKycRequestCreateResult(this.kycUrl, this.error);
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
  final ZcError error;

  ZcAssetResult(this.assets, this.error);

  static ZcAssetResult parse(String data) {
    var assets = ZcAsset.parseAssets(jsonDecode(data)['assets']);
    return ZcAssetResult(assets, ZcError.none());
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
  final ZcError error;

  ZcMarketResult(this.markets, this.error);

  static ZcMarketResult parse(String data) {
    var markets = ZcMarket.parseMarkets(jsonDecode(data)['markets']);
    return ZcMarketResult(markets, ZcError.none());
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
  final Decimal minOrder;
  final Decimal brokerFee;

  ZcOrderbook(this.bids, this.asks, this.minOrder, this.brokerFee);

  static ZcOrderbook parse(String data) {
    List<ZcRate> bids = [];
    List<ZcRate> asks = [];
    var json = jsonDecode(data);
    var orderbook = json['order_book'];
    var minOrder = Decimal.parse(json['min_order']);
    var brokerFee = Decimal.parse(json['broker_fee']);
    for (var item in orderbook['bids'])
      bids.add(
          ZcRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    for (var item in orderbook['asks'])
      asks.add(
          ZcRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    return ZcOrderbook(bids, asks, minOrder, brokerFee);
  }

  static ZcOrderbook empty() {
    return ZcOrderbook([], [], Decimal.zero, Decimal.zero);
  }
}

class ZcOrderbookResult {
  final ZcOrderbook orderbook;
  final ZcError error;

  ZcOrderbookResult(this.orderbook, this.error);
}

enum ZcMarketSide { bid, ask }

enum ZcOrderStatus {
  none,
  created,
  ready,
  incoming,
  confirmed,
  withdraw,
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
  final ZcError error;

  ZcBrokerOrderResult(this.order, this.error);

  static ZcBrokerOrderResult parse(String data) {
    var json = jsonDecode(data);
    ZcBrokerOrder order = ZcBrokerOrder.parse(json['broker_order']);
    return ZcBrokerOrderResult(order, ZcError.none());
  }
}

class ZcBrokerOrdersResult {
  final List<ZcBrokerOrder> orders;
  final ZcError error;

  ZcBrokerOrdersResult(this.orders, this.error);

  static ZcBrokerOrdersResult parse(String data) {
    List<ZcBrokerOrder> orderList = [];
    var orders = jsonDecode(data)['broker_orders'];
    for (var item in orders) orderList.add(ZcBrokerOrder.parse(item));
    return ZcBrokerOrdersResult(orderList, ZcError.none());
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

Future<ZcError> paydbUserRegister(AccountRegistration reg) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcError.network();
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
  if (response == null) return ZcError.network();
  if (response.statusCode == 200) {
    return ZcError.none();
  } else if (response.statusCode == 400) return ZcError.auth(response.body);
  print(response.statusCode);
  return ZcError.network();
}

Future<PayDbApiKeyResult> paydbApiKeyCreate(
    String email, String password, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbApiKeyResult(null, ZcError.network());
  var url = baseUrl + "api_key_create";
  var body = jsonEncode(
      {"email": email, "password": password, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null) return PayDbApiKeyResult(null, ZcError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = PayDbApiKey(jsnObj["token"], jsnObj["secret"]);
    return PayDbApiKeyResult(info, ZcError.none());
  } else if (response.statusCode == 400)
    return PayDbApiKeyResult(null, ZcError.auth(response.body));
  print(response.statusCode);
  return PayDbApiKeyResult(null, ZcError.network());
}

Future<PayDbApiKeyRequestResult> paydbApiKeyRequest(
    String email, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbApiKeyRequestResult(null, ZcError.network());
  var url = baseUrl + "api_key_request";
  var body = jsonEncode({"email": email, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null)
    return PayDbApiKeyRequestResult(null, ZcError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var token = jsnObj["token"];
    return PayDbApiKeyRequestResult(token, ZcError.none());
  } else if (response.statusCode == 400)
    return PayDbApiKeyRequestResult(null, ZcError.auth(response.body));
  print(response.statusCode);
  return PayDbApiKeyRequestResult(null, ZcError.network());
}

Future<PayDbApiKeyResult> paydbApiKeyClaim(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return PayDbApiKeyResult(null, ZcError.network());
  var url = baseUrl + "api_key_claim";
  var body = jsonEncode({"token": token});
  var response = await postAndCatch(url, body);
  if (response == null) return PayDbApiKeyResult(null, ZcError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = PayDbApiKey(jsnObj["token"], jsnObj["secret"]);
    return PayDbApiKeyResult(info, ZcError.none());
  } else if (response.statusCode == 400)
    return PayDbApiKeyResult(null, ZcError.auth(response.body));
  print(response.statusCode);
  return PayDbApiKeyResult(null, ZcError.network());
}

Future<UserInfoResult> paydbUserInfo({String? email}) async {
  var baseUrl = await _server();
  if (baseUrl == null) return UserInfoResult(null, ZcError.network());
  var url = baseUrl + "user_info";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return UserInfoResult(null, ZcError.network());
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
    var info = UserInfo(
        jsnObj["email"],
        jsnObj["balance"],
        jsnObj["photo"],
        jsnObj["photo_type"],
        perms,
        roles,
        jsnObj["kyc_validated"],
        jsnObj["kyc_url"]);
    return UserInfoResult(info, ZcError.none());
  } else if (response.statusCode == 400)
    return UserInfoResult(null, ZcError.auth(response.body));
  print(response.statusCode);
  return UserInfoResult(null, ZcError.network());
}

Future<ZcError> paydbUserResetPassword() async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcError.network();
  var url = baseUrl + "user_reset_password";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ZcError.network();
  if (response.statusCode == 200) {
    return ZcError.none();
  } else if (response.statusCode == 400) return ZcError.auth(response.body);
  print(response.statusCode);
  return ZcError.network();
}

Future<ZcError> paydbUserUpdateEmail(String email) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcError.network();
  var url = baseUrl + "user_update_email";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ZcError.network();
  if (response.statusCode == 200) {
    return ZcError.none();
  } else if (response.statusCode == 400) return ZcError.auth(response.body);
  print(response.statusCode);
  return ZcError.network();
}

Future<ZcError> paydbUserUpdatePassword(
    String currentPassword, String newPassword) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcError.network();
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
  if (response == null) return ZcError.network();
  if (response.statusCode == 200) {
    return ZcError.none();
  } else if (response.statusCode == 400) return ZcError.auth(response.body);
  print(response.statusCode);
  return ZcError.network();
}

Future<ZcError> paydbUserUpdatePhoto(String? photo, String? photoType) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcError.network();
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
  if (response == null) return ZcError.network();
  if (response.statusCode == 200) {
    return ZcError.none();
  } else if (response.statusCode == 400) return ZcError.auth(response.body);
  print(response.statusCode);
  return ZcError.network();
}

Future<ZcKycRequestCreateResult> zcKycRequestCreate() async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcKycRequestCreateResult(null, ZcError.network());
  var url = baseUrl + "user_kyc_request_create";
  var apikey = await Prefs.paydbApiKeyGet();
  var apisecret = await Prefs.paydbApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = DateTime.now().toUtc().millisecondsSinceEpoch;
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return ZcKycRequestCreateResult(null, ZcError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    return ZcKycRequestCreateResult(jsnObj['kyc_url'], ZcError.none());
  } else if (response.statusCode == 400)
    return ZcKycRequestCreateResult(null, ZcError.auth(response.body));
  print(response.statusCode);
  return ZcKycRequestCreateResult(null, ZcError.network());
}

Future<ZcAssetResult> zcAssets() async {
  List<ZcAsset> assets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return ZcAssetResult(assets, ZcError.network());
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
  if (response == null) return ZcAssetResult(assets, ZcError.network());
  if (response.statusCode == 200) {
    return ZcAssetResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcAssetResult(assets, ZcError.auth(response.body));
  print(response.statusCode);
  return ZcAssetResult(assets, ZcError.network());
}

Future<ZcMarketResult> zcMarkets() async {
  List<ZcMarket> markets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return ZcMarketResult(markets, ZcError.network());
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
  if (response == null) return ZcMarketResult(markets, ZcError.network());
  if (response.statusCode == 200) {
    return ZcMarketResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcMarketResult(markets, ZcError.auth(response.body));
  print(response.statusCode);
  return ZcMarketResult(markets, ZcError.network());
}

Future<ZcOrderbookResult> zcOrderbook(String symbol) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcOrderbookResult(ZcOrderbook.empty(), ZcError.network());
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
    return ZcOrderbookResult(ZcOrderbook.empty(), ZcError.network());
  if (response.statusCode == 200) {
    return ZcOrderbookResult(ZcOrderbook.parse(response.body), ZcError.none());
  } else if (response.statusCode == 400)
    return ZcOrderbookResult(ZcOrderbook.empty(), ZcError.auth(response.body));
  print(response.statusCode);
  return ZcOrderbookResult(ZcOrderbook.empty(), ZcError.network());
}

Future<ZcBrokerOrderResult> zcOrderCreate(
    String market, ZcMarketSide side, Decimal amount, String recipient) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
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
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(
        ZcBrokerOrder.empty(), ZcError.auth(response.body));
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
}

Future<ZcBrokerOrderResult> zcOrderAccept(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
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
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(
        ZcBrokerOrder.empty(), ZcError.auth(response.body));
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
}

Future<ZcBrokerOrderResult> zcOrderStatus(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
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
    return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
  if (response.statusCode == 200) {
    return ZcBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrderResult(
        ZcBrokerOrder.empty(), ZcError.auth(response.body));
  print(response.statusCode);
  return ZcBrokerOrderResult(ZcBrokerOrder.empty(), ZcError.network());
}

Future<ZcBrokerOrdersResult> zcOrderList(int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ZcBrokerOrdersResult([], ZcError.network());
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
  if (response == null) return ZcBrokerOrdersResult([], ZcError.network());
  if (response.statusCode == 200) {
    return ZcBrokerOrdersResult.parse(response.body);
  } else if (response.statusCode == 400)
    return ZcBrokerOrdersResult([], ZcError.auth(response.body));
  print(response.statusCode);
  return ZcBrokerOrdersResult([], ZcError.network());
}
