import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temp area
        temperatureAreaWidget(),
        //datail: windspeed, humidity, clouds
        currentWeatherOtherDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherOtherDetailsWidget() {
    return Container();
  }

  Widget temperatureAreaWidget() {
    return Row(
      children: [
        Image.asset(
          "assets/images/${weatherDataCurrent.current.weathercode}.png",
        )
      ],
    );
  }
}


