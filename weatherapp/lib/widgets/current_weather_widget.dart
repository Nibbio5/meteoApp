import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/ulils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temp area
        temperatureAreaWidget(),

        const SizedBox(
          height: 20,
        ),
        //datail: windspeed, humidity, clouds
        currentWeatherOtherDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherOtherDetailsWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/icons/windspeed.png"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/icons/clouds.png"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/icons/humidity.png"),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.windspeed}Km/h",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.windspeed}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.windspeed}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ]);
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/prova.png",
          //"assets/images/${weatherDataCurrent.current.weathercode}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherDataCurrent.current.temperature!.toInt()}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColors.textColorBlack,
              )),
          TextSpan(
              text: "mist",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              )),
        ]))
      ],
    );
  }
}
