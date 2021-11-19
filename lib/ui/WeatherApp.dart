import 'package:flutter/material.dart';
import '../network/WeatherService.dart';
import '../network/DTO/Weather.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Future<Weather> weather;
  Weather weatherData = Weather(0,0,0,'',44418);
  WeatherService weatherService = new WeatherService();

  // get temp => null;
  // get air_pressure => null;
  // get location => '';
  // get humidity => null;

  /*double temp = 0;
  double air_pressure = 0;
  int humidity = 0;
  String location = '';
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
    //updateWeather(weatherData);
  }
  //выполняет получение инф-ции о погоде по названию города
  void initWeather() async {
    final weather = await weatherService.fetchWeather('Moscow');
    print(weather.toString());
    setState(() {
      weatherData.location;
      weatherData.woeid;
      weatherData.temp.round();
      weatherData.air_pressure;
      weatherData.humidity;
    });

   // setState(() {
   //    location = result["title"];
   //    locId = result["woeid"];
   //    temp = weather['the_temp'].round();
   //    air_pressure = weather['air_pressure'];
   //    humidity = weather['humidity'];
   //  });
  }

  /*void updateWeather(Weather weatherData) async {
  setState(() {
    weatherData.location;
    weatherData.woeid;
    weatherData.temp.round();
    weatherData.air_pressure;
    weatherData.humidity;
  });
  }*/

  /*void onTextFieldSubmitted(String input) {
    fetchWeather(input);
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
            body: FutureBuilder<Weather>(
              future: weather,
                builder: (BuildContext context, AsyncSnapshot<Weather> snapshot){
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
                                    weatherData.temp.toString() + ' °C',
                                   // temp.toString() + ' °C',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60.0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    weatherData.location,
                                    //location,
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
                                        weatherData.air_pressure.toString() + ' mb',
                                        //air_pressure.toString() + ' mb',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30.0),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        weatherData.humidity.toString() + ' %',
                                        //humidity.toString() + ' %',
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
                                    /*onSubmitted: (String input) {
                                      onTextFieldSubmitted(input);
                                    },*/
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


