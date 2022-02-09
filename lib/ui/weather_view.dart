import 'package:flutter/material.dart';
import 'package:weatherapp/network/weather_data_provider.dart';
import 'package:weatherapp/weather_reply.dart';

class WeatherView extends StatefulWidget {
  //const WeatherView({Key key}) : super(key: key);

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<WeatherReply> weather;
  WeatherDataProvider weatherDataProvider = WeatherDataProvider();


  @override
  void initState() {
    super.initState();
    initWeatherReply();
  }

  void initWeatherReply() {
    weather = weatherDataProvider.fetchWeather(2487956);
  }

  void onTextFieldSubmitted(int city) async {
    setState(() {
      weather = weatherDataProvider.fetchWeather(city);
    });
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
            body: FutureBuilder<WeatherReply>(
                future: weather,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherReply> snapshot) {
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
                                    ' ${snapshot.data.temperature
                                        .toStringAsFixed(1) + ' °C'}',
                                    // snapshot.data.temp.toString() + ' °C',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60.0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    ' ${snapshot.data.city}',
                                    //snapshot.data.title!=null?snapshot.data.title:'',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40.0),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Center(
                                      child: Text(
                                        ' ${snapshot.data.windSpeed.toStringAsFixed(1) + 'mb'}',
                                        //snapshot.data.air_pressure.toString() + ' mb',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0),
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
                                    // onSubmitted: (String city) {
                                    //   onTextFieldSubmitted(city);
                                    // },
                                    style:
                                    TextStyle(
                                        color: Colors.white, fontSize: 25),
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

