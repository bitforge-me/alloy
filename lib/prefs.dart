import 'package:zapdart/prefhelper.dart';

import 'config.dart';

class Prefs {
  static Future<String> getKeyNetworkSpecific(String key) async {
    var testnet = await testnetGet();
    if (!testnet) key = '${key}_mainnet';
    return key;
  }

  static Future<String?> getStringNetworkSpecific(
      String key, String? defaultValue) async {
    final prefs = PrefHelper();
    return prefs.getString(await getKeyNetworkSpecific(key), defaultValue);
  }

  static Future<bool> setStringNetworkSpecific(
      String key, String? value) async {
    final prefs = PrefHelper();
    prefs.setString(await getKeyNetworkSpecific(key), value);
    return true;
  }

  static Future<bool> testnetGet() async {
    final prefs = PrefHelper();
    return await prefs.getBool("testnet", TestnetDefault);
  }

  static Future<void> testnetSet(bool value) async {
    final prefs = PrefHelper();
    await prefs.setBool("testnet", value);
  }

  static Future<String?> beApiKeyGet() async {
    return await getStringNetworkSpecific("be_apikey", null);
  }

  static Future<bool> beApiKeySet(String? value) async {
    await setStringNetworkSpecific("be_apikey", value);
    return true;
  }

  static Future<String?> beApiSecretGet() async {
    return await getStringNetworkSpecific("be_apisecret", null);
  }

  static Future<bool> beApiSecretSet(String? value) async {
    await setStringNetworkSpecific("be_apisecret", value);
    return true;
  }

  static Future<bool> hasZcApiKey() async {
    var apikey = await Prefs.beApiKeyGet();
    if (apikey == null || apikey.isEmpty) return false;
    var apisecret = await Prefs.beApiSecretGet();
    if (apisecret == null || apisecret.isEmpty) return false;
    return true;
  }

  static Future<String?> bronzeKycTokenGet() async {
    return await getStringNetworkSpecific("bronze_kyc_token", null);
  }

  static Future<bool> bronzeKycTokenSet(String? value) async {
    await setStringNetworkSpecific("bronze_kyc_token", value);
    return true;
  }

  static Future<String?> bronzeBankAccountGet() async {
    return await getStringNetworkSpecific("bronze_bank_account", null);
  }

  static Future<bool> bronzeBankAccountSet(String? value) async {
    await setStringNetworkSpecific("bronze_bank_account", value);
    return true;
  }

  static Future<bool> nukeAll() async {
    return await PrefHelper().nukeAll();
  }
}
