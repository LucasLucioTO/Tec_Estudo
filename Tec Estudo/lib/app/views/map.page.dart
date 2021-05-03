import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = -9.8100015;
  double long = -36.6092627;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (val) {
            lat = -9.8100015;
            long = -36.6092627;
            LatLng position = LatLng(lat,long);
            mapController.moveCamera(CameraUpdate.newLatLng(position));
            final Marker marker = Marker(
              markerId: new MarkerId("123"),
              position: position,
              infoWindow: InfoWindow(
                title: "IFAL Arapiraca",
                snippet: 'Arapiraca/AL',
              ),

            );
            setState(() {
              markers.add(marker);
            });
          },
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(-9.8100015, -36.6092627),
            zoom: 11.0,
          ),
          markers: markers = markers,
        ),
      ),
    );
  }
}





