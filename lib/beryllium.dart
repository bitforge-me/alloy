import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/hmac.dart';

import 'login.dart';
import 'config.dart';
import 'prefs.dart';
import 'utils.dart';

part 'beryllium.g.dart';
part 'beryllium.freezed.dart';

final log = Logger('Beryllium');
Decimal _decimalFromJson(input) => Decimal.parse(input);
String _decimalToJson(input) => input.toString();

enum BePermission { receive, balance, history, transfer, issue }

enum BeRole { admin, proposer, authorizer }

@freezed
class BeError with _$BeError {
  const factory BeError.network() = Network;
  const factory BeError.auth(String message) = Auth;
  const factory BeError.format() = Format;
  // helper to parse the '{"message": "<MSG>"}' json if exists
  static BeError authParseMsg(String message) {
    try {
      var json = jsonDecode(message);
      return BeError.auth(json['message']);
    } catch (_) {
      return BeError.auth(message);
    }
  }

  static String msg(BeError err) {
    return err.when<String>(
        network: () => 'network error',
        auth: (msg) => msg,
        format: () => 'format error');
  }
}

@freezed
class ErrorResult with _$ErrorResult {
  const factory ErrorResult(String content) = _ErrorResult;
  const factory ErrorResult.error(BeError err) = _ErrorResultErr;
  static network() => ErrorResult.error(BeError.network());
  static auth(String message) =>
      ErrorResult.error(BeError.authParseMsg(message));
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
  const factory UserInfoResult.error(BeError err) = _UserInfoErr;

  static UserInfoResult parse(String data) {
    try {
      var info = UserInfo.fromJson(jsonDecode(data));
      return UserInfoResult(info);
    } catch (_) {
      return UserInfoResult.error(BeError.format());
    }
  }
}

@freezed
class BeTwoFactorEnabledResult with _$BeTwoFactorEnabledResult {
  const factory BeTwoFactorEnabledResult(bool enabled) =
      _BeTwoFactorEnabledResult;
  const factory BeTwoFactorEnabledResult.error(BeError err) =
      _BeTwoFactorEnabledResultErr;

  static BeTwoFactorEnabledResult parse(String data) {
    try {
      var json = jsonDecode(data);
      var tfEnabled = json['tf_enabled'];
      return BeTwoFactorEnabledResult(tfEnabled);
    } catch (_) {
      return BeTwoFactorEnabledResult.error(BeError.format());
    }
  }
}

@freezed
class BeVersionResult with _$BeVersionResult {
  const factory BeVersionResult(int serverVersion, int clientVersionDeployed) =
      _BeVersionResult;
  const factory BeVersionResult.error(BeError err) = _BeVersionResultErr;

  static BeVersionResult parse(String data) {
    try {
      var jsnObj = json.decode(data);
      return BeVersionResult(
          jsnObj["server_version"], jsnObj["client_version_deployed"]);
    } catch (_) {
      return BeVersionResult.error(BeError.format());
    }
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
  const factory BeApiKeyResult.error(BeError err) = _BeApiKeyResultErr;

  static BeApiKeyResult parse(String data) {
    try {
      var jsnObj = json.decode(data);
      return BeApiKeyResult(BeApiKey(jsnObj["token"], jsnObj["secret"]));
    } catch (_) {
      return BeApiKeyResult.error(BeError.format());
    }
  }
}

@freezed
class BeApiKeyRequestResult with _$BeApiKeyRequestResult {
  const factory BeApiKeyRequestResult(String token) = _BeApiKeyRequestResult;
  const factory BeApiKeyRequestResult.error(BeError err) =
      _BeApiKeyRequestResulttErr;

  static BeApiKeyRequestResult parse(String data) {
    try {
      var jsnObj = json.decode(data);
      var token = jsnObj["token"];
      return BeApiKeyRequestResult(token);
    } catch (_) {
      return BeApiKeyRequestResult.error(BeError.format());
    }
  }
}

@freezed
class BeKycRequestCreateResult with _$BeKycRequestCreateResult {
  const factory BeKycRequestCreateResult(String kycUrl) =
      _BeKycRequestCreateResult;
  const factory BeKycRequestCreateResult.error(BeError err) =
      _BeKycRequestCreateResultErr;

