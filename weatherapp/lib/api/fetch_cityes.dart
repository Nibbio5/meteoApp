import 'dart:convert';

import 'package:weatherapp_starter_project/models/cities.dart';
import 'package:weatherapp_starter_project/models/citiesData.dart';
import 'package:http/http.dart' as http;

class FetchCityAPI {
  List<Cityes>? cityesData;

  //processing data on response to jsonn
  Future<List<Cityes>> processCities(String s) async {
    var response = await http.get(Uri.parse(apiURL(s)));
    var jsonString = jsonDecode(response.body);
    //cityesData = CitiesData.cityesFromJson();
    return cityesData!;
  }
}

String apiURL(String s) {
  String url;
  url =
      "https://nominatim.openstreetmap.org/search.php?q=$s&limit=5&format=jsonv2";
  //print(url);
  return url;
}