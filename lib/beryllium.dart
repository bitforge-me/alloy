import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/hmac.dart';
import 'package:zapdart/account_forms.dart';

import 'config.dart';
import 'prefs.dart';
import 'utils.dart';

part 'beryllium.g.dart';
part 'beryllium.freezed.dart';

Decimal _decimalFromJson(input) => Decimal.parse(input);
String _decimalToJson(input) => input.toString();

Future<String?> _server() async {
  var testnet = await Prefs.testnetGet();
  var baseUrl = testnet ? BeServerTestnet : BeServerMainnet;
  if (baseUrl != null) baseUrl = baseUrl + 'apiv1/';
  return baseUrl;
}

enum BePermission { receive, balance, history, transfer, issue }
enum BeRole { admin, proposer, authorizer }

@freezed
class BeError2 with _$BeError2 {
  const factory BeError2.network() = Network;
  const factory BeError2.auth(String message) = Auth;
  // helper to parse the '{"message": "<MSG>"}' json if exists
  static authParseMsg(String message) {
    try {
      var json = jsonDecode(message);
      return BeError2.auth(json['message']);
    } catch (_) {
      return BeError2.auth(message);
    }
  }

  static String msg(BeError2 err) {
    return err.when<String>(network: () => 'network error', auth: (msg) => msg);
  }
}

@freezed
class ErrorResult with _$ErrorResult {
  const factory ErrorResult() = _ErrorResult;
  const factory ErrorResult.error(BeError2 err) = _ErrorResultErr;
  static network() => ErrorResult.error(BeError2.network());
  static auth(String message) =>
      ErrorResult.error(BeError2.authParseMsg(message));
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

@freezed
class UserInfoResult with _$UserInfoResult {
  const factory UserInfoResult(UserInfo info) = _UserInfo;
  const factory UserInfoResult.error(BeError2 err) = _UserInfoErr;
}

@freezed
class BeTwoFactorEnabledResult with _$BeTwoFactorEnabledResult {
  const factory BeTwoFactorEnabledResult(bool enabled) =
      _BeTwoFactorEnabledResult;
  const factory BeTwoFactorEnabledResult.error(BeError2 err) =
      _BeTwoFactorEnabledResultErr;

  static BeTwoFactorEnabledResult parse(String data) {
    var json = jsonDecode(data);
    var tfEnabled = json['tf_enabled'];
    return BeTwoFactorEnabledResult(tfEnabled);
  }
}

class BeApiKey {
  final String token;
  final String secret;

  BeApiKey(this.token, this.secret);
}

@freezed
class BeApiKeyResult with _$BeApiKeyResult {
  const factory BeApiKeyResult(BeApiKey apikey) = _BeApiKeyResult;
  const factory BeApiKeyResult.error(BeError2 err) = _BeApiKeyResultErr;
}

@freezed
class BeApiKeyRequestResult with _$BeApiKeyRequestResult {
  const factory BeApiKeyRequestResult(String token) = _BeApiKeyRequestResult;
  const factory BeApiKeyRequestResult.error(BeError2 err) =
      _BeApiKeyRequestResulttErr;
}

@freezed
class BeKycRequestCreateResult with _$BeKycRequestCreateResult {
  const factory BeKycRequestCreateResult(String kycUrl) =
      _BeKycRequestCreateResult;
  const factory BeKycRequestCreateResult.error(BeError2 err) =
      _BeKycRequestCreateResultErr;
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

@freezed
class BeTwoFactorResult with _$BeTwoFactorResult {
  const factory BeTwoFactorResult(BeTwoFactor twoFactor) = _BeTwoFactorResult;
  const factory BeTwoFactorResult.error(BeError2 err) = _BeTwoFactorResultErr;

