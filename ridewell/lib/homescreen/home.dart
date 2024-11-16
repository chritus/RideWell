import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:ridewell/backend/open_route_service.dart';
import 'package:ridewell/components/Drawer/my_drawer.dart';
import 'package:ridewell/components/widgets/test.dart';
import 'package:ridewell/homescreen/search.dart';
import 'package:ridewell/homescreen/third.dart';
import 'package:ridewell/homescreen/two.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final LatLng? destination;

  const Home({super.key, this.destination});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // List of screens to switch between
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Initialize _screens using widget.latitude and widget.longitude
    _screens = [
      MapScreen(
          destination: widget.destination
          ), // Displaying the map screen here
      const One(), // Placeholder for search screen
      const Two(), // Placeholder for Route screen
      const Third(), // Placeholder for Flow screen
    ];
  }

  // Update the index when a BottomNavigationBar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        body: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex, // This will control the active screen
              children: _screens, // The screens to display
            ),
            Positioned(
              bottom: 10, // Align the custom navbar to the bottom
              left: 0,
              right: 0,
              child: CustomBottomNavBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped, // Update the selected index
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate MapScreen widget to display the map as the Home screen

class MapScreen extends StatefulWidget {
  final LatLng? destination;

  const MapScreen({super.key, this.destination});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List listOfPoints = [];
  List<LatLng> points = [];
// a function to consume the api
  getCoordinates() async {
    var response =
        await http.get(getRouteUrl("-0.186964,5.603717", "0.000000, 5.666667"));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = [
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(5.603717, -0.186964),
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(5.666667, 0.000000),
        child: Icon(Icons.location_on, color: Colors.blue, size: 40),
      ),
    ];
    return Stack(children: [
      FlutterMap(
        options: MapOptions(
          initialZoom: 12,
          initialCenter: LatLng(
              5.603717, -0.186964), // Center on user's location initially
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(markers: markers),
          PolylineLayer(polylines: [
            Polyline(
              points: points,
              color: Colors.red,
              strokeWidth: 5,
            )
          ])
        ],
      ),
      Positioned(
        top: 10,
        left: 40,
        child: FloatingActionButton(onPressed: () {
          getCoordinates();
        }),
      ),
      Positioned(
        top: 33,
        left: 13,
        child: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
    ]);
  }
}
