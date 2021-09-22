import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/hmac.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart';
import 'prefs.dart';
import 'utils.dart';

Future<String?> _server() async {
  var testnet = await Prefs.testnetGet();
  var baseUrl = testnet ? BeServerTestnet : BeServerMainnet;
  if (baseUrl != null) baseUrl = baseUrl + 'apiv1/';
  return baseUrl;
}

enum ErrorType { None, Network, Auth }

enum BePermission { receive, balance, history, transfer, issue }
enum BeRole { admin, proposer, authorizer }

class BeError {
  final ErrorType type;
  final String msg;

  BeError(this.type, this.msg);

  static BeError none() {
    return BeError(ErrorType.None, 'no error');
  }

  static BeError network() {
    return BeError(ErrorType.Network, 'network error');
  }

  static BeError auth(String msg) {
    try {
      var json = jsonDecode(msg);
      return BeError(ErrorType.Auth, json['message']);
    } catch (_) {
      return BeError(ErrorType.Auth, msg);
    }
  }
}

class UserInfo {
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? address;
  final String email;
  final String? photo;
  final String? photoType;
  final Iterable<BePermission>? permissions;
  final Iterable<BeRole> roles;
  final bool kycValidated;
  final String? kycUrl;
  final bool aplyidReqExists;
  final bool tfEnabled;

  UserInfo(
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.address,
      this.email,
      this.photo,
      this.photoType,
      this.permissions,
      this.roles,
      this.kycValidated,
      this.kycUrl,
      this.aplyidReqExists,
      this.tfEnabled);

  UserInfo replace(UserInfo info) {
    // selectively replace permissions because websocket events do not include the permissions field
    var permissions = this.permissions;
    if (info.permissions != null) permissions = info.permissions;
    return UserInfo(
        info.firstName,
        info.lastName,
        info.mobileNumber,
        info.address,
        info.email,
        info.photo,
        info.photoType,
        permissions,
        info.roles,
        info.kycValidated,
        info.kycUrl,
        info.aplyidReqExists,
        info.tfEnabled);
  }

  static UserInfo parse(String data) {
    var jsnObj = json.decode(data);
    // check for permissions field because websocket events do not include this field
    List<BePermission>? perms;
    if (jsnObj.containsKey('permissions')) {
      perms = [];
      for (var permName in jsnObj['permissions'])
        for (var perm in BePermission.values)
          if (describeEnum(perm) == permName) perms.add(perm);
    }
    var roles = <BeRole>[];
    for (var roleName in jsnObj['roles'])
      for (var role in BeRole.values)
        if (describeEnum(role) == roleName) roles.add(role);
    return UserInfo(
        jsnObj['first_name'],
        jsnObj['last_name'],
        jsnObj['mobile_number'],
        jsnObj['address'],
        jsnObj['email'],
        jsnObj['photo'],
        jsnObj['photo_type'],
        perms,
        roles,
        jsnObj['kyc_validated'],
        jsnObj['kyc_url'],
        jsnObj['aplyid_req_exists'],
        jsnObj['tf_enabled']);
  }
}

class UserInfoResult {
  final UserInfo? info;
  final BeError error;

  UserInfoResult(this.info, this.error);
}

class BeTwoFactorEnabledResult {
  final bool? tfEnabled;
  final BeError error;

  BeTwoFactorEnabledResult(this.tfEnabled, this.error);

  static BeTwoFactorEnabledResult parse(String data) {
    var json = jsonDecode(data);
    var tfEnabled = json['tf_enabled'];
    return BeTwoFactorEnabledResult(tfEnabled, BeError.none());
  }

  static BeTwoFactorEnabledResult network() {
    return BeTwoFactorEnabledResult(null, BeError.network());
  }

  static BeTwoFactorEnabledResult auth(String msg) {
    return BeTwoFactorEnabledResult(null, BeError.auth(msg));
  }
}

class BeApiKey {
  final String token;
  final String secret;

  BeApiKey(this.token, this.secret);
}

class BeApiKeyResult {
  final BeApiKey? apikey;
  final BeError error;

