import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(24.912222892385948, 91.84548163531679),
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        onCameraMove: (CameraPosition cameraPosition) {},
        zoomControlsEnabled: true,
        mapToolbarEnabled: true,
        markers: <Marker>{
          Marker(
            markerId: MarkerId('my-home'),
            position: LatLng(24.912222892385948, 91.84548163531679),
            draggable: true,
            flat: false,
            onTap: () {
              print('Tapped');
            },
            onDrag: (LatLng latLng) {
              print(latLng);
            },
            onDragEnd: (LatLng latLng){
              print(latLng);
            },
            onDragStart: (LatLng latLng){
              print(latLng);
            },
            infoWindow: InfoWindow(
              title: 'My Home',
              onTap: (){
                print('Tapped on Info window');
              }
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
          Marker(
            markerId: MarkerId('Feature-one'),
            position: LatLng(24.90942755527116, 91.85124542329041),
            draggable: true,

          ),
          Marker(
            markerId: MarkerId('my-home-2'),
            position: LatLng(24.909797856037095, 91.84415152609834),
            draggable: true,

          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('redZone'),
            center: LatLng(24.91005243716895, 91.84637155867284),
            radius: 200,
          ),

        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('MyRoad'),
            points: [
              LatLng(24.915503628231285, 91.86308653421423),
              LatLng(24.91141683299132, 91.86111242842236),
              LatLng(24.90826406987201, 91.86754972991766),
              LatLng(24.91725507045673, 91.87033922723228),
              LatLng(24.915503628231285, 91.86308653421423),
            ],
            width: 4,

          ),
        },
      ),
    );
  }
}
