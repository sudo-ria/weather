import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/network/DTO/Weather.dart';


class WeatherService{
  Future<Map> getCity(String city) async {
    final locationUrl = 'https://www.metaweather.com/api/location/search/?query=$city';

    final locResponse = await http.get(Uri.parse(locationUrl));
    return json.decode(locResponse.body);
}
Future<Weather> fetchWeather(int locId) async {
  final weatherUrl = 'https://www.metaweather.com/api/location/$locId'; //use some $baseurl ???
  final weatherResponse = await http.get(Uri.parse(weatherUrl + locId.toString()));

  final weatherJson = jsonDecode(weatherResponse.body);
  return Weather.fromJson(weatherJson);
}

}