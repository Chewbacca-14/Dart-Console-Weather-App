class Weather {
  double? windSpeed;
  int? windDegrees;
  int? temp;
  int? humidity;
  DateTime? sunset;
  int? minTemp;
  int? cloudPct;
  int? feelsLike;
  DateTime? sunrise;
  int? maxTemp;

  Weather(
      {windSpeed,
      windDegrees,
      temp,
      humidity,
      sunset,
      minTemp,
      cloudPct,
      feelsLike,
      sunrise,
      maxTemp});

  Weather.fromJson(Map<String, dynamic> json) {
    windSpeed = json['wind_speed'];
    windDegrees = json['wind_degrees'];
    temp = json['temp'];
    humidity = json['humidity'];
    sunset = DateTime.fromMillisecondsSinceEpoch(json['sunset']);
    minTemp = json['min_temp'];
    cloudPct = json['cloud_pct'];
    feelsLike = json['feels_like'];
    sunrise = DateTime.fromMillisecondsSinceEpoch(json['sunrise']);
    maxTemp = json['max_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wind_speed'] = windSpeed;
    data['wind_degrees'] = windDegrees;
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['sunset'] = data['min_temp'] = minTemp;
    data['cloud_pct'] = cloudPct;
    data['feels_like'] = feelsLike;
    data['sunrise'] = sunrise;
    data['max_temp'] = maxTemp;
    return data;
  }

  @override
  String toString() => ''' 
  Wind Speed: $windSpeed m/s
  Wind Degrees: $windDegrees°
  Temperature: $temp°C
  Humidity: $humidity%
  Sunset: $sunset
  Min Temperature: $minTemp°C
  Cloud Percentage: $cloudPct%
  Feels Like: $feelsLike°C
  Sunrise: $sunrise
  Max Temperature: $maxTemp°C
  ''';
}
