import 'package:app/data/api/map_api/map_api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddres extends StatefulWidget{

  final String city;
  final String postcode;
  final String country;

  const MapAddres({
    Key? key,
    required this.city,
    required this.postcode,
    required this.country,
  }) : super(key:key);
  @override
  _MapAddres createState() => _MapAddres();

}

class _MapAddres extends State<MapAddres>{
  String get city => widget.city;
  String get postcode => widget.postcode;
  dynamic _initialCameraPosition;

  cameraPosition({required double lat, required double long}){
    _initialCameraPosition = CameraPosition(
      target: LatLng(lat, long),
      zoom: 20,
    );
  }

  @override
  Widget build(BuildContext context){
    Future<LatLng> latLong = MapLocation().getMapLocation(city: city, postcode: postcode);
    return Scaffold(
      backgroundColor: const Color(0xFF86C8BC),
      appBar: AppBar(
        title: buildText(text: "Localização", size: 24),
        backgroundColor: const Color(0xFF227C70), //D5CEA3
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder<LatLng>(
              future: latLong,
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  dynamic coordinates = snapshot.data ?? [];
                  cameraPosition(lat: coordinates.latitude, long: coordinates.longitude);
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: _initialCameraPosition,
                      mapType: MapType.normal,
                    ),
                  );
                } else {
                  return const Center(child: const CircularProgressIndicator(),);
                }
              }
          ),
        ],
      ),
    );
  }

  buildText({required String text, required double size}){
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}