  BeApiKeyResult(this.apikey, this.error);
}

class BeApiKeyRequestResult {
  final String? token;
  final BeError error;

  BeApiKeyRequestResult(this.token, this.error);
}

class BeKycRequestCreateResult {
  final String? kycUrl;
  final BeError error;

  BeKycRequestCreateResult(this.kycUrl, this.error);
}

class BeTwoFactorSetup {
  final String image;
  final String key;
  final String issuer;
  final String username;

  BeTwoFactorSetup(this.image, this.key, this.issuer, this.username);
}

class BeTwoFactor {
  final String method;
  final BeTwoFactorSetup? setup;

  BeTwoFactor(this.method, this.setup);
}

class BeTwoFactorResult {
  final BeTwoFactor? twoFactor;
  final BeError error;

  BeTwoFactorResult(this.twoFactor, this.error);

  static BeTwoFactorResult parse(String data) {
    var json = jsonDecode(data);
    var method = json['method'];
    BeTwoFactorSetup? setup;
    if (json['setup'] != null) {
      setup = BeTwoFactorSetup(json['setup']['image'], json['setup']['key'],
          json['setup']['issuer'], json['setup']['username']);
    }
    return BeTwoFactorResult(BeTwoFactor(method, setup), BeError.none());
  }

  static BeTwoFactorResult network() {
    return BeTwoFactorResult(null, BeError.network());
  }

  static BeTwoFactorResult auth(String msg) {
    return BeTwoFactorResult(null, BeError.auth(msg));
  }
}

class BeAsset {
  final String symbol;
  final String name;
  final String coinType;
  final String status;
  final int minConfs;
  final String message;
  final int decimals;

  BeAsset(this.symbol, this.name, this.coinType, this.status, this.minConfs,
      this.message, this.decimals);