  static BeKycRequestCreateResult parse(String data) {
    try {
      var jsnObj = json.decode(data);
      return BeKycRequestCreateResult(jsnObj['kyc_url']);
    } catch (_) {
      return BeKycRequestCreateResult.error(BeError.format());
    }
  }
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
  const factory BeTwoFactorResult.error(BeError err) = _BeTwoFactorResultErr;

  static BeTwoFactorResult parse(String data) {
    try {
      var json = jsonDecode(data);
      var method = json['method'];
      BeTwoFactorSetup? setup;
      if (json['setup'] != null)
        setup = BeTwoFactorSetup.fromJson(json['setup']);
      return BeTwoFactorResult(BeTwoFactor(method, setup));
    } catch (_) {
      return BeTwoFactorResult.error(BeError.format());
    }
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
  @JsonKey(name: 'withdraw_fee_fixed')
  final bool withdrawFeeFixed;
  @JsonKey(
      name: 'min_withdraw', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal minWithdraw;
  @JsonKey(name: 'is_crypto')
  final bool isCrypto;
  @JsonKey(name: 'l2_network')
  final BeAsset? l2Network;
  @JsonKey(name: 'deposit_instr')
  final String? depositInstr;
  @JsonKey(name: 'withdraw_instr')
  final String? withdrawInstr;

  BeAsset(
      this.symbol,
      this.name,
      this.decimals,
      this.withdrawFee,
      this.withdrawFeeFixed,
      this.minWithdraw,
      this.isCrypto,
      this.l2Network,
      this.depositInstr,
      this.withdrawInstr);
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
  const factory BeAssetResult.error(BeError err) = _BeAssetResultErr;

  static BeAssetResult parse(String data) {
    try {
      var assets = BeAsset.parseAssets(jsonDecode(data)['assets']);
      return BeAssetResult(assets);
    } catch (_) {
      return BeAssetResult.error(BeError.format());
    }
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
  @JsonKey(
      name: 'min_trade', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal minTrade;
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
  const factory BeMarketResult.error(BeError err) = _BeMarketResultErr;

  static BeMarketResult parse(String data) {
    try {
      var markets = BeMarket.parseMarkets(jsonDecode(data)['markets']);
      return BeMarketResult(markets);
    } catch (_) {
      return BeMarketResult.error(BeError.format());
    }
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

  BeOrderbook(this.bids, this.asks, this.baseAssetWithdrawFee,
      this.quoteAssetWithdrawFee, this.brokerFee);
  factory BeOrderbook.fromJson(Map<String, dynamic> json) =>
      _$BeOrderbookFromJson(json);
  Map<String, dynamic> toJson() => _$BeOrderbookToJson(this);
}

@freezed
class BeOrderbookResult with _$BeOrderbookResult {
  const factory BeOrderbookResult(BeOrderbook orderbook) = _BeOrderbookResult;
  const factory BeOrderbookResult.error(BeError err) = _BeOrderbookResultErr;

  static BeOrderbookResult parse(String data) {
    try {
      return BeOrderbookResult(BeOrderbook.fromJson(jsonDecode(data)));
    } catch (_) {
      return BeOrderbookResult.error(BeError.format());
    }
  }
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
  const factory BeBalancesResult.error(BeError err) = _BeBalancesResultErr;

  static BeBalancesResult parse(String data) {
    try {
      List<BeBalance> balances = [];
      for (var item in jsonDecode(data)['balances'].values)
        balances.add(BeBalance.fromJson(item));
      return BeBalancesResult(balances);
    } catch (_) {
      return BeBalancesResult.error(BeError.format());
    }
  }
}

@freezed
class BeBalanceResult with _$BeBalanceResult {
  const factory BeBalanceResult(BeBalance? balance) = _BeBalanceResult;
  const factory BeBalanceResult.error(BeError err) = _BeBalanceResultErr;
}

@freezed
class BeCryptoDepositRecipientResult with _$BeCryptoDepositRecipientResult {
  const factory BeCryptoDepositRecipientResult(
          String recipient, String asset, String? l2Network) =
      _BeCryptoDepositRecipientResult;
  const factory BeCryptoDepositRecipientResult.error(BeError err) =
      _BeCryptoDepositRecipientResultErr;

  static BeCryptoDepositRecipientResult parse(String data) {
    try {
      var json = jsonDecode(data);
      return BeCryptoDepositRecipientResult(
          json['recipient'], json['asset'], json['l2_network']);
    } catch (_) {
      return BeCryptoDepositRecipientResult.error(BeError.format());
    }
  }
}

@JsonSerializable()
class BeBalanceUpdate {
  final String token;
  final String type;
  final DateTime date;
  final DateTime expiry;
  final String asset;
  @JsonKey(name: 'l2_network')
  final String? l2Network;
  @JsonKey(
      name: 'amount_dec', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal amount;
  @JsonKey(name: 'fee_dec', fromJson: _decimalFromJson, toJson: _decimalToJson)
  final Decimal fee;
  final String recipient;
  final String status;
  final String? txid;
  @JsonKey(name: 'payment_url')
  final String? paymentUrl;

  BeBalanceUpdate(
      this.token,
      this.type,
      this.date,
      this.expiry,
      this.asset,
      this.l2Network,
      this.amount,
      this.fee,
      this.recipient,
      this.status,
      this.txid,
      this.paymentUrl);
  factory BeBalanceUpdate.fromJson(Map<String, dynamic> json) =>
      _$BeBalanceUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$BeBalanceUpdateToJson(this);
}

@freezed
class BeCryptoDepositsResult with _$BeCryptoDepositsResult {
  const factory BeCryptoDepositsResult(
          List<BeBalanceUpdate> deposits, int offset, int limit, int total) =
      _BeCryptoDepositsResult;
  const factory BeCryptoDepositsResult.error(BeError err) =
      _BeCryptoDepositsResultErr;

  static BeCryptoDepositsResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeBalanceUpdate> deposits = [];
      for (var item in json['deposits'])
        deposits.add(BeBalanceUpdate.fromJson(item));
      var offset = json['offset'];
      var limit = json['limit'];
      var total = json['total'];
      return BeCryptoDepositsResult(deposits, offset, limit, total);
    } catch (_) {
      return BeCryptoDepositsResult.error(BeError.format());
    }
  }
}

@freezed
class BeCryptoWithdrawalResult with _$BeCryptoWithdrawalResult {
  const factory BeCryptoWithdrawalResult(BeBalanceUpdate withdrawal) =
      _BeCryptoWithdrawalResult;
  const factory BeCryptoWithdrawalResult.error(BeError err) =
      _BeCryptoWithdrawalResultErr;

  static BeCryptoWithdrawalResult parse(String data) {
    try {
      var json = jsonDecode(data);
      return BeCryptoWithdrawalResult(
          BeBalanceUpdate.fromJson(json['withdrawal']));
    } catch (_) {
      return BeCryptoWithdrawalResult.error(BeError.format());
    }
  }
}

@freezed
class BeCryptoWithdrawalsResult with _$BeCryptoWithdrawalsResult {
  const factory BeCryptoWithdrawalsResult(
          List<BeBalanceUpdate> withdrawals, int offset, int limit, int total) =
      _BeCryptoWithdrawalsResult;
  const factory BeCryptoWithdrawalsResult.error(BeError err) =
      _BeCryptoWithdrawalsResultErr;

  static BeCryptoWithdrawalsResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeBalanceUpdate> withdrawals = [];
      for (var item in json['withdrawals'])
        withdrawals.add(BeBalanceUpdate.fromJson(item));
      var offset = json['offset'];
      var limit = json['limit'];
      var total = json['total'];
      return BeCryptoWithdrawalsResult(withdrawals, offset, limit, total);
    } catch (_) {
      return BeCryptoWithdrawalsResult.error(BeError.format());
    }
  }
}

@freezed
class BeFiatDepositResult with _$BeFiatDepositResult {
  const factory BeFiatDepositResult(BeBalanceUpdate deposit) =
      _BeFiatDepositResult;
  const factory BeFiatDepositResult.error(BeError err) =
      _BeFiatDepositResultErr;

  static BeFiatDepositResult parse(String data) {
    try {
      var json = jsonDecode(data);
      return BeFiatDepositResult(BeBalanceUpdate.fromJson(json['deposit']));
    } catch (_) {
      return BeFiatDepositResult.error(BeError.format());
    }
  }
}

@JsonSerializable()
class BeFiatAccountNumber {
  @JsonKey(name: 'account_number')
  final String accountNumber;
  final String reference;
  final String code;

  BeFiatAccountNumber(this.accountNumber, this.reference, this.code);
  factory BeFiatAccountNumber.fromJson(Map<String, dynamic> json) =>
      _$BeFiatAccountNumberFromJson(json);
  Map<String, dynamic> toJson() => _$BeFiatAccountNumberToJson(this);
}

@freezed
class BeFiatAccountNumberResult with _$BeFiatAccountNumberResult {
  const factory BeFiatAccountNumberResult(BeFiatAccountNumber accountNumber) =
      _BeFiatAccountNumberResult;
  const factory BeFiatAccountNumberResult.error(BeError err) =
      _BeFiatAccountNumberResultErr;

  static BeFiatAccountNumberResult parse(String data) {
    try {
      var json = jsonDecode(data);
      return BeFiatAccountNumberResult(
          BeFiatAccountNumber.fromJson(json['deposit']));
    } catch (_) {
      return BeFiatAccountNumberResult.error(BeError.format());
    }
  }
}

@freezed
class BeFiatDepositsResult with _$BeFiatDepositsResult {
  const factory BeFiatDepositsResult(
          List<BeBalanceUpdate> deposits, int offset, int limit, int total) =
      _BeFiatDepositsResult;
  const factory BeFiatDepositsResult.error(BeError err) =
      _BeFiatDepositsResultErr;

  static BeFiatDepositsResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeBalanceUpdate> deposits = [];
      for (var item in json['deposits'])
        deposits.add(BeBalanceUpdate.fromJson(item));
      var offset = json['offset'];
      var limit = json['limit'];
      var total = json['total'];
      return BeFiatDepositsResult(deposits, offset, limit, total);
    } catch (_) {
      return BeFiatDepositsResult.error(BeError.format());
    }
  }
}

@freezed
class BeFiatWithdrawalResult with _$BeFiatWithdrawalResult {
  const factory BeFiatWithdrawalResult(BeBalanceUpdate withdrawal) =
      _BeFiatWithdrawalResult;
  const factory BeFiatWithdrawalResult.error(BeError err) =
      _BeFiatWithdrawalResultErr;

