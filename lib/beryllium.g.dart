// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beryllium.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['mobile_number'] as String?,
      json['address'] as String?,
      json['email'] as String,
      json['photo'] as String?,
      json['photo_type'] as String?,
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => _$enumDecode(_$BePermissionEnumMap, e)),
      (json['roles'] as List<dynamic>)
          .map((e) => _$enumDecode(_$BeRoleEnumMap, e)),
      json['kyc_validated'] as bool,
      json['kyc_url'] as String?,
      json['aplyid_req_exists'] as bool,
      json['tf_enabled'] as bool,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile_number': instance.mobileNumber,
      'address': instance.address,
      'email': instance.email,
      'photo': instance.photo,
      'photo_type': instance.photoType,
      'permissions':
          instance.permissions?.map((e) => _$BePermissionEnumMap[e]).toList(),
      'roles': instance.roles.map((e) => _$BeRoleEnumMap[e]).toList(),
      'kyc_validated': instance.kycValidated,
      'kyc_url': instance.kycUrl,
      'aplyid_req_exists': instance.aplyidReqExists,
      'tf_enabled': instance.tfEnabled,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$BePermissionEnumMap = {
  BePermission.receive: 'receive',
  BePermission.balance: 'balance',
  BePermission.history: 'history',
  BePermission.transfer: 'transfer',
  BePermission.issue: 'issue',
};

const _$BeRoleEnumMap = {
  BeRole.admin: 'admin',
  BeRole.proposer: 'proposer',
  BeRole.authorizer: 'authorizer',
};

