import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart';

import 'config.dart';

class Place {
  final String streetNumber;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  Place(this.streetNumber, this.street, this.city, this.state, this.zipCode,
      this.country);

  @override
  String toString() {
    return '$streetNumber $street, $city, $state, $zipCode, $country';
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

abstract class PlaceApi {
  Future<List<Suggestion>> fetchSuggestions(String input, String lang);
  Future<Place> getPlaceDetailFromId(String placeId);
}

class GooglePlaceApiProvider implements PlaceApi {
  GooglePlaceApiProvider(this.sessionToken);

  final sessionToken;
  final client = Client();
  final apiKey =
      Platform.isAndroid ? GooglePlaceApiKeyAndroid : GooglePlaceApiKeyIOS;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ch&key=$apiKey&sessiontoken=$sessionToken');
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else
      return [];
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken');
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        var streetNumber, street, city, state, zipCode, country;
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            street = c['long_name'];
          }
          if (type.contains('locality')) {
            city = c['long_name'];
          }
          if (type.contains('administrative_area_level_1')) {
            state = c['long_name'];
          }
          if (type.contains('postal_code')) {
            zipCode = c['long_name'];
          }
          if (type.contains('country')) {
            country = c['long_name'];
          }
        });
        return Place(streetNumber, street, city, state, zipCode, country);
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch place detail');
    }
  }
}

class LocationIqApiProvider implements PlaceApi {
  final client = Client();
  final apiKey =
      Platform.isAndroid ? LocationIqApiKeyAndroid : LocationIqApiKeyIOS;
  dynamic lastResult;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request = Uri.parse(
        'https://api.locationiq.com/v1/autocomplete.php?key=$apiKey&q=$input&accept-language=$lang');
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      lastResult = result;
      // compose suggestions in a list
      return result
          .map<Suggestion>((p) => Suggestion(p['place_id'], p['display_name']))
          .toList();
    } else
      return [];
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    if (lastResult != null) {
      for (var p in lastResult) {
        if (p['place_id'] == placeId) {
          final addr = p['address'];
          var streetNumber = addr['house_number'];
          var street = addr['road'];
          var city = addr['city'];
          var state = addr['state'];
          var zipCode = addr['postcode'];
          var country = addr['country'];
          return Place(streetNumber, street, city, state, zipCode, country);
        }
      }
    }
    throw Exception('Failed to fetch place detail');
  }
}

bool availablePlaceApi() {
  if (GooglePlaceApiKeyAndroid != null && GooglePlaceApiKeyIOS != null)
    return true;
  if (LocationIqApiKeyAndroid != null && LocationIqApiKeyIOS != null)
    return true;
  return false;
}

PlaceApi? createPlaceApi() {
  if (GooglePlaceApiKeyAndroid != null && GooglePlaceApiKeyIOS != null)
    return GooglePlaceApiProvider(Uuid().v4());
  if (LocationIqApiKeyAndroid != null && LocationIqApiKeyIOS != null)
    return LocationIqApiProvider();
  return null;
}
