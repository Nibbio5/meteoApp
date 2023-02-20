import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import '../models/weather_data.dart';
import 'package:http/http.dart' as http;
import '../models/weather_data_daily.dart';
import 'package:geocoding/geocoding.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;
  var latitude, longitude;
  String? city;

  //processing data on response to jsonn
  Future<WeatherData> processData(lat, lon) async {

      latitude = lat;
      longitude = lon;
      var response = await http.get(Uri.parse(apiURL(lat, lon)));
      getCityName();
      var jsonString = jsonDecode(response.body);
      print(jsonString);

      weatherData = WeatherData(
          WeatherDataCurrent.fromJson(jsonString),
          WeatherDataHourly.fromJson(jsonString),
          WeatherDataDaily.fromJson(jsonString));
  
    return weatherData!;
  }

  String convertCoordinates(locations) {
    //latitude substring(17, 22)
    var lat = double.parse(double.parse(locations
            .toString()
            .split(',')[0]
            .replaceAll("[      Latitude: ", ""))
        .toStringAsFixed(2));
    var lon = double.parse(double.parse(locations
            .toString()
            .split(',')[1]
            .replaceAll("      Longitude: ", ""))
        .toStringAsFixed(2));
    latitude = lat;
    longitude = lon;
    return apiURL(lat, lon);
  }

  getCityName() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks
        .toString()
        .split(',')[5]
        .replaceAll('      Administrative area: ', '');
  }

  String getCity() {
    return city!;
  }
}

String apiURL(var lat, var lon) {
  String sartTime = DateFormat("y-MM-d").format(DateTime.now());
  String endTime =
  DateFormat("y-MM-d").format(DateTime.now().add(const Duration(days: 7)));
  String tz = tzmap.latLngToTimezoneString(lat, lon).replaceAll("/", "%2F");
  print(tz);
  String url;
  url =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,weathercode,cloudcover&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=$tz&start_date=$sartTime&end_date=$endTime";
  //print(url);
  return url;
}