  static BeTwoFactorResult parse(String data) {
    var json = jsonDecode(data);
    var method = json['method'];
    BeTwoFactorSetup? setup;
    if (json['setup'] != null) setup = BeTwoFactorSetup.fromJson(json['setup']);
    return BeTwoFactorResult(BeTwoFactor(method, setup));
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

@freezed
class BeAssetResult with _$BeAssetResult {
  const factory BeAssetResult(List<BeAsset> assets) = _BeAssetResult;
  const factory BeAssetResult.error(BeError2 err) = _BeAssetResultErr;

  static BeAssetResult parse(String data) {
    var assets = BeAsset.parseAssets(jsonDecode(data)['assets']);
    return BeAssetResult(assets);
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

@freezed
class BeMarketResult with _$BeMarketResult {
  const factory BeMarketResult(List<BeMarket> markets) = _BeMarketResult;
  const factory BeMarketResult.error(BeError2 err) = _BeMarketResultErr;

  static BeMarketResult parse(String data) {
    var markets = BeMarket.parseMarkets(jsonDecode(data)['markets']);
    return BeMarketResult(markets);
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
}

@freezed
class BeOrderbookResult with _$BeOrderbookResult {
  const factory BeOrderbookResult(BeOrderbook orderbook) = _BeOrderbookResult;
  const factory BeOrderbookResult.error(BeError2 err) = _BeOrderbookResultErr;
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

@freezed
class BeBalancesResult with _$BeBalancesResult {
  const factory BeBalancesResult(List<BeBalance> balances) = _BeBalancesResult;
  const factory BeBalancesResult.error(BeError2 err) = _BeBalancesResultErr;

  static BeBalancesResult parse(String data) {
    List<BeBalance> balances = [];
    for (var item in jsonDecode(data)['balances'])
      balances.add(BeBalance.fromJson(item));
    return BeBalancesResult(balances);
  }
}

@freezed
class BeCryptoDepositAddressResult with _$BeCryptoDepositAddressResult {
  const factory BeCryptoDepositAddressResult(String address) =
      _BeCryptoDepositAddressResult;
  const factory BeCryptoDepositAddressResult.error(BeError2 err) =
      _BeCryptoDepositAddressResultErr;

  static BeCryptoDepositAddressResult parse(String data) {
    return BeCryptoDepositAddressResult(jsonDecode(data)['address']);
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

@freezed
class BeCryptoDepositsResult with _$BeCryptoDepositsResult {
  const factory BeCryptoDepositsResult(
          List<BeCryptoDeposit> deposits, int offset, int limit, int total) =
      _BeCryptoDepositsResult;
  const factory BeCryptoDepositsResult.error(BeError2 err) =
      _BeCryptoDepositsResultErr;

  static BeCryptoDepositsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeCryptoDeposit> deposits = [];
    for (var item in json['deposits'])
      deposits.add(BeCryptoDeposit.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeCryptoDepositsResult(deposits, offset, limit, total);
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

@freezed
class BeCryptoWithdrawalResult with _$BeCryptoWithdrawalResult {
  const factory BeCryptoWithdrawalResult(BeCryptoWithdrawal withdrawal) =
      _BeCryptoWithdrawalResult;
  const factory BeCryptoWithdrawalResult.error(BeError2 err) =
      _BeCryptoWithdrawalResultErr;

  static BeCryptoWithdrawalResult parse(String data) {
    var json = jsonDecode(data);
    return BeCryptoWithdrawalResult(
        BeCryptoWithdrawal.fromJson(json['withdrawal']));
  }
}

@freezed
class BeCryptoWithdrawalsResult with _$BeCryptoWithdrawalsResult {
  const factory BeCryptoWithdrawalsResult(List<BeCryptoWithdrawal> withdrawals,
      int offset, int limit, int total) = _BeCryptoWithdrawalsResult;
  const factory BeCryptoWithdrawalsResult.error(BeError2 err) =
      _BeCryptoWithdrawalsResultErr;

  static BeCryptoWithdrawalsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeCryptoWithdrawal> withdrawals = [];
    for (var item in json['withdrawals'])
      withdrawals.add(BeCryptoWithdrawal.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeCryptoWithdrawalsResult(withdrawals, offset, limit, total);
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

@freezed
class BeFiatDepositResult with _$BeFiatDepositResult {
  const factory BeFiatDepositResult(BeFiatDeposit deposit) =
      _BeFiatDepositResult;
  const factory BeFiatDepositResult.error(BeError2 err) =
      _BeFiatDepositResultErr;

  static BeFiatDepositResult parse(String data) {
    var json = jsonDecode(data);
    return BeFiatDepositResult(BeFiatDeposit.fromJson(json['deposit']));
  }
}

@freezed
class BeFiatDepositsResult with _$BeFiatDepositsResult {
  const factory BeFiatDepositsResult(
          List<BeFiatDeposit> deposits, int offset, int limit, int total) =
      _BeFiatDepositsResult;
  const factory BeFiatDepositsResult.error(BeError2 err) =
      _BeFiatDepositsResultErr;

  static BeFiatDepositsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeFiatDeposit> deposits = [];
    for (var item in json['deposits'])
      deposits.add(BeFiatDeposit.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeFiatDepositsResult(deposits, offset, limit, total);
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

@freezed
class BeFiatWithdrawalResult with _$BeFiatWithdrawalResult {
  const factory BeFiatWithdrawalResult(BeFiatWithdrawal withdrawal) =
      _BeFiatWithdrawalResult;
  const factory BeFiatWithdrawalResult.error(BeError2 err) =
      _BeFiatWithdrawalResultErr;

  static BeFiatWithdrawalResult parse(String data) {
    var json = jsonDecode(data);
    return BeFiatWithdrawalResult(
        BeFiatWithdrawal.fromJson(json['withdrawal']));
  }
}

@freezed
class BeFiatWithdrawalsResult with _$BeFiatWithdrawalsResult {
  const factory BeFiatWithdrawalsResult(List<BeFiatWithdrawal> withdrawals,
      int offset, int limit, int total) = _BeFiatWithdrawalsResult;
  const factory BeFiatWithdrawalsResult.error(BeError2 err) =
      _BeFiatWithdrawalsResultErr;

  static BeFiatWithdrawalsResult parse(String data) {
    var json = jsonDecode(data);
    List<BeFiatWithdrawal> withdrawals = [];
    for (var item in json['withdrawals'])
      withdrawals.add(BeFiatWithdrawal.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeFiatWithdrawalsResult(withdrawals, offset, limit, total);
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

@freezed
class BeAddressBookResult with _$BeAddressBookResult {
  const factory BeAddressBookResult(List<BeAddressBookEntry> entries) =
      _BeAddressBookResult;
  const factory BeAddressBookResult.error(BeError2 err) =
      _BeAddressBookResultErr;

  static BeAddressBookResult parse(String data) {
    var json = jsonDecode(data);
    List<BeAddressBookEntry> entries = [];
    for (var item in json['entries'])
      entries.add(BeAddressBookEntry.fromJson(item));
    return BeAddressBookResult(entries);
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

@JsonSerializable()
class BeBrokerOrder {
  final String token;
  final DateTime date;
  final DateTime expiry;
  final String market;
  final BeMarketSide side;
  @JsonKey(name: 'base_asset')
  final String baseAsset;
  @JsonKey(name: 'quote_asset')
  final String quoteAsset;
  @JsonKey(
      name: 'base_amount_dec',
      fromJson: _decimalFromJson,
      toJson: _decimalToJson)
  final Decimal baseAmount;
  @JsonKey(
      name: 'quote_amount_dec',
      fromJson: _decimalFromJson,
      toJson: _decimalToJson)
  final Decimal quoteAmount;
  final String recipient;
  final BeOrderStatus status;
  @JsonKey(name: 'payment_url')
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

  factory BeBrokerOrder.fromJson(Map<String, dynamic> json) =>
      _$BeBrokerOrderFromJson(json);
  Map<String, dynamic> toJson() => _$BeBrokerOrderToJson(this);
}

@freezed
class BeBrokerOrderResult with _$BeBrokerOrderResult {
  const factory BeBrokerOrderResult(BeBrokerOrder order) = _BeBrokerOrderResult;
  const factory BeBrokerOrderResult.error(BeError2 err) =
      _BeBrokerOrderResultErr;

  static BeBrokerOrderResult parse(String data) {
    var json = jsonDecode(data);
    BeBrokerOrder order = BeBrokerOrder.fromJson(json['broker_order']);
    return BeBrokerOrderResult(order);
  }
}

@freezed
class BeBrokerOrdersResult with _$BeBrokerOrdersResult {
  const factory BeBrokerOrdersResult(
          List<BeBrokerOrder> orders, int offset, int limit, int total) =
      _BeBrokerOrdersResult;
  const factory BeBrokerOrdersResult.error(BeError2 err) =
      _BeBrokerOrdersResultErr;

  static BeBrokerOrdersResult parse(String data) {
    var json = jsonDecode(data);
    List<BeBrokerOrder> orderList = [];
    var orders = json['broker_orders'];
    for (var item in orders) orderList.add(BeBrokerOrder.fromJson(item));
    var offset = json['offset'];
    var limit = json['limit'];
    var total = json['total'];
    return BeBrokerOrdersResult(orderList, offset, limit, total);
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

Future<ErrorResult> beUserRegister(AccountRegistration reg) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ErrorResult.network();
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
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult();
  } else if (response.statusCode == 400)
    return BeError2.authParseMsg(response.body);
  print(response.statusCode);
  return ErrorResult.network();
}

Future<BeTwoFactorEnabledResult> beUserTwoFactorEnabledCheck(
    String email, String password) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeTwoFactorEnabledResult.error(BeError2.network());
  var url = baseUrl + "user_two_factor_enabled_check";
  var body = jsonEncode({"email": email, "password": password});
  var response = await postAndCatch(url, body);
  if (response == null)
    return BeTwoFactorEnabledResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeTwoFactorEnabledResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorEnabledResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeTwoFactorEnabledResult.error(BeError2.network());
}

Future<BeApiKeyResult> beApiKeyCreate(
    String email, String password, String deviceName, String tfCode) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyResult.error(BeError2.network());
  var url = baseUrl + "api_key_create";
  var body = jsonEncode({
    "email": email,
    "password": password,
    "device_name": deviceName,
    "tf_code": tfCode
  });
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = BeApiKey(jsnObj["token"], jsnObj["secret"]);
    return BeApiKeyResult(info);
  } else if (response.statusCode == 400)
    return BeApiKeyResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeApiKeyResult.error(BeError2.network());
}

Future<BeApiKeyRequestResult> beApiKeyRequest(
    String email, String deviceName) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyRequestResult.error(BeError2.network());
  var url = baseUrl + "api_key_request";
  var body = jsonEncode({"email": email, "device_name": deviceName});
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyRequestResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var token = jsnObj["token"];
    return BeApiKeyRequestResult(token);
  } else if (response.statusCode == 400)
    return BeApiKeyRequestResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeApiKeyRequestResult.error(BeError2.network());
}

Future<BeApiKeyResult> beApiKeyClaim(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeApiKeyResult.error(BeError2.network());
  var url = baseUrl + "api_key_claim";
  var body = jsonEncode({"token": token});
  var response = await postAndCatch(url, body);
  if (response == null) return BeApiKeyResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    var info = BeApiKey(jsnObj["token"], jsnObj["secret"]);
    return BeApiKeyResult(info);
  } else if (response.statusCode == 400)
    return BeApiKeyResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeApiKeyResult.error(BeError2.network());
}

Future<UserInfoResult> beUserInfo({String? email}) async {
  var baseUrl = await _server();
  if (baseUrl == null) return UserInfoResult.error(BeError2.network());
  var url = baseUrl + "user_info";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return UserInfoResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var info = UserInfo.fromJson(jsonDecode(response.body));
    return UserInfoResult(info);
  } else if (response.statusCode == 400)
    return UserInfoResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return UserInfoResult.error(BeError2.network());
}

Future<ErrorResult> beUserResetPassword() async {
  var baseUrl = await _server();
  if (baseUrl == null) return ErrorResult.network();
  var url = baseUrl + "user_reset_password";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult();
  } else if (response.statusCode == 400) return ErrorResult.auth(response.body);
  print(response.statusCode);
  return ErrorResult.network();
}

Future<ErrorResult> beUserUpdateEmail(String email) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ErrorResult.network();
  var url = baseUrl + "user_update_email";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "email": email});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult();
  } else if (response.statusCode == 400) return ErrorResult.auth(response.body);
  print(response.statusCode);
  return ErrorResult.network();
}

Future<ErrorResult> beUserUpdatePassword(
    String currentPassword, String newPassword) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ErrorResult.network();
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
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult();
  } else if (response.statusCode == 400) return ErrorResult.auth(response.body);
  print(response.statusCode);
  return ErrorResult.network();
}

Future<ErrorResult> beUserUpdatePhoto(String? photo, String? photoType) async {
  var baseUrl = await _server();
  if (baseUrl == null) return ErrorResult.network();
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
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult();
  } else if (response.statusCode == 400) return ErrorResult.auth(response.body);
  print(response.statusCode);
  return ErrorResult.network();
}

Future<BeKycRequestCreateResult> beKycRequestCreate() async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeKycRequestCreateResult.error(BeError2.network());
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
    return BeKycRequestCreateResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    return BeKycRequestCreateResult(jsnObj['kyc_url']);
  } else if (response.statusCode == 400)
    return BeKycRequestCreateResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeKycRequestCreateResult.error(BeError2.network());
}

Future<BeKycRequestCreateResult> beKycRequestSendMobileNumber(
    String mobileNumber) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeKycRequestCreateResult.error(BeError2.network());
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
    return BeKycRequestCreateResult.error(BeError2.network());
  if (response.statusCode == 200) {
    var jsnObj = json.decode(response.body);
    return BeKycRequestCreateResult(jsnObj['kyc_url']);
  } else if (response.statusCode == 400)
    return BeKycRequestCreateResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeKycRequestCreateResult.error(BeError2.network());
}

Future<BeTwoFactorResult> beUserTwoFactorEnable(String? code) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeTwoFactorResult.error(BeError2.network());
  var url = baseUrl + "user_two_factor_enable";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "code": code});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeTwoFactorResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeTwoFactorResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeTwoFactorResult.error(BeError2.network());
}