BeTwoFactorSetup _$BeTwoFactorSetupFromJson(Map<String, dynamic> json) =>
    BeTwoFactorSetup(
      json['image'] as String,
      json['key'] as String,
      json['issuer'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$BeTwoFactorSetupToJson(BeTwoFactorSetup instance) =>
    <String, dynamic>{
      'image': instance.image,
      'key': instance.key,
      'issuer': instance.issuer,
      'username': instance.username,
    };

BeAsset _$BeAssetFromJson(Map<String, dynamic> json) => BeAsset(
      json['symbol'] as String,
      json['name'] as String,
      json['decimals'] as int,
      _decimalFromJson(json['withdraw_fee']),
      json['is_crypto'] as bool,
    );

Map<String, dynamic> _$BeAssetToJson(BeAsset instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'decimals': instance.decimals,
      'withdraw_fee': _decimalToJson(instance.withdrawFee),
      'is_crypto': instance.isCrypto,
    };

BeMarket _$BeMarketFromJson(Map<String, dynamic> json) => BeMarket(
      json['symbol'] as String,
      json['base_asset'] as String,
      json['quote_asset'] as String,
      json['precision'] as int,
      json['status'] as String,
      json['min_trade'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$BeMarketToJson(BeMarket instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'base_asset': instance.baseAsset,
      'quote_asset': instance.quoteAsset,
      'precision': instance.precision,
      'status': instance.status,
      'min_trade': instance.minTrade,
      'message': instance.message,
    };

BeRate _$BeRateFromJson(Map<String, dynamic> json) => BeRate(
      _decimalFromJson(json['quantity']),
      _decimalFromJson(json['rate']),
    );

Map<String, dynamic> _$BeRateToJson(BeRate instance) => <String, dynamic>{
      'quantity': _decimalToJson(instance.quantity),
      'rate': _decimalToJson(instance.rate),
    };

BeOrderbook _$BeOrderbookFromJson(Map<String, dynamic> json) => BeOrderbook(
      (json['bids'] as List<dynamic>)
          .map((e) => BeRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['asks'] as List<dynamic>)
          .map((e) => BeRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      _decimalFromJson(json['min_order']),
      _decimalFromJson(json['base_asset_withdraw_fee']),
      _decimalFromJson(json['quote_asset_withdraw_fee']),
      _decimalFromJson(json['broker_fee']),
    );

Map<String, dynamic> _$BeOrderbookToJson(BeOrderbook instance) =>
    <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
      'min_order': _decimalToJson(instance.minOrder),
      'base_asset_withdraw_fee': _decimalToJson(instance.baseAssetWithdrawFee),
      'quote_asset_withdraw_fee':
          _decimalToJson(instance.quoteAssetWithdrawFee),
      'broker_fee': _decimalToJson(instance.brokerFee),
    };

BeBalance _$BeBalanceFromJson(Map<String, dynamic> json) => BeBalance(
      json['symbol'] as String,
      json['name'] as String,
      _decimalFromJson(json['total']),
      _decimalFromJson(json['available']),
    );

Map<String, dynamic> _$BeBalanceToJson(BeBalance instance) => <String, dynamic>{
      'symbol': instance.asset,
      'name': instance.name,
      'total': _decimalToJson(instance.total),
      'available': _decimalToJson(instance.available),
    };

BeCryptoDeposit _$BeCryptoDepositFromJson(Map<String, dynamic> json) =>
    BeCryptoDeposit(
      json['token'] as String,
      json['asset'] as String,
      json['address'] as String,
      _decimalFromJson(json['amount']),
      DateTime.parse(json['date'] as String),
      json['confirmed'] as bool,
      json['txid'] as String,
    );

Map<String, dynamic> _$BeCryptoDepositToJson(BeCryptoDeposit instance) =>
    <String, dynamic>{
      'token': instance.token,
      'asset': instance.asset,
      'address': instance.address,
      'amount': _decimalToJson(instance.amount),
      'date': instance.date.toIso8601String(),
      'confirmed': instance.confirmed,
      'txid': instance.txid,
    };

BeCryptoWithdrawal _$BeCryptoWithdrawalFromJson(Map<String, dynamic> json) =>
    BeCryptoWithdrawal(
      json['token'] as String,
      json['asset'] as String,
      DateTime.parse(json['date'] as String),
      _decimalFromJson(json['amount_dec']),
      json['recipient'] as String,
      json['txid'] as String?,
      json['status'] as String,
    );

Map<String, dynamic> _$BeCryptoWithdrawalToJson(BeCryptoWithdrawal instance) =>
    <String, dynamic>{
      'token': instance.token,
      'asset': instance.asset,
      'date': instance.date.toIso8601String(),
      'amount_dec': _decimalToJson(instance.amount),
      'recipient': instance.recipient,
      'txid': instance.txid,
      'status': instance.status,
    };

BeFiatDeposit _$BeFiatDepositFromJson(Map<String, dynamic> json) =>
    BeFiatDeposit(
      json['token'] as String,
      json['asset'] as String,
      DateTime.parse(json['date'] as String),
      DateTime.parse(json['expiry'] as String),
      _decimalFromJson(json['amount_dec']),
      json['status'] as String,
      json['payment_url'] as String?,
    );

Map<String, dynamic> _$BeFiatDepositToJson(BeFiatDeposit instance) =>
    <String, dynamic>{
      'token': instance.token,
      'asset': instance.asset,
      'date': instance.date.toIso8601String(),
      'expiry': instance.expiry.toIso8601String(),
      'amount_dec': _decimalToJson(instance.amount),
      'status': instance.status,
      'payment_url': instance.paymentUrl,
    };

BeFiatWithdrawal _$BeFiatWithdrawalFromJson(Map<String, dynamic> json) =>
    BeFiatWithdrawal(
      json['token'] as String,
      json['asset'] as String,
      DateTime.parse(json['date'] as String),
      _decimalFromJson(json['amount_dec']),
      json['recipient'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$BeFiatWithdrawalToJson(BeFiatWithdrawal instance) =>
    <String, dynamic>{
      'token': instance.token,
      'asset': instance.asset,
      'date': instance.date.toIso8601String(),
      'amount_dec': _decimalToJson(instance.amount),
      'recipient': instance.recipient,
      'status': instance.status,
    };

BeAddressBookEntry _$BeAddressBookEntryFromJson(Map<String, dynamic> json) =>
    BeAddressBookEntry(
      DateTime.parse(json['date'] as String),
      json['recipient'] as String,
      json['description'] as String?,
    );

Map<String, dynamic> _$BeAddressBookEntryToJson(BeAddressBookEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'recipient': instance.recipient,
      'description': instance.description,
    };

BeBrokerOrder _$BeBrokerOrderFromJson(Map<String, dynamic> json) =>
    BeBrokerOrder(
      json['token'] as String,
      DateTime.parse(json['date'] as String),
      DateTime.parse(json['expiry'] as String),
      json['market'] as String,
      _$enumDecode(_$BeMarketSideEnumMap, json['side']),
      json['base_asset'] as String,
      json['quote_asset'] as String,
      _decimalFromJson(json['base_amount_dec']),
      _decimalFromJson(json['quote_amount_dec']),
      json['recipient'] as String,
      _$enumDecode(_$BeOrderStatusEnumMap, json['status']),
      json['payment_url'] as String?,
    );

Map<String, dynamic> _$BeBrokerOrderToJson(BeBrokerOrder instance) =>
    <String, dynamic>{
      'token': instance.token,
      'date': instance.date.toIso8601String(),
      'expiry': instance.expiry.toIso8601String(),
      'market': instance.market,
      'side': _$BeMarketSideEnumMap[instance.side],
      'base_asset': instance.baseAsset,
      'quote_asset': instance.quoteAsset,
      'base_amount_dec': _decimalToJson(instance.baseAmount),
      'quote_amount_dec': _decimalToJson(instance.quoteAmount),
      'recipient': instance.recipient,
      'status': _$BeOrderStatusEnumMap[instance.status],
      'payment_url': instance.paymentUrl,
    };

const _$BeMarketSideEnumMap = {
  BeMarketSide.bid: 'bid',
  BeMarketSide.ask: 'ask',
};

const _$BeOrderStatusEnumMap = {
  BeOrderStatus.none: 'none',
  BeOrderStatus.created: 'created',
  BeOrderStatus.ready: 'ready',
  BeOrderStatus.incoming: 'incoming',
  BeOrderStatus.confirmed: 'confirmed',
  BeOrderStatus.exchange: 'exchange',
  BeOrderStatus.withdrawing: 'withdrawing',
  BeOrderStatus.completed: 'completed',
  BeOrderStatus.expired: 'expired',
  BeOrderStatus.cancelled: 'cancelled',
};
