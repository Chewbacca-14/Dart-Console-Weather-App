import 'package:weather/config/api_key.dart';

class Config {
  Config._inrternal();
  static final Config instance = Config._inrternal();
  factory Config() => instance;

  String apiKey = apiKeyWeather;
  String baseUrl = 'https://api.api-ninjas.com/v1';

//endpoints
  String currentWeatherUrl = 'weather';
  String cityPopulation = 'city';
}