Future<BeTwoFactorResult> beUserTwoFactorDisable(String? code) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeTwoFactorResult.error(BeError2.network());
  var url = baseUrl + "user_two_factor_disable";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "code": code});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeTwoFactorResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeTwoFactorResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeTwoFactorResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeTwoFactorResult.error(BeError2.network());
}

Future<BeAssetResult> beAssets() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeAssetResult.error(BeError2.network());
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
  if (response == null) return BeAssetResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeAssetResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeAssetResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeAssetResult.error(BeError2.network());
}

Future<BeMarketResult> beMarkets() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeMarketResult.error(BeError2.network());
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
  if (response == null) return BeMarketResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeMarketResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeMarketResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeMarketResult.error(BeError2.network());
}

Future<BeOrderbookResult> beOrderbook(String market) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeOrderbookResult.error(BeError2.network());
  var url = baseUrl + "order_book";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "market": market});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeOrderbookResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeOrderbookResult(BeOrderbook.fromJson(jsonDecode(response.body)));
  } else if (response.statusCode == 400)
    return BeOrderbookResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeOrderbookResult.error(BeError2.network());
}

Future<BeBalancesResult> beBalances() async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBalancesResult.error(BeError2.network());
  var url = baseUrl + "balances";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeBalancesResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeBalancesResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBalancesResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeBalancesResult.error(BeError2.network());
}

