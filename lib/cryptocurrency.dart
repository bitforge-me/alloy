import 'package:bs58check/bs58check.dart';
import 'package:bech32/bech32.dart';
import 'package:web3dart/web3dart.dart';

class ValidateResult {
  final bool result;
  final String? reason;

  ValidateResult(this.result, this.reason);
}

ValidateResult addressValidate(String symbol, bool testnet, String address) {
  symbol = symbol.toUpperCase();
  switch (symbol) {
    case 'BTC':
      try {
        // first try base58
        var data = decode(address);
        if (data.length <= 0)
          return ValidateResult(false, 'failed to decode version');
        var version = data[0];
        if (testnet && (version == 111 || version == 196) ||
            !testnet && (version == 0 || version == 5))
          return ValidateResult(true, null);
        else
          return ValidateResult(false, 'invalid address version');
      } on ArgumentError {
        print('invalid address');
      }
      // try bech32
      try {
        var addr = segwit.decode(address);
        if (testnet && addr.hrp == 'tb1' || !testnet && addr.hrp == 'bc1')
          return ValidateResult(true, null);
        else
          return ValidateResult(false, 'invalid address version');
      } on Exception {
        print('invalid address');
      }
      return ValidateResult(false, 'invalid address');
    case 'ETH':
      try {
        EthereumAddress.fromHex(address, enforceEip55: true);
        return ValidateResult(true, null);
      } on ArgumentError {
        print('invalid address');
      }
      return ValidateResult(false, 'invalid address');
    default:
      return ValidateResult(false, '$symbol not known');
  }
}
