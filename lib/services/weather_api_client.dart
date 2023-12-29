import 'package:weather/weather.dart';

abstract interface class WeatherApiClient {
  Future<Weather> getCurrentWeather(String cityName);
}