Future<BeCryptoDepositAddressResult> beCryptoDepositAddress(
    String asset) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeCryptoDepositAddressResult.error(BeError2.network());
  var url = baseUrl + "crypto_deposit_address";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "asset": asset});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null)
    return BeCryptoDepositAddressResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeCryptoDepositAddressResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoDepositAddressResult.error(
        BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeCryptoDepositAddressResult.error(BeError2.network());
}

Future<BeCryptoDepositsResult> beCryptoDeposits(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeCryptoDepositsResult.error(BeError2.network());
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
  if (response == null) return BeCryptoDepositsResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeCryptoDepositsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoDepositsResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeCryptoDepositsResult.error(BeError2.network());
}

Future<BeCryptoWithdrawalResult> beCryptoWithdrawalCreate(
    String asset,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeCryptoWithdrawalResult.error(BeError2.network());
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
  if (response == null)
    return BeCryptoWithdrawalResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeCryptoWithdrawalResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoWithdrawalResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeCryptoWithdrawalResult.error(BeError2.network());
}

Future<BeCryptoWithdrawalsResult> beCryptoWithdrawals(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null)
    return BeCryptoWithdrawalsResult.error(BeError2.network());
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
  if (response == null)
    return BeCryptoWithdrawalsResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeCryptoWithdrawalsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeCryptoWithdrawalsResult.error(
        BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeCryptoWithdrawalsResult.error(BeError2.network());
}

