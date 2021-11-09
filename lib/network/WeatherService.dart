import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherService{
  Future<Map> getWeather(String city ) async {
    String ApiUrl = 'https://www.metaweather.com/api/location/search/?query=$city';

    http.Response response = await http.get(Uri.parse(ApiUrl));
    return json.decode(response.body);
}
}