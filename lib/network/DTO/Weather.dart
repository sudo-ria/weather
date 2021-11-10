class Weather {
  final int temp;
  final double air_pressure;
  final int humidity;
  final String location;
  final int locId;


  Weather(
      this.temp,
      this.air_pressure,
      this.humidity,
      this.location,
      this.locId
      );

  Weather.fromJson(Map<String, dynamic> json)
  : temp = json['the_temp'],
  air_pressure = json['air_pressure'],
  humidity = json['humidity'],
  location = json['title'],
  locId = json['woeid'];

  Map<String, dynamic> toJson() => {
    'the_temp' : temp,
    'air_pressure' : air_pressure,
    'humidity' : humidity,
    'title' : location,
    'woeid' : locId
  };

}