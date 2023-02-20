import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_data_daily.dart';
import 'package:weatherapp_starter_project/ulils/methods.dart';

import '../ulils/custom_colors.dart';

class DailyDataWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataWidget({super.key, required this.weatherDataDaily});

  String getDay(final day) {
    DateTime time = DateTime.parse(day.toString());
    String x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style:
                  TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
            )),
        dailyList(),
      ]),
    );
  }

  Widget dailyList() {
    return SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: weatherDataDaily.daily.time.length > 7
                ? 7
                : weatherDataDaily.daily.time.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            getDay(weatherDataDaily.daily.time[index + 1]),
                            style: const TextStyle(
                                color: CustomColors.textColorBlack,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                             getDayOrNight(weatherDataDaily.daily.weathercode[index]),
                            //"assets/weather/01d.png"
                            ),
                        ),
                        Text(
                          "${weatherDataDaily.daily.temperature2MMax[index + 1]}°/${weatherDataDaily.daily.temperature2MMin[index + 1]}°",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                ],
              );
            }));
  }
}
