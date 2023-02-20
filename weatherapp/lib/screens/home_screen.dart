import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/citysearcher.dart';
import 'package:weatherapp_starter_project/models/citiesData.dart';
import 'package:weatherapp_starter_project/ulils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';
import '../controller/global_controller.dart';
import '../widgets/daily_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = '';
  List<String> _suggestions = [];
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          title: const Text('search'),
          onSearch: (value) => setState(() => _suggestions[0]=   getCity(value).toString()  /*searchValue = value*/   ),
          suggestions: _suggestions
        ),
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                    weatherDataHourly: 
                        globalController.getData().getHourlyWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                    weatherDataHourly: globalController.getData().getHourlyWeather()),

                  DailyDataWidget(
                    weatherDataDaily: globalController.getData().getDailyWeather()),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              )
            )
        ),
      ),
    );
  }
}
