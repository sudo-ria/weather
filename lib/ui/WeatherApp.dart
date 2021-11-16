import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weatherapp/network/DTO/Weather.dart';
import 'dart:convert';

import 'package:weatherapp/network/WeatherService.dart';

//import '../network/WeatherService.dart' as network;
//import '../network/DTO/Weather.dart' as network;

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  Weather weatherData;
  WeatherService weatherService = new WeatherService();

  get temp => null;

  get air_pressure => null;

  String get location => '';

  get humidity => null;
  /*int temp = 0;
  double air_pressure = 0;
  int humidity = 0;
  String location = 'London';
  int locId = 44418;*/

  /*String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';
  String locationApiUrl = 'https://www.metaweather.com/api/location/';*/

 /* void fetchSearch(String input) async {
    var searchResult = await http.get(Uri.parse(searchApiUrl + input));
    var result = json.decode(searchResult.body)[0];

    setState(() {
      location = result["title"];
      locId = result["woeid"];
    });
  }*/

  /*void fetchLocation() async {
    var locationResult = await http.get(Uri.parse(locationApiUrl + locId.toString()));
    var result = json.decode(locationResult.body);
    var consolidated_weather = result["consolidated_weather"];
    var data = consolidated_weather[0];

    setState(() {
      temp = data['the_temp'].round();
      air_pressure = data['air_pressure'];
      humidity = data['humidity'];
      // weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
    });
  }*/

 /* Future<void> setState() async {
    location = result["title"];
    locId = result["woeid"];
    temp = data['the_temp'].round();
    air_pressure = data['air_pressure'];
    humidity = data['humidity'];
  }*/
  @override
  void initState() {
    super.initState();
    initWeather();
  }
  //выполняет получение инф-ции о погоде по названию города
  void initWeather() async {
    final weather = await weatherService.fetchWeather('moscow');
  }

  /*void weatherData() async {
    location = result["title"];
    locId = result["woeid"];
    temp = data['the_temp'].round();
    air_pressure = data['air_pressure'];
    humidity = data['humidity'];
  }*/

  /*void onTextFieldSubmitted(String input) {
    fetchWeatherr(input);
  }*/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bckgr.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FutureBuilder<String>(
              future: weatherData,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return Text('Error');
                      else
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    temp.toString() + ' °C',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60.0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40.0),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Center(
                                      child: Text(
                                        air_pressure.toString() + ' mb',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30.0),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        humidity.toString() + ' %',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  child: TextField(
                                    onSubmitted: (String input) {
                                      //onTextFieldSubmitted(input);
                                    },
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Enter city...',
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                      prefixIcon:
                                      Icon(Icons.search, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                  }
                }
            ),

          )),
    );
  }

}


