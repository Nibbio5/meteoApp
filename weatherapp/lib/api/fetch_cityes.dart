import 'package:weatherapp_starter_project/models/cities.dart';
import 'package:weatherapp_starter_project/models/citiesData.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  CitiesData? cityesData;

  //processing data on response to jsonn
  Future<CitiesData> processData(s) async {
    var response = await http.get(Uri.parse(apiURL(s)));
    cityesData = CitiesData(
        cityesFromJson(response.body));
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