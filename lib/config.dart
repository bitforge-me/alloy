import 'package:universal_platform/universal_platform.dart';
import 'package:universal_html/html.dart' as html;
// uncomment if you need to override the app theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapdart/colors.dart';

const GitSha = 'GIT_SHA_REPLACE';
const BuildDate = 'BUILD_DATE_REPLACE';
const AppVersion = 15;
const AppTitle = 'Bitforge';
const AppLogo = 'assets/logo.png';
const MaxColumnWidth = 700.0;
const ButtonWidth = 320.0;
const ButtonHeight = 65.0;
const SupportUrl = 'https://be.bitforge.me/support/';
const LegalUrl = 'https://bitforge.me/legal/';
const MonospaceFont = 'RobotoMono';

// the default testnet value
const _DefaultTestnet = true;

// beryllium settings
const String _BeServerUrl = 'https://be-dan.bitforge.me/';

class BeLocationOverride {
  final String? altLocation;
  final bool testnet;
  const BeLocationOverride(this.altLocation, this.testnet);
}

// key is server hostname
const Map<String, BeLocationOverride> BeServerLocationOverrides = {
  'app.bitforge.me': BeLocationOverride('https://be.bitforge.me/', false),
  'be.bitforge.me': BeLocationOverride(null, false),
  'be-test.bitforge.me': BeLocationOverride(null, true)
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
    if (BeServerLocationOverrides.keys.contains(location.hostname)) {
      var altLocation =
          BeServerLocationOverrides[location.hostname]!.altLocation;
      if (altLocation != null) return altLocation;
      serverUrl = '${location.origin}/';
    }
  }
  return serverUrl;
}

bool testnet() {
  if (UniversalPlatform.isWeb) {
    var location = html.window.location;
    if (BeServerLocationOverrides.keys.contains(location.hostname))
      return BeServerLocationOverrides[location.hostname]!.testnet;
  }
  return _DefaultTestnet;
}

void initConfig() {
  overrideTheme(
      zapBrightness: Brightness.dark,
      zapPrimary: Color(0xffF49E3E),
      zapPrimaryDark: Color(0xffD47E1E),
      zapPrimaryGradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xfff46b45), Color(0xffeea849)],
      ),
      zapSecondary: Color(0xff282934),
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
      zapOutgoingFunds: Colors.yellow,
      zapIncomingFunds: Color(0xFF00ffce),
      zapSelfFunds: Colors.black,
      zapTextThemer: GoogleFonts.poppinsTextTheme);
}
