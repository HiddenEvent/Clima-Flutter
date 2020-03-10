import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '59e92f14dd3cf9c6fc172c0fa425c660';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2'
    '.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&lang=kr&appid=$apiKey&units'
        '=metric';
    NetworkHelper networkHelpter = NetworkHelper(url);
    var weatherData = await networkHelpter.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    LocationInfo locInfo = LocationInfo();
    await locInfo.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper
      ('$openWeatherMapURL?lat=${locInfo
        .latitude}&lon=${locInfo.longitude}&lang=kr&appid=$apiKey&units=metric');

    return await networkHelper.getData();
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
