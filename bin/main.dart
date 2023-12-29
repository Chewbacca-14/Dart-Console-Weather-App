import 'dart:io';
import 'package:args/args.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/services/weather_api_client_impl.dart';

void main(List<String> arguments) async {
  WeatherApiClient weatherApiClient = WeatherApiClientImpl();

  final parser = ArgParser()..addOption('city', abbr: 'c');

  final result = parser.parse(arguments);
  final cityArg = result['city'] as String;

  if (cityArg.isEmpty) {
    print('error: empty city');
    return;
  }

  final cityName = cityArg;

  try {
    final currentWeather = await weatherApiClient.getCurrentWeather(cityName);
    print('Getting Current Weather for $cityName \n');
    print('---------------------------\n');
    print(currentWeather.toString());
    print('---------------------------\n');
  } on WeatherApiException catch (e) {
    print('Error ${e.toString()}');
  } on SocketException catch (e) {
    print('Check Internet Connection ${e.toString()}');
  } catch (e) {
    print(e.toString());
  }
}
