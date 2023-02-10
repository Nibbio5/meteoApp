import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/ulils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({super.key, required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: const Text(
          "Today",
          style: TextStyle(fontSize: 18),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        alignment: Alignment.topCenter,
      ),
      hourlyList(),
    ], 
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Obx(((() => GestureDetector(
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(offset:  const Offset(0.5, 0),
                  blurRadius: 30,
                  spreadRadius: 1,
                  color: CustomColors.dividerLine.withAlpha(150))
                ],
                gradient: const LinearGradient(
                colors: [CustomColors.firstGradientColor, 
                CustomColors.secondGradientColor])),
              child: HourlyDetails(
                temp: weatherDataHourly.hourly.temperature2M[index].round(),
                day: weatherDataHourly.hourly.temperature2M[index].round(),
                weathercode: weatherDataHourly.hourly.temperature2M[index].round(),

              ),
            )))));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int day;
  int weathercode;
  HourlyDetails({super.key, required this.day, required this.weathercode, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
