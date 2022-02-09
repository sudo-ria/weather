import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../weather.dart';
import 'DTO/City.dart';
import '../network/DTO/Weather.dart';


/*class WeatherService{

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
  if (response.statusCode == 200) {
    final weather = Weather.fromJson(jsonDecode(response.body));
    return Weather(weather.temperature, weather.windSpeed, weather.city);
  }  else if(response.statusCode != 200){
    throw Exception('Failed to load');
  }
}


 Future<Weather> fetchWeather(String city) async {
   final cities = await getCity(city);
   final cityId = cities[0].woeid;
   if (cityId == null){
     throw Exception('city not found');
   }
   return getWeather(cityId);
 }

}*/