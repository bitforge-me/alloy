import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/hmac.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart';
import 'prefs.dart';
import 'utils.dart';

part 'beryllium.g.dart';

Decimal _decimalFromJson(input) => Decimal.parse(input);
String _decimalToJson(input) => input.toString();

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

@JsonSerializable()
class UserInfo {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  final String? address;
  final String email;
  final String? photo;
  @JsonKey(name: 'photo_type')
  final String? photoType;
  final Iterable<BePermission>? permissions;
  final Iterable<BeRole> roles;
  @JsonKey(name: 'kyc_validated')
  final bool kycValidated;
  @JsonKey(name: 'kyc_url')
  final String? kycUrl;
  @JsonKey(name: 'aplyid_req_exists')
  final bool aplyidReqExists;
  @JsonKey(name: 'tf_enabled')
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

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
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

@JsonSerializable()
class BeTwoFactorSetup {
  final String image;
  final String key;
  final String issuer;
  final String username;

  BeTwoFactorSetup(this.image, this.key, this.issuer, this.username);

  factory BeTwoFactorSetup.fromJson(Map<String, dynamic> json) =>
      _$BeTwoFactorSetupFromJson(json);
  Map<String, dynamic> toJson() => _$BeTwoFactorSetupToJson(this);
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
    if (json['setup'] != null) setup = BeTwoFactorSetup.fromJson(json['setup']);
    return BeTwoFactorResult(BeTwoFactor(method, setup), BeError.none());
  }

  static BeTwoFactorResult network() {
    return BeTwoFactorResult(null, BeError.network());
  }

  static BeTwoFactorResult auth(String msg) {
    return BeTwoFactorResult(null, BeError.auth(msg));
  }
}

