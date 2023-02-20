import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weatherapp_starter_project/screens/home_screen.dart';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //theme data
    //dynamic colors
    //rives
    return const GetMaterialApp(
      home: HomeScreen(),
      title: "Meteo",
      debugShowCheckedModeBanner: false,
    );
  }
  
}