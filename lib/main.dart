import 'package:flutter/material.dart';
import 'package:weatherapp/ui/weather_view.dart';
//import 'ui/WeatherApp.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      home: new  WeatherView(),
    );
  }
}

