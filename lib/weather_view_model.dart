import 'package:weatherapp/weather.dart';

class WeatherViewModel{
  final String city;
  final String temperature;
  final String windSpeed;
  final String woeid;

  WeatherViewModel(this.city,this.temperature, this.windSpeed, this.woeid);

  WeatherViewModel.weather (Weather weather)
    :  city  = weather.city.toString(),
        temperature = weather.temperature.toString(),
    windSpeed  = weather.windSpeed.toString(),
  woeid = weather.woeid.toString();


  //WeatherViewModel.fromWeather(Weather weather, this.temperature, this.windSpeed, this.city);

}

//
// class WeatherViewModel extends StatelessWidget {
//   const WeatherViewModel({Key key, this.theTemp, this.windSpeed, this.city}) : super(key: key);
//   final String theTemp;
//   final String windSpeed;
//   final String city;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           child: Padding(padding: EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   city,
//                   style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 Text(
//                    theTemp + '°',
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   windSpeed,
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ),
//         ),
//     );
//   }
// }
