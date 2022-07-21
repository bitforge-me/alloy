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
          ?.map((e) => $enumDecode(_$BePermissionEnumMap, e)),
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$BeRoleEnumMap, e)),
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
      json['withdraw_fee_fixed'] as bool,
      _decimalFromJson(json['min_withdraw']),
      json['is_crypto'] as bool,
      json['l2_network'] == null
          ? null
          : BeAsset.fromJson(json['l2_network'] as Map<String, dynamic>),
      json['deposit_instr'] as String?,
      json['withdraw_instr'] as String?,
    );

Map<String, dynamic> _$BeAssetToJson(BeAsset instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'decimals': instance.decimals,
      'withdraw_fee': _decimalToJson(instance.withdrawFee),
      'withdraw_fee_fixed': instance.withdrawFeeFixed,
      'min_withdraw': _decimalToJson(instance.minWithdraw),
      'is_crypto': instance.isCrypto,
      'l2_network': instance.l2Network,
      'deposit_instr': instance.depositInstr,
      'withdraw_instr': instance.withdrawInstr,
    };

BeMarket _$BeMarketFromJson(Map<String, dynamic> json) => BeMarket(
      json['symbol'] as String,
      json['base_asset'] as String,
      json['quote_asset'] as String,
      json['precision'] as int,
      json['status'] as String,
      _decimalFromJson(json['min_trade']),
      json['message'] as String,
    );

Map<String, dynamic> _$BeMarketToJson(BeMarket instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'base_asset': instance.baseAsset,
      'quote_asset': instance.quoteAsset,
      'precision': instance.precision,
      'status': instance.status,
      'min_trade': _decimalToJson(instance.minTrade),
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
      _decimalFromJson(json['base_asset_withdraw_fee']),
      _decimalFromJson(json['quote_asset_withdraw_fee']),
      _decimalFromJson(json['broker_fee']),
    );

Map<String, dynamic> _$BeOrderbookToJson(BeOrderbook instance) =>
    <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
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

BeBalanceUpdate _$BeBalanceUpdateFromJson(Map<String, dynamic> json) =>
    BeBalanceUpdate(
      json['token'] as String,
      json['type'] as String,
      DateTime.parse(json['date'] as String),
      DateTime.parse(json['expiry'] as String),
      json['asset'] as String,
      json['l2_network'] as String?,
      _decimalFromJson(json['amount_dec']),
      _decimalFromJson(json['fee_dec']),
      json['recipient'] as String,
      json['status'] as String,
      json['txid'] as String?,
      json['payment_url'] as String?,
    );

Map<String, dynamic> _$BeBalanceUpdateToJson(BeBalanceUpdate instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'expiry': instance.expiry.toIso8601String(),
      'asset': instance.asset,
      'l2_network': instance.l2Network,
      'amount_dec': _decimalToJson(instance.amount),
      'fee_dec': _decimalToJson(instance.fee),
      'recipient': instance.recipient,
      'status': instance.status,
      'txid': instance.txid,
      'payment_url': instance.paymentUrl,
    };

BeFiatAccountNumber _$BeFiatAccountNumberFromJson(Map<String, dynamic> json) =>
    BeFiatAccountNumber(
      json['account_number'] as String,
      json['reference'] as String,
      json['code'] as String,
    );

Map<String, dynamic> _$BeFiatAccountNumberToJson(
        BeFiatAccountNumber instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'reference': instance.reference,
      'code': instance.code,
    };

BeAddressBookEntry _$BeAddressBookEntryFromJson(Map<String, dynamic> json) =>
    BeAddressBookEntry(
      DateTime.parse(json['date'] as String),
      json['recipient'] as String,
      json['description'] as String?,
      json['account_name'] as String?,
      json['account_addr_01'] as String?,
      json['account_addr_02'] as String?,
      json['account_addr_country'] as String?,
    );

Map<String, dynamic> _$BeAddressBookEntryToJson(BeAddressBookEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'recipient': instance.recipient,
      'description': instance.description,
      'account_name': instance.accountName,
      'account_addr_01': instance.accountAddr01,
      'account_addr_02': instance.accountAddr02,
      'account_addr_country': instance.accountAddrCountry,
    };

BeBrokerOrder _$BeBrokerOrderFromJson(Map<String, dynamic> json) =>
    BeBrokerOrder(
      json['token'] as String,
      DateTime.parse(json['date'] as String),
      DateTime.parse(json['expiry'] as String),
      json['market'] as String,
      $enumDecode(_$BeMarketSideEnumMap, json['side']),
      json['base_asset'] as String,
      json['quote_asset'] as String,
      _decimalFromJson(json['base_amount_dec']),
      _decimalFromJson(json['quote_amount_dec']),
      $enumDecode(_$BeOrderStatusEnumMap, json['status']),
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
      'status': _$BeOrderStatusEnumMap[instance.status],
    };

const _$BeMarketSideEnumMap = {
  BeMarketSide.bid: 'bid',
  BeMarketSide.ask: 'ask',
};

const _$BeOrderStatusEnumMap = {
  BeOrderStatus.none: 'none',
  BeOrderStatus.created: 'created',
  BeOrderStatus.ready: 'ready',
  BeOrderStatus.fiat_debited: 'fiat_debited',
  BeOrderStatus.exchanging: 'exchanging',
  BeOrderStatus.completed: 'completed',
  BeOrderStatus.expired: 'expired',
  BeOrderStatus.failed: 'failed',
};
