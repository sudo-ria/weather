import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:weatherapp/weather_reply.dart';

//import 'DTO/City.dart';

// class WeatherDataProvider{
//
//   Future<List<City>> getCity(String city) async {
//     final locationUrl = 'https://www.metaweather.com/api/location/search/?query=$city';
//     final response = await http.get(Uri.parse(locationUrl));
//     final json = jsonDecode(response.body);
//     final result = new List<City>();
//     json.forEach((v) {
//       result.add(new City.fromJson(v));
//     });
//     return result;
//   }
//
//   Future<WeatherReply> getWeather(int locId) async {
//     final url = 'https://www.metaweather.com/api/location/$locId/';
//     final response = await http.get(Uri.parse(url));
//     final json = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       final weather = WeatherReply.fromJson(jsonDecode(response.body));
//       return WeatherReply(weather.city,weather.temperature, weather.windSpeed, weather.woeid);
//     }  else if(response.statusCode != 200){
//       throw Exception('Failed to load');
//     }
//   }
//
//
//   Future<WeatherReply> fetchWeather(String city) async {
//     final cities = await getCity(city);
//     final cityId = cities[0].woeid;
//     if (cityId == null){
//       throw Exception('city not found');
//     }
//     return getWeather(cityId);
//   }
//
// }


class WeatherDataProvider{
  static const baseUrl = 'https://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception(
          "'$city' not found");
    }
    final locationJson = jsonDecode(locationResponse.body) as List;
    if (locationJson.isEmpty) {
      throw Exception(
          "No data for this '$city'");
    }
    return locationJson.first['woeid'];
  }

  Future<WeatherReply> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception(
          'There was a problem getting data for this city. Please try again.');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson as Map<String, dynamic>;

    final weather = WeatherReply.fromJson(consolidatedWeather);
    return weather;
  }
}