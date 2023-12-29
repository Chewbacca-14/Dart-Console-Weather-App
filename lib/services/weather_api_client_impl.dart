import 'dart:convert';
import 'package:weather/config/config.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClientImpl implements WeatherApiClient {
  @override
  Future<Weather> getCurrentWeather(String cityName) async {
    final config = Config();
    final url = '${config.baseUrl}/${config.currentWeatherUrl}?city=$cityName';
    print(url);

    final response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': config.apiKey});

    if (response.statusCode != 200) {
      print('request failed with status ${response.statusCode}');
      throw WeatherApiException(message: 'Error getting weather for $cityName');
    }
    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (jsonResponse.isEmpty) {
      print('error, data not found');
      throw WeatherApiException(message: 'error, data not found');
    }
    return Weather.fromJson(jsonResponse);
  }
}

class WeatherApiException implements Exception {
  final String message;
  const WeatherApiException({required this.message});
}