Future<BeFiatDepositResult> beFiatDepositCreate(
    String asset, Decimal amount) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatDepositResult.error(BeError2.network());
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
  if (response == null) return BeFiatDepositResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeFiatDepositResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatDepositResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeFiatDepositResult.error(BeError2.network());
}

Future<BeFiatDepositsResult> beFiatDeposits(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatDepositsResult.error(BeError2.network());
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
  if (response == null) return BeFiatDepositsResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeFiatDepositsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatDepositsResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeFiatDepositsResult.error(BeError2.network());
}

Future<BeFiatWithdrawalResult> beFiatWithdrawalCreate(
    String asset,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatWithdrawalResult.error(BeError2.network());
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
  if (response == null) return BeFiatWithdrawalResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeFiatWithdrawalResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatWithdrawalResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeFiatWithdrawalResult.error(BeError2.network());
}

Future<BeFiatWithdrawalsResult> beFiatWithdrawals(
    String asset, int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeFiatWithdrawalsResult.error(BeError2.network());
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
  if (response == null)
    return BeFiatWithdrawalsResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeFiatWithdrawalsResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeFiatWithdrawalsResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeFiatWithdrawalsResult.error(BeError2.network());
}

Future<BeAddressBookResult> beAddressBook(String asset) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeAddressBookResult.error(BeError2.network());
  var url = baseUrl + "address_book";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "asset": asset});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeAddressBookResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeAddressBookResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeAddressBookResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeAddressBookResult.error(BeError2.network());
}