  static BeFiatWithdrawalResult parse(String data) {
    try {
      var json = jsonDecode(data);
      return BeFiatWithdrawalResult(
          BeBalanceUpdate.fromJson(json['withdrawal']));
    } catch (_) {
      return BeFiatWithdrawalResult.error(BeError.format());
    }
  }
}

@freezed
class BeFiatWithdrawalsResult with _$BeFiatWithdrawalsResult {
  const factory BeFiatWithdrawalsResult(
          List<BeBalanceUpdate> withdrawals, int offset, int limit, int total) =
      _BeFiatWithdrawalsResult;
  const factory BeFiatWithdrawalsResult.error(BeError err) =
      _BeFiatWithdrawalsResultErr;

  static BeFiatWithdrawalsResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeBalanceUpdate> withdrawals = [];
      for (var item in json['withdrawals'])
        withdrawals.add(BeBalanceUpdate.fromJson(item));
      var offset = json['offset'];
      var limit = json['limit'];
      var total = json['total'];
      return BeFiatWithdrawalsResult(withdrawals, offset, limit, total);
    } catch (_) {
      return BeFiatWithdrawalsResult.error(BeError.format());
    }
  }
}

@JsonSerializable()
class BeAddressBookEntry {
  final DateTime date;
  final String recipient;
  final String? description;
  @JsonKey(name: 'account_name')
  final String? accountName;
  @JsonKey(name: 'account_addr_01')
  final String? accountAddr01;
  @JsonKey(name: 'account_addr_02')
  final String? accountAddr02;
  @JsonKey(name: 'account_addr_country')
  final String? accountAddrCountry;

