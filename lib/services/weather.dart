import 'location.dart';
import 'networking.dart';
const apikey = 'e8d2c77ce36f804a176815cf7792f0b2';
const preurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> cityweather(String cityname) async {
    networking network = networking('$preurl?q=$cityname&appid=$apikey&units=metric');
    var weatherdata = await network.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    location locate = location();
    await locate.getlocation();


    networking network = networking('$preurl?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apikey&units=metric');

    var weatherdata = await network.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp >= 20) {
      return 'Time for shorts and 👕';
    } else if (temp <= 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥';
    }
  }
}
