import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/ulils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  //card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      height: 160,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 24,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: CustomColors.dividerLine.withAlpha(150))
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])
                        : null),
                child: HourlyDetails(
                  index: index,
                  cardIndex: cardIndex.toInt(),
                  temp: weatherDataHourly.hourly.temperature2M[index].round(),
                  time: weatherDataHourly.hourly.time[index],
                  weathercode:
                      weatherDataHourly.hourly.temperature2M[index].round(),
                ),
              ))));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp;
  final String time;
  final int index;
  final int cardIndex;
  final int weathercode;

  const HourlyDetails(
      {super.key,
      required this.cardIndex,
      required this.index,
      required this.time,
      required this.weathercode,
      required this.temp});

  String getTime(final timeStamp) {
    DateTime time = DateTime.parse(timeStamp);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            index == 0? "00:00AM" : getTime(time), 
            style: TextStyle(
              color: cardIndex == index? Colors.white 
              : CustomColors.textColorBlack,
            ),),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/04n.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
              color: cardIndex == index? Colors.white 
              : CustomColors.textColorBlack,
            ),),
        )
      ],
    );
  }
}