  BeAddressBookEntry(
      this.date,
      this.recipient,
      this.description,
      this.accountName,
      this.accountAddr01,
      this.accountAddr02,
      this.accountAddrCountry);
  factory BeAddressBookEntry.fromJson(Map<String, dynamic> json) =>
      _$BeAddressBookEntryFromJson(json);
  Map<String, dynamic> toJson() => _$BeAddressBookEntryToJson(this);
}

@freezed
class BeAddressBookResult with _$BeAddressBookResult {
  const factory BeAddressBookResult(List<BeAddressBookEntry> entries) =
      _BeAddressBookResult;
  const factory BeAddressBookResult.error(BeError err) =
      _BeAddressBookResultErr;

  static BeAddressBookResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeAddressBookEntry> entries = [];
      for (var item in json['entries'])
        entries.add(BeAddressBookEntry.fromJson(item));
      return BeAddressBookResult(entries);
    } catch (_) {
      return BeAddressBookResult.error(BeError.format());
    }
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
  fiat_debited,
  exchanging,
  completed,
  expired,
  failed
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
  final BeOrderStatus status;

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
      this.status);

  factory BeBrokerOrder.fromJson(Map<String, dynamic> json) =>
      _$BeBrokerOrderFromJson(json);
  Map<String, dynamic> toJson() => _$BeBrokerOrderToJson(this);
}

