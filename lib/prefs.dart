import 'package:zapdart/prefhelper.dart';

import 'config.dart';

class Prefs {
  static String getKeyNetworkSpecific(String key) {
    var network = 'mainnet';
    if (testnet()) network = 'testnet';
    return '${server()}_${network}_${key}';
  }

  static Future<String?> getStringNetworkSpecific(
      String key, String? defaultValue) async {
    final prefs = PrefHelper();
    return prefs.getString(getKeyNetworkSpecific(key), defaultValue);
  }

  static Future<bool> setStringNetworkSpecific(
      String key, String? value) async {
    final prefs = PrefHelper();
    prefs.setString(getKeyNetworkSpecific(key), value);
    return true;
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

  static Future<bool> hasBeApiKey() async {
    var apikey = await Prefs.beApiKeyGet();
    if (apikey == null || apikey.isEmpty) return false;
    var apisecret = await Prefs.beApiSecretGet();
    if (apisecret == null || apisecret.isEmpty) return false;
    return true;
  }

  static Future<String> assetUnitGet(String asset, String defaultVal) async {
    var res = await getStringNetworkSpecific("{$asset}_unit", null);
    if (res == null) return defaultVal;
    return res;
  }

  static Future<bool> assetUnitSet(String asset, String value) async {
    await setStringNetworkSpecific("{$asset}_unit", value);
    return true;
  }

  static Future<bool> nukeAll() async {
    return await PrefHelper().nukeAll();
  }
}
