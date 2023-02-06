import 'package:bs58check/bs58check.dart';
import 'package:bech32/bech32.dart';
import 'package:bolt11_decoder/bolt11_decoder.dart';
import 'package:web3dart/web3dart.dart';
import 'package:quiver/iterables.dart';
import 'package:quiver/strings.dart';
import 'package:decimal/decimal.dart';

class ValidateResult {
  final bool result;
  final Decimal? amount;
  final DateTime? expiry;
  final String? reason;

  ValidateResult(this.result, this.amount, this.expiry, this.reason);
}

ValidateResult base58Validate(String address, bool testnet,
    List<int> mainnetPrefixes, List<int> testnetPrefixes) {
  var data = decode(address);
  if (data.length <= 0)
    return ValidateResult(false, null, null, 'failed to decode version');
  var version = data[0];
  if (testnet && testnetPrefixes.contains(version) ||
      !testnet && mainnetPrefixes.contains(version))
    return ValidateResult(true, null, null, null);
  else
    return ValidateResult(false, null, null, 'invalid address version');
}

ValidateResult addressValidate(String symbol, bool testnet, String address) {
  symbol = symbol.toUpperCase();
  address = address.trim();
  switch (symbol) {
    case 'BTC':
      try {
        // first try base58
        return base58Validate(address, testnet, [0, 5], [111, 196]);
      } on ArgumentError {}
      // try bech32
      try {
        var addr = segwit.decode(address);
        if (testnet && addr.hrp == 'tb' || !testnet && addr.hrp == 'bc')
          return ValidateResult(true, null, null, null);
        else
          return ValidateResult(false, null, null, 'invalid address version');
      } on Exception {}
      break;
    case 'ETH':
      try {
        EthereumAddress.fromHex(address, enforceEip55: true);
        return ValidateResult(true, null, null, null);
      } on ArgumentError {}
      break;
    case 'DOGE':
      try {
        return base58Validate(address, testnet, [0x1E], [0x71]);
      } on ArgumentError {}
      break;
    case 'LTC':
      try {
        return base58Validate(address, testnet, [0x30], [0x6F]);
      } on ArgumentError {}
      break;
    default:
      return ValidateResult(false, null, null, '$symbol not known');
  }
  return ValidateResult(false, null, null, 'invalid address');
}

ValidateResult l2RecipientValidate(
    String symbol, bool testnet, String recipient) {
  switch (symbol) {
    case 'BTC-LN':
      try {
        var req = Bolt11PaymentRequest(recipient);
        if (testnet && req.prefix != PayRequestPrefix.lntb ||
            !testnet && req.prefix != PayRequestPrefix.lnbc)
          return ValidateResult(false, null, null, 'invalid invoice');
        DateTime? expiry;
        for (var tag in req.tags) {
          if (tag.type == 'expiry') {
            var expiryOffset = tag.data as int;
            expiry = DateTime.fromMillisecondsSinceEpoch(
                req.timestamp.toInt() * 1000 + expiryOffset * 1000);
            if (DateTime.now().compareTo(expiry) >= 0)
              return ValidateResult(
                  false, req.amount, expiry, 'expired invoice');
          }
        }
        return ValidateResult(true, req.amount, expiry, null);
      } on Exception {}
      return ValidateResult(false, null, null, 'invalid invoice');
  }
  return ValidateResult(false, null, null, 'unknown recipient type');
}

String _compact(String account) {
  // Convert the number to the minimal representation. This strips the
  // number of any valid separators and removes surrounding whitespace.
  String result;
  var numbers = account.trim().replaceAll(' ', '-').split('-');
  if (numbers.length == 4) {
    // zero pad the different sections if they are found
    const lengths = [2, 4, 7, 3];
    result = '';
    for (var section in zip([lengths, numbers]))
      result += (section[1] as String).padLeft(section[0] as int, '0');
  } else {
    result = numbers.join();
    if (numbers[0].length >= 13) {
      // otherwise zero pad the account type
      result = numbers.join();
      result = result.substring(0, 13) + result.substring(13).padLeft(3, '0');
    }
  }
  return result;
}

ValidateResult bankValidate(String account) {
  account = _compact(account);

  // check result is all digits
  for (var i in range(account.length))
    if (!isDigit(account.codeUnitAt(i as int)))
      return ValidateResult(false, null, null, 'invalid digit');

  // check length
  if (account.length != 16)
    return ValidateResult(false, null, null, 'invalid length');

  //TODO - check checksum

  //TODO - check bank and branch

  return ValidateResult(true, null, null, null);
}

String bankFormat(String account) {
  var compact = _compact(account);
  if (compact.length == 16)
    return [
      compact.substring(0, 2),
      compact.substring(2, 6),
      compact.substring(6, 13),
      compact.substring(13, 16)
    ].join('-');
  return account;
}
