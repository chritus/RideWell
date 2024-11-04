import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<LatLng>> fetchRoute(double startLat, double startLon, double endLat, double endLon) async {
  final url = Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car');
  final headers = {
    'Authorization': '5b3ce3597851110001cf62483588aa184b3f417483e41851c07d4f1e',
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'coordinates': [
      [startLon, startLat], // Start coordinates as [longitude, latitude]
      [endLon, endLat], // End coordinates
    ]
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> coordinates = data['features'][0]['geometry']['coordinates'];
    return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
  } else {
    print('Failed to fetch route: ${response.statusCode}');
    throw Exception('Failed to fetch route');
  }
}
