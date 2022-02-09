import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../weather_reply.dart';

class Weather {
  String city;
  double temperature;
  double windSpeed;
  int woeid;

  Weather(this.city,
      this.temperature,
      this.windSpeed,
      this.woeid
      );
}
  // Future<int> getLocationId(String city) async {
  //   final locationUrl = Uri.parse('https://www.metaweather.com/api/location/search/?query=$city');
  //   final locationResponse = await http.get(locationUrl);
  //   final json = jsonDecode(locationResponse.body);
  //   return json;
  // }
  //
  // Future<Weather> fetchWeather(int locationId) async {
  //   final weatherUrl = Uri.parse('https://www.metaweather.com/api/location/$locationId');
  //   final weatherResponse = await http.get(weatherUrl);
  //   if (weatherResponse.statusCode == 200) {
  //     throw Exception(
  //         'Error');
  //   }
  //   final weatherJson = jsonDecode(weatherResponse.body);
  //   return weatherJson;
  //   //final consolidatedWeather = weatherJson as Map<String, dynamic>;
  // }
//}