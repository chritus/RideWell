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

class Home extends StatefulWidget {
  final LatLng destination;
  const Home({super.key, required this.destination});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Update the screens list in initState
  List<Widget> _screens = [];

  // List of screens to switch between
  @override
  void initState() {
    super.initState();
    _screens = [
      MapScreen(destination: widget.destination), // Pass destination
      One(), // Placeholder for search screen
      Two(), // Placeholder for Route screen
      Third(), // Placeholder for Flow screen
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
  final LatLng destination; // Pass destination from search screen

  const MapScreen({super.key, required this.destination});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> routePoints = [];
  LatLng? start;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  // Fetch the user's current location
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      start = LatLng(position.latitude, position.longitude);
    });
    if (start != null) {
      getRoute(); // Fetch the route once we have the current location
    }
  }

  // Fetch route from ORS and update state
  Future<void> getRoute() async {
    if (start != null) {
      final points = await fetchRoute(
        start!.latitude,
        start!.longitude,
        widget.destination.latitude,
        widget.destination.longitude,
      );
      setState(() {
        routePoints = points;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = [
      if (start != null)
        Marker(
          width: 80.0,
          height: 80.0,
          point: start!,
          child: Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: widget.destination,
        child: Icon(Icons.location_on, color: Colors.blue, size: 40),
      ),
    ];

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialZoom: 12,
            initialCenter: start ?? widget.destination,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
            MarkerLayer(markers: markers),
            if (routePoints.isNotEmpty)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: routePoints,
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ],
              ),
          ],
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
      ],
    );
  }
}
