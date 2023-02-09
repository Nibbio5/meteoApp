import 'package:weatherapp_starter_project/model/weather/weather_data_current.dart';

class WeatherData {
  final WeahterDataCurrent? current;

  WeatherData([this.current]);

  //tunction to fetch the values
  WeahterDataCurrent getCurrentWeather() => current!;
  

}
