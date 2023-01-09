import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class MapLocation{

  final String baseURL = "maps.googleapis.com";

  Future<LatLng> getMapLocation({required String city, required String postcode}) async {

    LatLng latLong;

    final Map<String, String> queryParameters = <String, String>{
      'address': '$postcode',
      'key': '<api-key>',
    };

    Uri url = Uri.https(baseURL, "/maps/api/geocode/json", queryParameters);
    Response response = await https.get(url);

    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final double lat = json['results'][0]['geometry']['location']['lat'];
      final double long = json['results'][0]['geometry']['location']['lng'];
      latLong = LatLng(lat, long);
      return latLong;
    } else {
      latLong = LatLng(37.43296265331129, -122.08832357078792);
      return latLong;
    }
  }
}