@freezed
class BeBrokerOrderResult with _$BeBrokerOrderResult {
  const factory BeBrokerOrderResult(BeBrokerOrder order) = _BeBrokerOrderResult;
  const factory BeBrokerOrderResult.error(BeError err) =
      _BeBrokerOrderResultErr;

  static BeBrokerOrderResult parse(String data) {
    try {
      var json = jsonDecode(data);
      BeBrokerOrder order = BeBrokerOrder.fromJson(json['broker_order']);
      return BeBrokerOrderResult(order);
    } catch (_) {
      return BeBrokerOrderResult.error(BeError.format());
    }
  }
}

@freezed
class BeBrokerOrdersResult with _$BeBrokerOrdersResult {
  const factory BeBrokerOrdersResult(
          List<BeBrokerOrder> orders, int offset, int limit, int total) =
      _BeBrokerOrdersResult;
  const factory BeBrokerOrdersResult.error(BeError err) =
      _BeBrokerOrdersResultErr;

  static BeBrokerOrdersResult parse(String data) {
    try {
      var json = jsonDecode(data);
      List<BeBrokerOrder> orderList = [];
      var orders = json['broker_orders'];
      for (var item in orders) orderList.add(BeBrokerOrder.fromJson(item));
      var offset = json['offset'];
      var limit = json['limit'];
      var total = json['total'];
      return BeBrokerOrdersResult(orderList, offset, limit, total);
    } catch (_) {
      return BeBrokerOrdersResult.error(BeError.format());
    }
  }
}

Future<http.Response?> postAndCatch(String url, String body,
    {Map<String, String>? extraHeaders}) async {
  try {
    log.info('post - $url');
    return await httpPost(Uri.parse(url), body, extraHeaders: extraHeaders);
  } on SocketException catch (e) {
    log.severe('socket exception', e);
    return null;
  } on TimeoutException catch (e) {
    log.severe('timeout exception', e);
    return null;
  } on http.ClientException catch (e) {
    log.severe('client exception', e);
    return null;
  } on ArgumentError catch (e) {
    log.severe('argument error', e);
    return null;
  } on HandshakeException catch (e) {
    log.severe('handshake exception', e);
    return null;
  }
}

Future<ErrorResult> post(String endpoint, Map<String, dynamic> params,
    {bool authRequired = false}) async {
  var baseUrl = server() + 'apiv1/';
  var url = baseUrl + endpoint;
  var headers = Map<String, String>();
  var body;
  if (authRequired) {
    var apikey = await Prefs.beApiKeyGet();
    var apisecret = await Prefs.beApiSecretGet();
    checkApiKey(apikey, apisecret);
    var nonce = nextNonce();
    params.addAll({"api_key": apikey, "nonce": nonce});
    body = jsonEncode(params);
    var sig = createHmacSig(apisecret!, body);
    headers.addAll({"X-Signature": sig});
  } else
    body = jsonEncode(params);
  var response = await postAndCatch(url, body, extraHeaders: headers);
  if (response == null) return ErrorResult.network();
  if (response.statusCode == 200) {
    return ErrorResult(response.body);
  } else if (response.statusCode == 400) return ErrorResult.auth(response.body);
  log.info(response.statusCode);
  return ErrorResult.network();
}

