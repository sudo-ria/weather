class Weather {
  final int temp;
  final double air_pressure;
  final int humidity;
  final String location;
  final int woeid;


  Weather(
      this.temp,
      this.air_pressure,
      this.humidity,
      this.location,
      this.woeid
      );

  Weather.fromJson(Map<String, dynamic> json)
  : temp = json['the_temp'],
  air_pressure = json['air_pressure'],
  humidity = json['humidity'],
  location = json['title'],
  woeid = json['woeid'];
}