@JsonSerializable()
class BeAsset {
  final String symbol;
  final String name;
  final int decimals;
  @JsonKey(
      name: 'withdraw_fee', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal withdrawFee;
  @JsonKey(name: 'is_crypto')
  final bool isCrypto;

  BeAsset(
      this.symbol, this.name, this.decimals, this.withdrawFee, this.isCrypto);
  factory BeAsset.fromJson(Map<String, dynamic> json) =>
      _$BeAssetFromJson(json);
  Map<String, dynamic> toJson() => _$BeAssetToJson(this);

  static List<BeAsset> parseAssets(List<dynamic> assets) {
    List<BeAsset> assetList = [];
    for (var item in assets) assetList.add(BeAsset.fromJson(item));
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

@JsonSerializable()
class BeMarket {
  final String symbol;
  @JsonKey(name: 'base_asset')
  final String baseAsset;
  @JsonKey(name: 'quote_asset')
  final String quoteAsset;
  final int precision;
  final String status;
  @JsonKey(name: 'min_trade')
  final String minTrade;
  final String message;

  BeMarket(this.symbol, this.baseAsset, this.quoteAsset, this.precision,
      this.status, this.minTrade, this.message);
  factory BeMarket.fromJson(Map<String, dynamic> json) =>
      _$BeMarketFromJson(json);
  Map<String, dynamic> toJson() => _$BeMarketToJson(this);

  static List<BeMarket> parseMarkets(dynamic markets) {
    List<BeMarket> marketList = [];
    for (var item in markets) marketList.add(BeMarket.fromJson(item));
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

@JsonSerializable()
class BeRate {
  @JsonKey(fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal quantity;
  @JsonKey(fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal rate;

  BeRate(this.quantity, this.rate);
  factory BeRate.fromJson(Map<String, dynamic> json) => _$BeRateFromJson(json);
  Map<String, dynamic> toJson() => _$BeRateToJson(this);
}

@JsonSerializable()
class BeOrderbook {
  final List<BeRate> bids;
  final List<BeRate> asks;
  @JsonKey(
      name: 'min_order', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal minOrder;
  @JsonKey(
      name: 'base_asset_withdraw_fee',
      fromJson: _decimalFromJson,
      toJson: _decimalToJson)
  final Decimal baseAssetWithdrawFee;
  @JsonKey(
      name: 'quote_asset_withdraw_fee',
      fromJson: _decimalFromJson,
      toJson: _decimalToJson)
  final Decimal quoteAssetWithdrawFee;
  @JsonKey(
      name: 'broker_fee', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal brokerFee;

  BeOrderbook(this.bids, this.asks, this.minOrder, this.baseAssetWithdrawFee,
      this.quoteAssetWithdrawFee, this.brokerFee);
  factory BeOrderbook.fromJson(Map<String, dynamic> json) =>
      _$BeOrderbookFromJson(json);
  Map<String, dynamic> toJson() => _$BeOrderbookToJson(this);

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

@JsonSerializable()
class BeBalance {
  @JsonKey(name: 'symbol')
  final String asset;
  final String name;
  @JsonKey(fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal total;
  @JsonKey(fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal available;

  BeBalance(this.asset, this.name, this.total, this.available);
  factory BeBalance.fromJson(Map<String, dynamic> json) =>
      _$BeBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BeBalanceToJson(this);
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
      balances.add(BeBalance.fromJson(item));
    return BeBalancesResult(balances, BeError.none());
  }
}

class BeCryptoDepositAddressResult {
  final String? address;
  final BeError error;

  BeCryptoDepositAddressResult(this.address, this.error);

  static BeCryptoDepositAddressResult network() {
    return BeCryptoDepositAddressResult(null, BeError.network());
  }

  static BeCryptoDepositAddressResult auth(String msg) {
    return BeCryptoDepositAddressResult(null, BeError.auth(msg));
  }

  static BeCryptoDepositAddressResult parse(String data) {
    return BeCryptoDepositAddressResult(
        jsonDecode(data)['address'], BeError.none());
  }
}

@JsonSerializable()
class BeCryptoDeposit {
  final String token;
  final String asset;
  final String address;
  @JsonKey(fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal amount;
  final DateTime date;
  final bool confirmed;
  final String txid;

  BeCryptoDeposit(this.token, this.asset, this.address, this.amount, this.date,
      this.confirmed, this.txid);
  factory BeCryptoDeposit.fromJson(Map<String, dynamic> json) =>
      _$BeCryptoDepositFromJson(json);
  Map<String, dynamic> toJson() => _$BeCryptoDepositToJson(this);
}

class BeCryptoDepositsResult {
  final List<BeCryptoDeposit> deposits;
  final int offset;
  final int limit;
  final int total;
  final BeError error;

  BeCryptoDepositsResult(
      this.deposits, this.offset, this.limit, this.total, this.error);

  static BeCryptoDepositsResult network() {
    return BeCryptoDepositsResult([], 0, 0, 0, BeError.network());
  }

  static BeCryptoDepositsResult auth(String msg) {
    return BeCryptoDepositsResult([], 0, 0, 0, BeError.auth(msg));
  }

  static BeCryptoDepositsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeCryptoDeposit> deposits = [];
    for (var item in json['deposits'])
      deposits.add(BeCryptoDeposit.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeCryptoDepositsResult(
        deposits, offset, limit, total, BeError.none());
  }
}

@JsonSerializable()
class BeCryptoWithdrawal {
  final String token;
  final String asset;
  final DateTime date;
  @JsonKey(
      name: 'amount_dec', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal amount;
  final String recipient;
  final String? txid;
  final String status;

  BeCryptoWithdrawal(this.token, this.asset, this.date, this.amount,
      this.recipient, this.txid, this.status);
  factory BeCryptoWithdrawal.fromJson(Map<String, dynamic> json) =>
      _$BeCryptoWithdrawalFromJson(json);
  Map<String, dynamic> toJson() => _$BeCryptoWithdrawalToJson(this);
}

class BeCryptoWithdrawalResult {
  final BeCryptoWithdrawal? withdrawal;
  final BeError error;

  BeCryptoWithdrawalResult(this.withdrawal, this.error);

  static BeCryptoWithdrawalResult network() {
    return BeCryptoWithdrawalResult(null, BeError.network());
  }

  static BeCryptoWithdrawalResult auth(String msg) {
    return BeCryptoWithdrawalResult(null, BeError.auth(msg));
  }

  static BeCryptoWithdrawalResult parse(String data) {
    var json = jsonDecode(data);
    return BeCryptoWithdrawalResult(
        BeCryptoWithdrawal.fromJson(json['withdrawal']), BeError.none());
  }
}

class BeCryptoWithdrawalsResult {
  final List<BeCryptoWithdrawal> withdrawals;
  final int offset;
  final int limit;
  final int total;
  final BeError error;

  BeCryptoWithdrawalsResult(
      this.withdrawals, this.offset, this.limit, this.total, this.error);

  static BeCryptoWithdrawalsResult network() {
    return BeCryptoWithdrawalsResult([], 0, 0, 0, BeError.network());
  }

  static BeCryptoWithdrawalsResult auth(String msg) {
    return BeCryptoWithdrawalsResult([], 0, 0, 0, BeError.auth(msg));
  }

  static BeCryptoWithdrawalsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeCryptoWithdrawal> withdrawals = [];
    for (var item in json['withdrawals'])
      withdrawals.add(BeCryptoWithdrawal.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeCryptoWithdrawalsResult(
        withdrawals, offset, limit, total, BeError.none());
  }
}

@JsonSerializable()
class BeFiatDeposit {
  final String token;
  final String asset;
  final DateTime date;
  final DateTime expiry;
  @JsonKey(
      name: 'amount_dec', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal amount;
  final String status;
  @JsonKey(name: 'payment_url')
  final String? paymentUrl;

  BeFiatDeposit(this.token, this.asset, this.date, this.expiry, this.amount,
      this.status, this.paymentUrl);
  factory BeFiatDeposit.fromJson(Map<String, dynamic> json) =>
      _$BeFiatDepositFromJson(json);
  Map<String, dynamic> toJson() => _$BeFiatDepositToJson(this);
}

class BeFiatDepositResult {
  final BeFiatDeposit? deposit;
  final BeError error;

  BeFiatDepositResult(this.deposit, this.error);

  static BeFiatDepositResult network() {
    return BeFiatDepositResult(null, BeError.network());
  }

  static BeFiatDepositResult auth(String msg) {
    return BeFiatDepositResult(null, BeError.auth(msg));
  }

  static BeFiatDepositResult parse(String data) {
    var json = jsonDecode(data);
    return BeFiatDepositResult(
        BeFiatDeposit.fromJson(json['deposit']), BeError.none());
  }
}

class BeFiatDepositsResult {
  final List<BeFiatDeposit> deposits;
  final int offset;
  final int limit;
  final int total;
  final BeError error;

  BeFiatDepositsResult(
      this.deposits, this.offset, this.limit, this.total, this.error);

  static BeFiatDepositsResult network() {
    return BeFiatDepositsResult([], 0, 0, 0, BeError.network());
  }

  static BeFiatDepositsResult auth(String msg) {
    return BeFiatDepositsResult([], 0, 0, 0, BeError.auth(msg));
  }

  static BeFiatDepositsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeFiatDeposit> deposits = [];
    for (var item in json['deposits'])
      deposits.add(BeFiatDeposit.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeFiatDepositsResult(deposits, offset, limit, total, BeError.none());
  }
}

@JsonSerializable()
class BeFiatWithdrawal {
  final String token;
  final String asset;
  final DateTime date;
  @JsonKey(
      name: 'amount_dec', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal amount;
  final String recipient;
  final String status;

  BeFiatWithdrawal(this.token, this.asset, this.date, this.amount,
      this.recipient, this.status);
  factory BeFiatWithdrawal.fromJson(Map<String, dynamic> json) =>
      _$BeFiatWithdrawalFromJson(json);
  Map<String, dynamic> toJson() => _$BeFiatWithdrawalToJson(this);
}

class BeFiatWithdrawalResult {
  final BeFiatWithdrawal? withdrawal;
  final BeError error;

  BeFiatWithdrawalResult(this.withdrawal, this.error);

  static BeFiatWithdrawalResult network() {
    return BeFiatWithdrawalResult(null, BeError.network());
  }

  static BeFiatWithdrawalResult auth(String msg) {
    return BeFiatWithdrawalResult(null, BeError.auth(msg));
  }

  static BeFiatWithdrawalResult parse(String data) {
    var json = jsonDecode(data);
    return BeFiatWithdrawalResult(
        BeFiatWithdrawal.fromJson(json['withdrawal']), BeError.none());
  }
}

class BeFiatWithdrawalsResult {
  final List<BeFiatWithdrawal> withdrawals;
  final int offset;
  final int limit;
  final int total;
  final BeError error;

  BeFiatWithdrawalsResult(
      this.withdrawals, this.offset, this.limit, this.total, this.error);

  static BeFiatWithdrawalsResult network() {
    return BeFiatWithdrawalsResult([], 0, 0, 0, BeError.network());
  }

  static BeFiatWithdrawalsResult auth(String msg) {
    return BeFiatWithdrawalsResult([], 0, 0, 0, BeError.auth(msg));
  }

  static BeFiatWithdrawalsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeFiatWithdrawal> withdrawals = [];
    for (var item in json['withdrawals'])
      withdrawals.add(BeFiatWithdrawal.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeFiatWithdrawalsResult(
        withdrawals, offset, limit, total, BeError.none());
  }
}

@JsonSerializable()
class BeAddressBookEntry {
  final DateTime date;
  final String recipient;
  final String? description;

  BeAddressBookEntry(this.date, this.recipient, this.description);
  factory BeAddressBookEntry.fromJson(Map<String, dynamic> json) =>
      _$BeAddressBookEntryFromJson(json);
  Map<String, dynamic> toJson() => _$BeAddressBookEntryToJson(this);
}

class BeAddressBookResult {
  final List<BeAddressBookEntry> entries;
  final BeError error;

  BeAddressBookResult(this.entries, this.error);

  static BeAddressBookResult parse(String data) {
    var json = jsonDecode(data);
    List<BeAddressBookEntry> entries = [];
    for (var item in json['entries'])
      entries.add(BeAddressBookEntry.fromJson(item));
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
  @JsonKey(
      name: 'base_amount', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal baseAmount;
  @JsonKey(
      name: 'quote_amount', fromJson: _decimalFromJson, toJson: _decimalToJson)
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
    var info = UserInfo.fromJson(jsonDecode(response.body));
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
    return BeOrderbookResult(
        BeOrderbook.fromJson(jsonDecode(response.body)), BeError.none());
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

Future<BeCryptoDepositAddressResult> beCryptoDepositAddress(
    String asset) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeCryptoDepositAddressResult.network();
  var url = baseUrl + "crypto_deposit_address";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "asset": asset});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeCryptoDepositAddressResult.network();
  if (response.statusCode == 200) {
    return BeCryptoDepositAddressResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoDepositAddressResult.auth(response.body);
  print(response.statusCode);
  return BeCryptoDepositAddressResult.network();
}

Future<BeCryptoDepositsResult> beCryptoDeposits(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeCryptoDepositsResult.network();
  var url = baseUrl + "crypto_deposits";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "offset": offset,
    "limit": limit
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeCryptoDepositsResult.network();
  if (response.statusCode == 200) {
    return BeCryptoDepositsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoDepositsResult.auth(response.body);
  print(response.statusCode);
  return BeCryptoDepositsResult.network();
}

Future<BeCryptoWithdrawalResult> beCryptoWithdrawalCreate(
    String asset,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeCryptoWithdrawalResult.network();
  var url = baseUrl + "crypto_withdrawal_create";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "amount_dec": amount.toString(),
    "recipient": recipient,
    "save_recipient": saveRecipient,
    "recipient_description": recipientDescription,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeCryptoWithdrawalResult.network();
  if (response.statusCode == 200) {
    return BeCryptoWithdrawalResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoWithdrawalResult.auth(response.body);
  print(response.statusCode);
  return BeCryptoWithdrawalResult.network();
}

Future<BeCryptoWithdrawalsResult> beCryptoWithdrawals(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeCryptoWithdrawalsResult.network();
  var url = baseUrl + "crypto_withdrawals";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "offset": offset,
    "limit": limit
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeCryptoWithdrawalsResult.network();
  if (response.statusCode == 200) {
    return BeCryptoWithdrawalsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoWithdrawalsResult.auth(response.body);
  print(response.statusCode);
  return BeCryptoWithdrawalsResult.network();
}

Future<BeFiatDepositResult> beFiatDepositCreate(
    String asset, Decimal amount) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatDepositResult.network();
  var url = baseUrl + "fiat_deposit_create";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "amount_dec": amount.toString()
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeFiatDepositResult.network();
  if (response.statusCode == 200) {
    return BeFiatDepositResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatDepositResult.auth(response.body);
  print(response.statusCode);
  return BeFiatDepositResult.network();
}

Future<BeFiatDepositsResult> beFiatDeposits(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatDepositsResult.network();
  var url = baseUrl + "fiat_deposits";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "offset": offset,
    "limit": limit
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeFiatDepositsResult.network();
  if (response.statusCode == 200) {
    return BeFiatDepositsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatDepositsResult.auth(response.body);
  print(response.statusCode);
  return BeFiatDepositsResult.network();
}

Future<BeFiatWithdrawalResult> beFiatWithdrawalCreate(
    String asset,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatWithdrawalResult.network();
  var url = baseUrl + "fiat_withdrawal_create";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "amount_dec": amount.toString(),
    "recipient": recipient,
    "save_recipient": saveRecipient,
    "recipient_description": recipientDescription,
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeFiatWithdrawalResult.network();
  if (response.statusCode == 200) {
    return BeFiatWithdrawalResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatWithdrawalResult.auth(response.body);
  print(response.statusCode);
  return BeFiatWithdrawalResult.network();
}

Future<BeFiatWithdrawalsResult> beFiatWithdrawals(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatWithdrawalsResult.network();
  var url = baseUrl + "fiat_withdrawals";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({
    "api_key": apikey,
    "nonce": nonce,
    "asset": asset,
    "offset": offset,
    "limit": limit
  });
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeFiatWithdrawalsResult.network();
  if (response.statusCode == 200) {
    return BeFiatWithdrawalsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatWithdrawalsResult.auth(response.body);
  print(response.statusCode);
  return BeFiatWithdrawalsResult.network();
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
