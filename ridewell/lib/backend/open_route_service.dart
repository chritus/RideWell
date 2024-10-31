import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';

Future<List<LatLng>> fetchRoute(double startLat, double startLon, double endLat, double endLon) async {
  final String orsApiKey = 'YOUR_ORS_API_KEY';
  final url = Uri.parse(
      'https://api.openrouteservice.org/v2/directions/foot-walking?api_key=$orsApiKey&start=$startLon,$startLat&end=$endLon,$endLat');
  
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> coordinates = data['features'][0]['geometry']['coordinates'];
    return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
  } else {
    print("Failed to fetch route: ${response.statusCode}");
    return [];
  }
}