  static List<BeAsset> parseAssets(dynamic assets) {
    List<BeAsset> assetList = [];
    for (var item in assets)
      assetList.add(BeAsset(
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

class BeAssetResult {
  final List<BeAsset> assets;
  final BeError error;

  BeAssetResult(this.assets, this.error);

  static BeAssetResult parse(String data) {
    var assets = BeAsset.parseAssets(jsonDecode(data)['assets']);
    return BeAssetResult(assets, BeError.none());
  }
}

class BeMarket {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;
  final int precision;
  final String status;
  final String minTrade;
  final String message;

  BeMarket(this.symbol, this.baseAsset, this.quoteAsset, this.precision,
      this.status, this.minTrade, this.message);

  static List<BeMarket> parseMarkets(dynamic markets) {
    List<BeMarket> marketList = [];
    for (var item in markets)
      marketList.add(BeMarket(
          item['symbol'],
          item['base_asset'],
          item['quote_asset'],
          item['precision'],
          item['status'],
          item['min_trade'],
          item['message']));
    return marketList;
  }
}

class BeMarketResult {
  final List<BeMarket> markets;
  final BeError error;

  BeMarketResult(this.markets, this.error);

  static BeMarketResult parse(String data) {
    var markets = BeMarket.parseMarkets(jsonDecode(data)['markets']);
    return BeMarketResult(markets, BeError.none());
  }
}

class BeRate {
  final Decimal quantity;
  final Decimal rate;

  BeRate(this.quantity, this.rate);
}

class BeOrderbook {
  final List<BeRate> bids;
  final List<BeRate> asks;
  final Decimal minOrder;
  final Decimal baseAssetWithdrawFee;
  final Decimal quoteAssetWithdrawFee;
  final Decimal brokerFee;

  BeOrderbook(this.bids, this.asks, this.minOrder, this.baseAssetWithdrawFee,
      this.quoteAssetWithdrawFee, this.brokerFee);

  static BeOrderbook parse(String data) {
    List<BeRate> bids = [];
    List<BeRate> asks = [];
    var json = jsonDecode(data);
    var orderbook = json['order_book'];
    var minOrder = Decimal.parse(json['min_order']);
    var baseAssetWithdrawFee = Decimal.parse(json['base_asset_withdraw_fee']);
    var quoteAssetWithdrawFee = Decimal.parse(json['quote_asset_withdraw_fee']);
    var brokerFee = Decimal.parse(json['broker_fee']);
    for (var item in orderbook['bids'])
      bids.add(
          BeRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    for (var item in orderbook['asks'])
      asks.add(
          BeRate(Decimal.parse(item['quantity']), Decimal.parse(item['rate'])));
    return BeOrderbook(bids, asks, minOrder, baseAssetWithdrawFee,
        quoteAssetWithdrawFee, brokerFee);
  }

  static BeOrderbook empty() {
    return BeOrderbook(
        [], [], Decimal.zero, Decimal.zero, Decimal.zero, Decimal.zero);
  }
}

class BeOrderbookResult {
  final BeOrderbook orderbook;
  final BeError error;

  BeOrderbookResult(this.orderbook, this.error);
}

class BeBalance {
  final String asset;
  final String name;
  final Decimal total;
  final Decimal available;

  BeBalance(this.asset, this.name, this.total, this.available);

  static BeBalance parse(Map item) {
    var total = Decimal.parse(item['total']);
    var available = Decimal.parse(item['available']);
    return BeBalance(item['symbol'], item['name'], total, available);
  }
}

class BeBalancesResult {
  final List<BeBalance> balances;
  final BeError error;

  BeBalancesResult(this.balances, this.error);

  static BeBalancesResult network() {
    return BeBalancesResult([], BeError.network());
  }

  static BeBalancesResult auth(String msg) {
    return BeBalancesResult([], BeError.auth(msg));
  }

  static BeBalancesResult parse(String data) {
    List<BeBalance> balances = [];
    for (var item in jsonDecode(data)['balances'])
      balances.add(BeBalance.parse(item));
    return BeBalancesResult(balances, BeError.none());
  }
}

class BeAddressBookEntry {
  final DateTime date;
  final String recipient;
  final String? description;

  BeAddressBookEntry(this.date, this.recipient, this.description);

  static BeAddressBookEntry parse(dynamic item) {
    return BeAddressBookEntry(
        DateTime.parse(item['date']), item['recipient'], item['description']);
  }
}

class BeAddressBookResult {
  final List<BeAddressBookEntry> entries;
  final BeError error;

  BeAddressBookResult(this.entries, this.error);

  static BeAddressBookResult parse(String data) {
    var json = jsonDecode(data);
    List<BeAddressBookEntry> entries = [];
    for (var item in json['entries'])
      entries.add(BeAddressBookEntry.parse(item));
    return BeAddressBookResult(entries, BeError.none());
  }

  static BeAddressBookResult network() {
    return BeAddressBookResult([], BeError.network());
  }

  static BeAddressBookResult auth(String msg) {
    return BeAddressBookResult([], BeError.auth(msg));
  }
}

enum BeMarketSide { bid, ask }

String marketSideNice(BeMarketSide side) {
  switch (side) {
    case BeMarketSide.ask:
      return 'Sell';
    case BeMarketSide.bid:
      return 'Buy';
  }
}

enum BeOrderStatus {
  none,
  created,
  ready,
  incoming,
  confirmed,
  exchange,
  withdrawing,
  completed,
  expired,
  cancelled
}

extension EnumEx on String {
  BeMarketSide toEnumSide() =>
      BeMarketSide.values.firstWhere((d) => describeEnum(d) == toLowerCase());

  BeOrderStatus toEnumStatus() =>
      BeOrderStatus.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

class BeBrokerOrder {
  final String token;
  final DateTime date;
  final DateTime expiry;
  final String market;
  final BeMarketSide side;
  final String baseAsset;
  final String quoteAsset;
  final Decimal baseAmount;
  final Decimal quoteAmount;
  final String recipient;
  final BeOrderStatus status;
  final String? paymentUrl;

  BeBrokerOrder(
      this.token,
      this.date,
      this.expiry,
      this.market,
      this.side,
      this.baseAsset,
      this.quoteAsset,
      this.baseAmount,
      this.quoteAmount,
      this.recipient,
      this.status,
      this.paymentUrl);

  static BeBrokerOrder parse(Map data) {
    var date = DateTime.parse(data['date']);
    var expiry = DateTime.parse(data['expiry']);
    var side = (data['side'] as String).toEnumSide();
    var baseAmount = Decimal.parse(data['base_amount_dec']);
    var quoteAmount = Decimal.parse(data['quote_amount_dec']);
    var status = (data['status'] as String).toEnumStatus();
    return BeBrokerOrder(
        data['token'],
        date,
        expiry,
        data['market'],
        side,
        data['base_asset'],
        data['quote_asset'],
        baseAmount,
        quoteAmount,
        data['recipient'],
        status,
        data['payment_url']);
  }

  static BeBrokerOrder empty() {
    return BeBrokerOrder(
        '',
        DateTime.now(),
        DateTime.now(),
        '',
        BeMarketSide.bid,
        '',
        '',
        Decimal.zero,
        Decimal.zero,
        '',
        BeOrderStatus.none,
        null);
  }
}

class BeBrokerOrderResult {
  final BeBrokerOrder order;
  final BeError error;

  BeBrokerOrderResult(this.order, this.error);

  static BeBrokerOrderResult parse(String data) {
    var json = jsonDecode(data);
    BeBrokerOrder order = BeBrokerOrder.parse(json['broker_order']);
    return BeBrokerOrderResult(order, BeError.none());
  }
}

class BeBrokerOrdersResult {
  final List<BeBrokerOrder> orders;
  final int offset;
  final int limit;
  final int total;
  final BeError error;

  BeBrokerOrdersResult(
      this.orders, this.offset, this.limit, this.total, this.error);

  static BeBrokerOrdersResult parse(String data) {
    var json = jsonDecode(data);
    List<BeBrokerOrder> orderList = [];
    var orders = json['broker_orders'];
    for (var item in orders) orderList.add(BeBrokerOrder.parse(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeBrokerOrdersResult(
        orderList, offset, limit, total, BeError.none());
  }

  static BeBrokerOrdersResult network() {
    return BeBrokerOrdersResult([], 0, 0, 0, BeError.network());
  }

  static BeBrokerOrdersResult auth(String msg) {
    return BeBrokerOrdersResult([], 0, 0, 0, BeError.auth(msg));
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

Future<String?> beServer() async {
  return await _server();
}

Future<BeError> beUserRegister(AccountRegistration reg) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeError.network();
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
  if (response == null) return BeError.network();
  if (response.statusCode == 200) {
    return BeError.none();
  } else if (response.statusCode == 400) return BeError.auth(response.body);
  print(response.statusCode);
  return BeError.network();
}

Future<BeTwoFactorEnabledResult> beUserTwoFactorEnabledCheck(
    String email, String password) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeTwoFactorEnabledResult(null, BeError.network());
  var url = baseUrl + "user_two_factor_enabled_check";
  var body = jsonEncode({"email": email, "password": password});
  var response = await postAndCatch(url, body);
  if (response == null) return BeTwoFactorEnabledResult.network();
  if (response.statusCode == 200) {
    return BeTwoFactorEnabledResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorEnabledResult.auth(response.body);
  print(response.statusCode);
  return BeTwoFactorEnabledResult.network();
}

Future<BeApiKeyResult> beApiKeyCreate(
    String email, String password, String deviceName, String tfCode) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyResult(null, BeError.network());
  var url = baseUrl + "api_key_create";
  var body = jsonEncode({
    "email": email,
    "password": password,
    "device_name": deviceName,
    "tf_code": tfCode
  });
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyResult(null, BeError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = BeApiKey(jsnObj["token"], jsnObj["secret"]);
    return BeApiKeyResult(info, BeError.none());
  } else if (response.statusCode == 400)
    return BeApiKeyResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return BeApiKeyResult(null, BeError.network());
}

Future<BeApiKeyRequestResult> beApiKeyRequest(
    String email, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyRequestResult(null, BeError.network());
  var url = baseUrl + "api_key_request";
  var body = jsonEncode({"email": email, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyRequestResult(null, BeError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var token = jsnObj["token"];
    return BeApiKeyRequestResult(token, BeError.none());
  } else if (response.statusCode == 400)
    return BeApiKeyRequestResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return BeApiKeyRequestResult(null, BeError.network());
}

Future<BeApiKeyResult> beApiKeyClaim(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyResult(null, BeError.network());
  var url = baseUrl + "api_key_claim";
  var body = jsonEncode({"token": token});
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyResult(null, BeError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = BeApiKey(jsnObj["token"], jsnObj["secret"]);
    return BeApiKeyResult(info, BeError.none());
  } else if (response.statusCode == 400)
    return BeApiKeyResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return BeApiKeyResult(null, BeError.network());
}

Future<UserInfoResult> beUserInfo({String? email}) async {
  var baseUrl = await _server();
  if (baseUrl == null) return UserInfoResult(null, BeError.network());
  var url = baseUrl + "user_info";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return UserInfoResult(null, BeError.network());
  if (response.statusCode == 200) {
    var info = UserInfo.parse(response.body);
    return UserInfoResult(info, BeError.none());
  } else if (response.statusCode == 400)
    return UserInfoResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return UserInfoResult(null, BeError.network());
}

Future<BeError> beUserResetPassword() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeError.network();
  var url = baseUrl + "user_reset_password";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeError.network();
  if (response.statusCode == 200) {
    return BeError.none();
  } else if (response.statusCode == 400) return BeError.auth(response.body);
  print(response.statusCode);
  return BeError.network();
}

Future<BeError> beUserUpdateEmail(String email) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeError.network();
  var url = baseUrl + "user_update_email";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeError.network();
  if (response.statusCode == 200) {
    return BeError.none();
  } else if (response.statusCode == 400) return BeError.auth(response.body);
  print(response.statusCode);
  return BeError.network();
}

Future<BeError> beUserUpdatePassword(
    String currentPassword, String newPassword) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeError.network();
  var url = baseUrl + "user_update_password";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "current_password": currentPassword,
    "new_password": newPassword
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeError.network();
  if (response.statusCode == 200) {
    return BeError.none();
  } else if (response.statusCode == 400) return BeError.auth(response.body);
  print(response.statusCode);
  return BeError.network();
}

Future<BeError> beUserUpdatePhoto(String? photo, String? photoType) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeError.network();
  var url = baseUrl + "user_update_photo";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "photo": photo,
    "photo_type": photoType
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeError.network();
  if (response.statusCode == 200) {
    return BeError.none();
  } else if (response.statusCode == 400) return BeError.auth(response.body);
  print(response.statusCode);
  return BeError.network();
}

Future<BeKycRequestCreateResult> beKycRequestCreate() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeKycRequestCreateResult(null, BeError.network());
  var url = baseUrl + "user_kyc_request_create";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeKycRequestCreateResult(null, BeError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    return BeKycRequestCreateResult(jsnObj['kyc_url'], BeError.none());
  } else if (response.statusCode == 400)
    return BeKycRequestCreateResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return BeKycRequestCreateResult(null, BeError.network());
}

Future<BeKycRequestCreateResult> beKycRequestSendMobileNumber(
    String mobileNumber) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeKycRequestCreateResult(null, BeError.network());
  var url = baseUrl + "user_kyc_request_send_mobile_number";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode(
      {"api_key": apikey, "nonce": nonce, "mobile_number": mobileNumber});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeKycRequestCreateResult(null, BeError.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    return BeKycRequestCreateResult(jsnObj['kyc_url'], BeError.none());
  } else if (response.statusCode == 400)
    return BeKycRequestCreateResult(null, BeError.auth(response.body));
  print(response.statusCode);
  return BeKycRequestCreateResult(null, BeError.network());
}

Future<BeTwoFactorResult> beUserTwoFactorEnable(String? code) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeTwoFactorResult(null, BeError.network());
  var url = baseUrl + "user_two_factor_enable";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "code": code});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeTwoFactorResult(null, BeError.network());
  if (response.statusCode == 200) {
    return BeTwoFactorResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorResult.auth(response.body);
  print(response.statusCode);
  return BeTwoFactorResult.network();
}

Future<BeTwoFactorResult> beUserTwoFactorDisable(String? code) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeTwoFactorResult(null, BeError.network());
  var url = baseUrl + "user_two_factor_disable";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "code": code});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeTwoFactorResult(null, BeError.network());
  if (response.statusCode == 200) {
    return BeTwoFactorResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorResult.auth(response.body);
  print(response.statusCode);
  return BeTwoFactorResult.network();
}

