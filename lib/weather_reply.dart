
class WeatherReply {

   String city;
   double temperature;
   double windSpeed;
   int woeid;



  WeatherReply(this.city,this.temperature,this.windSpeed, this.woeid);

   WeatherReply.fromJson(Map<String, dynamic> json) {
      city = json['title'];
      temperature = json['consolidated_weather'][0]['the_temp'];
      windSpeed = json['consolidated_weather'][0]['wind_speed'];
      woeid = json['woeid'];
  }
}


/*class WeatherReply{
  double temperature;
  double windSpeed;
  String city;

  WeatherReply(
      this.temperature,
      this.windSpeed,
      this.city
      );

  WeatherReply.fromJson(Map<String, dynamic> json){
    temperature = json['the_temp'];
    windSpeed = json['wind_speed'];
    city = json['title'];
  }*/

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //
  //   data['the_temp'] = this.temperature;
  //   data['wind_speed'] = this.windSpeed;
  //   data['title'] = this.city;
  //   return data;
  // }

