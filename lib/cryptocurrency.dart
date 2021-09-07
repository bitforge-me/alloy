import 'package:bs58check/bs58check.dart';
import 'package:bech32/bech32.dart';
import 'package:web3dart/web3dart.dart';

class ValidateResult {
  final bool result;
  final String? reason;

  ValidateResult(this.result, this.reason);
}

ValidateResult base58Validate(String address, bool testnet,
    List<int> mainnetPrefixes, List<int> testnetPrefixes) {
  var data = decode(address);
  if (data.length <= 0)
    return ValidateResult(false, 'failed to decode version');
  var version = data[0];
  if (testnet && testnetPrefixes.contains(version) ||
      !testnet && mainnetPrefixes.contains(version))
    return ValidateResult(true, null);
  else
    return ValidateResult(false, 'invalid address version');
}

ValidateResult addressValidate(String symbol, bool testnet, String address) {
  symbol = symbol.toUpperCase();
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
          return ValidateResult(true, null);
        else
          return ValidateResult(false, 'invalid address version');
      } on Exception {}
      break;
    case 'ETH':
      try {
        EthereumAddress.fromHex(address, enforceEip55: true);
        return ValidateResult(true, null);
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
      return ValidateResult(false, '$symbol not known');
  }
  return ValidateResult(false, 'invalid address');
}

ValidateResult bankValidate(String address) {
  //TODO - implement me
  return ValidateResult(true, null);
}