Future<BeAssetResult> beAssets() async {
  List<BeAsset> assets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return BeAssetResult(assets, BeError.network());
  var url = baseUrl + "assets";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeAssetResult(assets, BeError.network());
  if (response.statusCode == 200) {
    return BeAssetResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeAssetResult(assets, BeError.auth(response.body));
  print(response.statusCode);
  return BeAssetResult(assets, BeError.network());
}

Future<BeMarketResult> beMarkets() async {
  List<BeMarket> markets = [];
  var baseUrl = await _server();
  if (baseUrl == null) return BeMarketResult(markets, BeError.network());
  var url = baseUrl + "markets";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeMarketResult(markets, BeError.network());
  if (response.statusCode == 200) {
    return BeMarketResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeMarketResult(markets, BeError.auth(response.body));
  print(response.statusCode);
  return BeMarketResult(markets, BeError.network());
}

Future<BeOrderbookResult> beOrderbook(String market) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeOrderbookResult(BeOrderbook.empty(), BeError.network());
  var url = baseUrl + "order_book";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "market": market});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeOrderbookResult(BeOrderbook.empty(), BeError.network());
  if (response.statusCode == 200) {
    return BeOrderbookResult(BeOrderbook.parse(response.body), BeError.none());
  } else if (response.statusCode == 400)
    return BeOrderbookResult(BeOrderbook.empty(), BeError.auth(response.body));
  print(response.statusCode);
  return BeOrderbookResult(BeOrderbook.empty(), BeError.network());
}