Future<ErrorResult> beUserRegister(AccountRegistration reg) async {
  return await post('user_register', {
    "first_name": reg.firstName,
    "last_name": reg.lastName,
    "email": reg.email,
    "mobile_number": reg.mobileNumber,
    "address": reg.address,
    "password": reg.newPassword,
    "photo": reg.photo,
    "photo_type": reg.photoType
  });
}

Future<BeTwoFactorEnabledResult> beUserTwoFactorEnabledCheck(
    String email, String password) async {
  var result = await post(
      'user_two_factor_enabled_check', {"email": email, "password": password});
  return result.when((content) => BeTwoFactorEnabledResult.parse(content),
      error: (err) => BeTwoFactorEnabledResult.error(err));
}

Future<BeVersionResult> beVersion(
    String email, String password, String deviceName, String tfCode) async {
  var result = await post('version', {});
  return result.when((content) => BeVersionResult.parse(content),
      error: (err) => BeVersionResult.error(err));
}

Future<BeApiKeyResult> beApiKeyCreate(
    String email, String password, String deviceName, String? tfCode) async {
  var result = await post('api_key_create', {
    "email": email,
    "password": password,
    "device_name": deviceName,
    "tf_code": tfCode
  });
  return result.when((content) => BeApiKeyResult.parse(content),
      error: (err) => BeApiKeyResult.error(err));
}

Future<BeApiKeyRequestResult> beApiKeyRequest(
    String email, String deviceName) async {
  var result = await post(
      'api_key_request', {"email": email, "device_name": deviceName});
  return result.when((content) => BeApiKeyRequestResult.parse(content),
      error: (err) => BeApiKeyRequestResult.error(err));
}

Future<BeApiKeyResult> beApiKeyClaim(String token) async {
  var result = await post('api_key_claim', {"token": token});
  return result.when((content) => BeApiKeyResult.parse(content),
      error: (err) => BeApiKeyResult.error(err));
}

Future<UserInfoResult> beUserInfo({String? email}) async {
  var result = await post("user_info", {"email": email}, authRequired: true);
  return result.when((content) => UserInfoResult.parse(content),
      error: (err) => UserInfoResult.error(err));
}

Future<ErrorResult> beUserResetPassword() async {
  return await post('user_reset_password', {}, authRequired: true);
}

Future<ErrorResult> beUserUpdateEmail(String email) async {
  return post('user_update_email', {"email": email}, authRequired: true);
}

Future<ErrorResult> beUserUpdatePassword(
    String currentPassword, String newPassword) async {
  return post('user_update_password',
      {"current_password": currentPassword, "new_password": newPassword},
      authRequired: true);
}

Future<ErrorResult> beUserUpdatePhoto(String? photo, String? photoType) async {
  return post('user_update_photo', {"photo": photo, "photo_type": photoType},
      authRequired: true);
}

Future<BeKycRequestCreateResult> beKycRequestCreate() async {
  var result = await post("user_kyc_request_create", {}, authRequired: true);
  return result.when((content) => BeKycRequestCreateResult.parse(content),
      error: (err) => BeKycRequestCreateResult.error(err));
}

Future<BeKycRequestCreateResult> beKycRequestSendMobileNumber(
    String mobileNumber) async {
  var result = await post(
      "user_kyc_request_send_mobile_number", {"mobile_number": mobileNumber},
      authRequired: true);
  return result.when((content) => BeKycRequestCreateResult.parse(content),
      error: (err) => BeKycRequestCreateResult.error(err));
}

Future<BeTwoFactorResult> beUserTwoFactorEnable(String? code) async {
  var result =
      await post("user_two_factor_enable", {"code": code}, authRequired: true);
  return result.when((content) => BeTwoFactorResult.parse(content),
      error: (err) => BeTwoFactorResult.error(err));
}

