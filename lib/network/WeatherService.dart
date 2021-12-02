import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../network/DTO/Weather.dart';
import '../network/DTO/City.dart';


class WeatherService{

 Future<List<City>> getCity(String city) async {
    final locationUrl = 'https://www.metaweather.com/api/location/search/?query=$city';
    final response = await http.get(Uri.parse(locationUrl));
    final json = jsonDecode(response.body);
    final result = new List<City>();
      json.forEach((v) {
        result.add(new City.fromJson(v));
      });
    return result;
}

Future<Weather> getWeather(int locId) async {
  final url = 'https://www.metaweather.com/api/location/$locId/';
  final response = await http.get(Uri.parse(url));
  final json = jsonDecode(response.body);
  // TODO добавить проверку на успешный вызов апи(200 ок)
  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  }  else if(response.statusCode != 200){
    throw Exception('Failed to load');
  }
  final weather = Weather.fromJson(json["consolidated_weather"][0]);
  return weather;
}


 Future<Weather> fetchWeather(String city) async {
   final cities = await getCity(city);
   final cityId = cities[0].woeid;
   // TODO: добавить проверку на пустой спиcок городов
   if (cityId == null){
     throw Exception('city not found');
   }
   return getWeather(cityId);
 }

}