Future<BeBrokerOrderResult> beOrderCreate(
    String market,
    BeMarketSide side,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String? recipientDescription) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBrokerOrderResult.error(BeError2.network());
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
  if (response == null) return BeBrokerOrderResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult.error(BeError2.network());
}

Future<BeBrokerOrderResult> beOrderAccept(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBrokerOrderResult.error(BeError2.network());
  var url = baseUrl + "broker_order_accept";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeBrokerOrderResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult.error(BeError2.network());
}

Future<BeBrokerOrderResult> beOrderStatus(String token) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBrokerOrderResult.error(BeError2.network());
  var url = baseUrl + "broker_order_status";
  var apikey = await Prefs.beApiKeyGet();
  var apisecret = await Prefs.beApiSecretGet();
  checkApiKey(apikey, apisecret);
  var nonce = nextNonce();
  var body = jsonEncode({"api_key": apikey, "nonce": nonce, "token": token});
  var sig = createHmacSig(apisecret!, body);
  var response =
      await postAndCatch(url, body, extraHeaders: {"X-Signature": sig});
  if (response == null) return BeBrokerOrderResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeBrokerOrderResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrderResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeBrokerOrderResult.error(BeError2.network());
}

Future<BeBrokerOrdersResult> beOrderList(int offset, int limit) async {
  var baseUrl = await _server();
  if (baseUrl == null) return BeBrokerOrdersResult.error(BeError2.network());
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
  if (response == null) return BeBrokerOrdersResult.error(BeError2.network());
  if (response.statusCode == 200) {
    return BeBrokerOrdersResult.parse(response.body);
  } else if (response.statusCode == 400)
    return BeBrokerOrdersResult.error(BeError2.authParseMsg(response.body));
  print(response.statusCode);
  return BeBrokerOrdersResult.error(BeError2.network());
}