Future<BeTwoFactorResult> beUserTwoFactorDisable(String? code) async {
  var result =
      await post("user_two_factor_disable", {"code": code}, authRequired: true);
  return result.when((content) => BeTwoFactorResult.parse(content),
      error: (err) => BeTwoFactorResult.error(err));
}

Future<BeTwoFactorResult> beUserTwoFactorSend() async {
  var result = await post("user_two_factor_send", {}, authRequired: true);
  return result.when((content) => BeTwoFactorResult.parse(content),
      error: (err) => BeTwoFactorResult.error(err));
}

Future<BeAssetResult> beAssets() async {
  var result = await post("assets", {}, authRequired: true);
  return result.when((content) => BeAssetResult.parse(content),
      error: (err) => BeAssetResult.error(err));
}

Future<BeMarketResult> beMarkets() async {
  var result = await post("markets", {}, authRequired: true);
  return result.when((content) => BeMarketResult.parse(content),
      error: (err) => BeMarketResult.error(err));
}

Future<BeOrderbookResult> beOrderbook(String market) async {
  var result = await post("order_book", {"market": market}, authRequired: true);
  return result.when((content) => BeOrderbookResult.parse(content),
      error: (err) => BeOrderbookResult.error(err));
}

Future<BeBalancesResult> beBalances() async {
  var result = await post("balances", {}, authRequired: true);
  return result.when((content) => BeBalancesResult.parse(content),
      error: (err) => BeBalancesResult.error(err));
}

Future<BeBalanceResult> beBalance(String asset) async {
  var result = await beBalances();
  return result.when((balances) {
    var balance =
        balances.firstWhereOrNull((element) => element.asset == asset);
    return BeBalanceResult(balance);
  }, error: (err) => BeBalanceResult.error(err));
}

Future<BeCryptoDepositRecipientResult> beCryptoDepositRecipient(
    String asset, String? l2Network, Decimal amount) async {
  var result = await post(
      "crypto_deposit_recipient",
      {
        "asset": asset,
        "l2_network": l2Network,
        "amount_dec": amount.toString()
      },
      authRequired: true);
  return result.when((content) => BeCryptoDepositRecipientResult.parse(content),
      error: (err) => BeCryptoDepositRecipientResult.error(err));
}

Future<BeCryptoDepositsResult> beCryptoDeposits(
    String asset, String? l2Network, int offset, int limit) async {
  var result = await post(
      "crypto_deposits",
      {
        "asset": asset,
        "l2_network": l2Network,
        "offset": offset,
        "limit": limit
      },
      authRequired: true);
  return result.when((content) => BeCryptoDepositsResult.parse(content),
      error: (err) => BeCryptoDepositsResult.error(err));
}

Future<BeCryptoWithdrawalResult> beCryptoWithdrawalCreate(
    String asset,
    String? l2Network,
    Decimal amount,
    String recipient,
    bool saveRecipient,
    String recipientDescription,
    String? tfCode) async {
  var result = await post(
      "crypto_withdrawal_create",
      {
        "asset": asset,
        "l2_network": l2Network,
        "amount_dec": amount.toString(),
        "recipient": recipient,
        "save_recipient": saveRecipient,
        "recipient_description": recipientDescription,
        "tf_code": tfCode
      },
      authRequired: true);
  return result.when((content) => BeCryptoWithdrawalResult.parse(content),
      error: (err) => BeCryptoWithdrawalResult.error(err));
}

Future<BeCryptoWithdrawalsResult> beCryptoWithdrawals(
    String asset, String? l2Network, int offset, int limit) async {
  var result = await post(
      "crypto_withdrawals",
      {
        "asset": asset,
        "l2_network": l2Network,
        "offset": offset,
        "limit": limit
      },
      authRequired: true);
  return result.when((content) => BeCryptoWithdrawalsResult.parse(content),
      error: (err) => BeCryptoWithdrawalsResult.error(err));
}

