import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


Future<String> getCity (String str) async {
  List<Location> locations = await locationFromAddress(str);
  print(locations);
  return "";
  }