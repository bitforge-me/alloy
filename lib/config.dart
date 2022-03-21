import 'package:universal_platform/universal_platform.dart';
// uncomment if you need to override the app theme
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:zapdart/colors.dart';

const AppVersion = 6;
const AppTitle = 'Alloy';
const AppLogo = 'assets/logo.png';
const SupportUrl = 'https://bronze-support.zap.me/';

// the testnet value
const Testnet = true;

// Zap Crypto settings
const String BeServerUrl = 'https://beryllium-test.zap.me/';
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

void initConfig() {
  overrideTheme();
  // example
  /*overrideTheme(
    zapWhite: Colors.lightBlue[50],
    zapYellow: Colors.teal[100],
    zapWarning: Colors.yellow,
    zapWarningLight: Colors.yellow[100],
    zapBlue: Colors.pink[200],
    zapBlueGradient: LinearGradient(colors: [Colors.pink[200]!, Colors.pink[400]!]),
    zapGreen: Colors.blueGrey[300],
    zapGreenGradient: LinearGradient(colors: [Colors.blueGrey[300]!, Colors.blueGrey[500]!]),
    zapOutgoingFunds: Colors.red,
    zapIncomingFunds: Colors.green,
    zapTextThemer: GoogleFonts.sansitaTextTheme);
    */
}
