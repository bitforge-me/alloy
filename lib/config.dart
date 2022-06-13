import 'package:universal_platform/universal_platform.dart';
import 'package:universal_html/html.dart' as html;
// uncomment if you need to override the app theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapdart/colors.dart';

const GitSha = 'GIT_SHA_REPLACE';
const BuildDate = 'BUILD_DATE_REPLACE';
const AppVersion = 8;
const AppTitle = 'Alloy';
const AppLogo = 'assets/logo.png';
const SupportUrl = 'https://bronze-support.zap.me/';

// the default testnet value
const _DefaultTestnet = true;

// Zap Crypto settings
const String _BeServerUrl = 'https://beryllium-test.zap.me/';
// key is server hostname, and value is 'testnet'
const Map<String, bool> BeServerLocationOverrides = {
  'beryllium.zap.me': false,
  'beryllium-test.zap.me': true
};
// registration
const bool RequireMobileNumber = true;
const String? InitialMobileCountry = 'NZ';
const List<String>? PreferredMobileCountries = [
  'New Zealand',
  'Australia',
  'United States of America'
];
const bool RequireAddress = true;
const String? GooglePlaceApiKeyIOS = null;
const String? GooglePlaceApiKeyAndroid = null;
const String? GooglePlaceApiKeyWeb = null;
const String? LocationIqApiKeyIOS = 'pk.e53109b5fdcb2dfd00bbc57c8b713d79';
const String? LocationIqApiKeyAndroid = 'pk.e53109b5fdcb2dfd00bbc57c8b713d79';
const String? LocationIqApiKeyWeb = 'pk.e53109b5fdcb2dfd00bbc57c8b713d79';

String? googlePlaceApiKey() {
  if (UniversalPlatform.isAndroid) return GooglePlaceApiKeyAndroid;
  if (UniversalPlatform.isIOS) return GooglePlaceApiKeyIOS;
  return GooglePlaceApiKeyWeb;
}

String? locationIqApiKey() {
  if (UniversalPlatform.isAndroid) return LocationIqApiKeyIOS;
  if (UniversalPlatform.isIOS) return LocationIqApiKeyAndroid;
  return LocationIqApiKeyWeb;
}

String server() {
  var serverUrl = _BeServerUrl;
  if (UniversalPlatform.isWeb) {
    var location = html.window.location;
    if (BeServerLocationOverrides.keys.contains(location.hostname))
      serverUrl = location.origin + '/';
  }
  return serverUrl;
}

bool testnet() {
  if (UniversalPlatform.isWeb) {
    var location = html.window.location;
    if (BeServerLocationOverrides.keys.contains(location.hostname))
      return BeServerLocationOverrides[location.hostname]!;
  }
  return _DefaultTestnet;
}

void initConfig() {
  overrideTheme(
      zapBrightness: Brightness.dark,
      zapPrimary: Color(0xffF49E3E),
      zapPrimaryDark: Color(0xffD47E1E),
      zapPrimaryGradient: LinearGradient(
          begin: Alignment(0.9999999403953552, 8.690536290600903e-9),
          end: Alignment(-1.540519534160012e-8, 0.2562732696533203),
          colors: [
            Color.fromRGBO(114, 57, 32, 1),
            Color.fromRGBO(139, 76, 40, 1),
            Color.fromRGBO(149, 75, 41, 1),
            Color.fromRGBO(195, 100, 55, 1),
            Color.fromRGBO(143, 75, 42, 1),
            Color.fromRGBO(168, 86, 45, 1),
            Color.fromRGBO(237, 120, 66, 1),
            Color.fromRGBO(166, 83, 45, 1),
            Color.fromRGBO(123, 62, 32, 1)
          ]),
      zapSecondary: Color(0xff22232c),
      zapSecondaryDark: Color(0xff22232c),
      zapSecondaryGradient:
          LinearGradient(colors: [Color(0xff32333c), Color(0xff12131c)]),
      zapSurface: Colors.white30,
      zapBackground: Color(0xff1B1C25),
      zapError: Colors.redAccent,
      zapOnPrimary: Colors.white,
      zapOnSecondary: Colors.white,
      zapOnError: Colors.black,
      zapOnSurface: Colors.white,
      zapOnBackground: Colors.white,
      zapOnBackgroundLight: Colors.white54,
      zapYellow: Colors.yellow,
      zapYellowGradient:
          LinearGradient(colors: [Colors.yellow, Color(0xFFFFD030)]),
      zapGreen: Color(0xFF009075),
      zapGreenGradient:
          LinearGradient(colors: [Color(0xFF009075), Color(0xFF109090)]),
      zapRed: Colors.redAccent,
      zapWarning: Colors.yellow,
      zapWarningLight: Colors.yellow[100],
      zapBlack: Colors.black,
      zapBlackLight: Colors.black38,
      zapBlackMed: Colors.black87,
      zapOutgoingFunds: Colors.red,
      zapIncomingFunds: Colors.green,
      zapSelfFunds: Colors.black,
      zapTextThemer: GoogleFonts.poppinsTextTheme);
}