Future<BeFiatDepositResult> beFiatDepositWindcave(
    String asset, Decimal amount) async {
  var result = await post("fiat_deposit_windcave",
      {"asset": asset, "amount_dec": amount.toString()},
      authRequired: true);
  return result.when((content) => BeFiatDepositResult.parse(content),
      error: (err) => BeFiatDepositResult.error(err));
}

Future<BeFiatAccountNumberResult> beFiatDepositDirect(String asset) async {
  var result =
      await post("fiat_deposit_direct", {"asset": asset}, authRequired: true);
  return result.when((content) => BeFiatAccountNumberResult.parse(content),
      error: (err) => BeFiatAccountNumberResult.error(err));
}

Future<BeFiatDepositsResult> beFiatDeposits(
    String asset, int offset, int limit) async {
  var result = await post(
      "fiat_deposits", {"asset": asset, "offset": offset, "limit": limit},
      authRequired: true);
  return result.when((content) => BeFiatDepositsResult.parse(content),
      error: (err) => BeFiatDepositsResult.error(err));
}

Future<BeFiatWithdrawalResult> beFiatWithdrawalCreate(
    String asset,
    Decimal amount,
    String recipient,
    String recipientDescription,
    String? accountName,
    String? accountAddr01,
    String? accountAddr02,
    String? accountAddrCountry,
    String? tfCode) async {
  var result = await post(
      "fiat_withdrawal_create",
      {
        "asset": asset,
        "amount_dec": amount.toString(),
        "recipient": recipient,
        "recipient_description": recipientDescription,
        "account_name": accountName,
        "account_addr_01": accountAddr01,
        "account_addr_02": accountAddr02,
        "account_addr_country": accountAddrCountry,
        "tf_code": tfCode
      },
      authRequired: true);
  return result.when((content) => BeFiatWithdrawalResult.parse(content),
      error: (err) => BeFiatWithdrawalResult.error(err));
}

Future<BeFiatWithdrawalsResult> beFiatWithdrawals(
    String asset, int offset, int limit) async {
  var result = await post(
      "fiat_withdrawals", {"asset": asset, "offset": offset, "limit": limit},
      authRequired: true);
  return result.when((content) => BeFiatWithdrawalsResult.parse(content),
      error: (err) => BeFiatWithdrawalsResult.error(err));
}

Future<BeAddressBookResult> beAddressBook(String asset) async {
  var result = await post("address_book", {"asset": asset}, authRequired: true);
  return result.when((content) => BeAddressBookResult.parse(content),
      error: (err) => BeAddressBookResult.error(err));
}

Future<BeBrokerOrderResult> beOrderValidate(
    String market, BeMarketSide side, Decimal amount) async {
  var result = await post(
      "broker_order_validate",
      {
        "market": market,
        "side": describeEnum(side),
        "amount_dec": amount.toString()
      },
      authRequired: true);
  return result.when((content) => BeBrokerOrderResult.parse(content),
      error: (err) => BeBrokerOrderResult.error(err));
}

Future<BeBrokerOrderResult> beOrderCreate(
    String market, BeMarketSide side, Decimal amount) async {
  var result = await post(
      "broker_order_create",
      {
        "market": market,
        "side": describeEnum(side),
        "amount_dec": amount.toString()
      },
      authRequired: true);
  return result.when((content) => BeBrokerOrderResult.parse(content),
      error: (err) => BeBrokerOrderResult.error(err));
}

Future<BeBrokerOrderResult> beOrderAccept(String token) async {
  var result =
      await post("broker_order_accept", {"token": token}, authRequired: true);
  return result.when((content) => BeBrokerOrderResult.parse(content),
      error: (err) => BeBrokerOrderResult.error(err));
}

Future<BeBrokerOrderResult> beOrderStatus(String token) async {
  var result =
      await post("broker_order_status", {"token": token}, authRequired: true);
  return result.when((content) => BeBrokerOrderResult.parse(content),
      error: (err) => BeBrokerOrderResult.error(err));
}

Future<BeBrokerOrdersResult> beOrderList(int offset, int limit) async {
  var result = await post("broker_orders", {"offset": offset, "limit": limit},
      authRequired: true);
  return result.when((content) => BeBrokerOrdersResult.parse(content),
      error: (err) => BeBrokerOrdersResult.error(err));
}
