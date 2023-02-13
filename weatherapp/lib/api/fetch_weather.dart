import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import '../models/weather_data.dart';
import 'package:http/http.dart' as http;
import '../models/weather_data_daily.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing data on response to jsonn
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    print(jsonString);
    
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String sartTime = DateFormat("y-MM-d").format(DateTime.now());
  String endTime =
      DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 7)));

  String tz = tzmap.latLngToTimezoneString(lat, lon).replaceAll("/", "%2F");
  print(tz);
  String url;
  url =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,showers,snowfall,snow_depth,weathercode,pressure_msl,surface_pressure,cloudcover,visibility,windspeed_10m,winddirection_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,rain_sum,showers_sum,snowfall_sum,precipitation_hours,windspeed_10m_max,winddirection_10m_dominant&current_weather=true&timezone=$tz&start_date=$sartTime&end_date=$endTime";
  //print(url);
  return url;
}
