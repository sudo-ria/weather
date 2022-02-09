/*import 'package:flutter/material.dart';
import '../network/WeatherService.dart';
import '../network/DTO/Weather.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Future<Weather> weather;
  //Weather weatherData = Weather(0,0,0,' ',44418);
  WeatherService weatherService = WeatherService();

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
    //weatherService.fetchWeather('Moscow');
  }
  //выполняет получение инф-ции о погоде по названию города
  void initWeather()  {
    weather = weatherService.fetchWeather('London');
   // setState(() {
   //    location = result["title"];
   //    locId = result["woeid"];
   //    temp = weather['the_temp'].round();
   //    air_pressure = weather['air_pressure'];
   //    humidity = weather['humidity'];
   //  });
  }
  // 1. создать метод, который будет обраб-ть введенную юзером строку из поля
  // 2. необходимо вызывать fetchWeather и передавать в качестве аргумента строку, которую ввел юзер на шаге 1
  // 3. добавить обработку для ситуации, когда город не найден

 /* void updateWeather(Weather weatherData) async {
  setState(() {
    location = weatherData.location;
    locId =  weatherData.woeid;
    temp = weatherData.temp.round();
    air_pressure = weatherData.air_pressure;
    humidity = weatherData.humidity;
  });
  }*/

  void onTextFieldSubmitted(String city) async {
    setState(() {
      weather = weatherService.fetchWeather(city);
    });
      //weatherService.fetchWeather(city);
  }

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
                    case ConnectionState.waiting:
                      return Center(
                       child: Text(
                          'Loading...',
                        style: TextStyle(
                            color: Colors.white, fontSize: 30.0),
                      ),
                    );
                    default:
                      if (snapshot.hasError)
                        return Center(
                          child: Text(
                            'Error',
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0),
                          ),
                        );
                      else
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                  ' ${snapshot.data.consolidatedWeather[0].theTemp.toStringAsFixed(1) + ' °C'}',
                                   // snapshot.data.temp.toString() + ' °C',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60.0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    ' ${snapshot.data.title}',
                                    //snapshot.data.title!=null?snapshot.data.title:'',
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
                                        ' ${snapshot.data.consolidatedWeather[0].airPressure.toString() + 'mb'}',
                                        //snapshot.data.air_pressure.toString() + ' mb',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30.0),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        ' ${snapshot.data.consolidatedWeather[0].humidity.toString() + ' %'}',
                                        //snapshot.data.humidity.toString() + ' %',
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
                                    onSubmitted: (String city) {
                                      onTextFieldSubmitted(city);
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
          ),
      ),
    );
  }

}

*/
