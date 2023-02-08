import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;

import '../model/weather.dart';

class FetchWeatherAPI {
  WeatherData? weather;

  // processing the data form the json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    WeatherData weatherData = weatherDataFromJson(jsonString);
    return weatherData;
  }
}

String apiURL(var lat, var lon) {
  String url;
  String tz = tzmap.latLngToTimezoneString(lat, lon).replaceAll("/", "%2F");
  url =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,showers,snowfall,snow_depth,weathercode,pressure_msl,surface_pressure,cloudcover,visibility,windspeed_10m,winddirection_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,rain_sum,showers_sum,snowfall_sum,precipitation_hours,windspeed_10m_max,winddirection_10m_dominant&current_weather=true&timezone=$tz&start_date=2023-02-08&end_date=2023-02-15";
  return url;
}