Future<BeBalancesResult> beBalances() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBalancesResult.network();
  var url = baseUrl + "balances";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeBalancesResult.network();
  if (response.statusCode == 200) {
    return BeBalancesResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBalancesResult.auth(response.body);
  print(response.statusCode);
  return BeBalancesResult.network();
}

Future<BeAddressBookResult> beAddressBook(String asset) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeAddressBookResult.network();
  var url = baseUrl + "address_book";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "asset": asset});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeAddressBookResult.network();
  if (response.statusCode == 200) {
    return BeAddressBookResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeAddressBookResult.auth(response.body);
  print(response.statusCode);
  return BeAddressBookResult.network();
}

Future<BeBrokerOrderResult> beOrderCreate(
    String market,
    BeMarketSide side,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String? recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  var url = baseUrl + "broker_order_create";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "market": market,
    "side": describeEnum(side),
    "amount_dec": amount.toString(),
    "recipient": recipient,
    "save_recipient": saveRecipient,
    "recipient_description": recipientDescription
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult(
        BeBrokerOrder.empty(), BeError.auth(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
}

Future<BeBrokerOrderResult> beOrderAccept(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  var url = baseUrl + "broker_order_accept";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult(
        BeBrokerOrder.empty(), BeError.auth(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
}

Future<BeBrokerOrderResult> beOrderStatus(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  var url = baseUrl + "broker_order_status";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult(
        BeBrokerOrder.empty(), BeError.auth(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult(BeBrokerOrder.empty(), BeError.network());
}

Future<BeBrokerOrdersResult> beOrderList(int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBrokerOrdersResult.network();
  var url = baseUrl + "broker_orders";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode(
      {"api_key": apikey, "nonce": nonce, "offset": offset, "limit": limit});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeBrokerOrdersResult.network();
  if (response.statusCode == 200) {
    return BeBrokerOrdersResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrdersResult.auth(response.body);
  print(response.statusCode);
  return BeBrokerOrdersResult.network();
}
