import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> getCoordinates(String destinationTextController) async {
  final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=$destinationTextController&format=json&limit=1');
  final response = await http.get(url, headers: {
    'User-Agent': 'RideWell (princetetteh963@gmail.com)' // Required for Nominatim
  });

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      return {
        'latitude': double.parse(data[0]['lat']),
        'longitude': double.parse(data[0]['lon']),
      };
    }
  } else {
    print('Failed to load location');
  }
  return null;
}
