import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = "8050df11be6b64436f63695db5d95e69";
const apiurl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getciteyweather(String cityname) async {
    var url = "$apiurl?q=$cityname&appid=$apikey&units=metric";
    neteorkhelper networkhelper = neteorkhelper(url);
    var weaterdata = await networkhelper.getData();
    return weaterdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    // ignore: await_only_futures
    await location.getCurrentLocation();
    double latitude;
    double longtude;

    // ignore: await_only_futures
    latitude = location.latitude;
    longtude = location.longtude;
    neteorkhelper networkhelper = neteorkhelper(
        "$apiurl?lat=$latitude&lon=$longtude&appid=$apikey&units=metric");
    var weatherdata = await networkhelper.getData();
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
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
