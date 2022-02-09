// class Weather {
//   List<ConsolidatedWeather> consolidatedWeather;
//   String title;
//   int woeid;
//
//
//   Weather(
//       {this.consolidatedWeather,
//         this.title,
//         this.woeid,});
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     if (json['consolidated_weather'] != null) {
//       consolidatedWeather = new List<ConsolidatedWeather>();
//       json['consolidated_weather'].forEach((v) {
//         consolidatedWeather.add(new ConsolidatedWeather.fromJson(v));
//       });
//     }
//
//     title = json['title'];
//     woeid = json['woeid'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.consolidatedWeather != null) {
//       data['consolidated_weather'] =
//           this.consolidatedWeather.map((v) => v.toJson()).toList();
//     }
//
//     data['title'] = this.title;
//     data['woeid'] = this.woeid;
//     return data;
//   }
// }
//
// class ConsolidatedWeather {
//
//   double theTemp;
//   double airPressure;
//   int humidity;
//
//   ConsolidatedWeather(
//       {
//         this.theTemp,
//
//         this.airPressure,
//         this.humidity,
//         });
//
//   ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
//
//     theTemp = json['the_temp'];
//     airPressure = json['air_pressure'];
//     humidity = json['humidity'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['the_temp'] = this.theTemp;
//     data['air_pressure'] = this.airPressure;
//     data['humidity'] = this.humidity;
//     return data;
//   }
// }






