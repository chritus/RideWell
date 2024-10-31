import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:ridewell/components/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:ridewell/homescreen/home.dart';
import 'dart:convert';

import '../components/widgets/textfields.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  final destinationTextController = TextEditingController();
  Map<String, dynamic>? locationCoordinates;

  // Function to get coordinates from Nominatim API
  Future<void> getCoordinates(String location) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$location&format=json&limit=1');
    final response = await http.get(url, headers: {
      'User-Agent': 'RideWellApp (your@email.com)' // Required for Nominatim
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          locationCoordinates = {
            'latitude': double.parse(data[0]['lat']),
            'longitude': double.parse(data[0]['lon']),
          };
        });
      } else {
        print('Location not found.');
      }
    } else {
      print('Failed to load location.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      body: Column(
        children: [
          Row(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.arrow_left_1, size: 35),
            ),
            SizedBox(
              width: width * 0.3,
            ),
            Text(
              'Search',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ]),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.05,
            width: width * 0.9,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                Icon(
                  Iconsax.location,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                Text('Current Location')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: Textfields(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(148, 76, 178, 230))),
              controller: destinationTextController,
              hintText: 'Destination',
              obscureText: false,
              suffixIcon: null,
            ),
          ),
          SizedBox(height: height * 0.5),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Buttons(
              text: "Let's go",
              onTap: () async {
                final destination = destinationTextController.text;
                if (destination.isNotEmpty) {
                  await getCoordinates(destination);
                  if (locationCoordinates != null) {
                    // Extract latitude and longitude from locationCoordinates
                    final destinationLat = locationCoordinates!['latitude'];
                    final destinationLon = locationCoordinates!['longitude'];

                    // Navigate to MapScreen with the destination coordinates
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(destinationLat, destinationLon),
                      ),
                    );
                  } else {
                    print('Could not retrieve coordinates.');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
