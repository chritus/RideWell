const String baseUrl =
    "https://api.openrouteservice.org/v2/directions/driving-car";
const String apiKey =
    "5b3ce3597851110001cf62483588aa184b3f417483e41851c07d4f1e";

getRouteUrl(String startPoint, String endPoint) {
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
