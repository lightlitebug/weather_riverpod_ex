import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'package:weather_riverpod_ex/models/weather.dart';

class WeatherApiClient {
  final http.Client httpClient;
  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  static const String baseUrl = 'https://www.metaweather.com';

  Future<int> getLocationId(String city) async {
    final String url = '$baseUrl/api/location/search/?query=$city';

    final http.Response response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Can not get locationId of $city');
    }

    final responseBody = json.decode(response.body);

    if (responseBody.isEmpty) {
      throw Exception('Cannot get locationId of $city');
    }

    return responseBody[0]['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final url = '$baseUrl/api/location/$locationId';

    final http.Response response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception(
          'Can not get weather of the city with locationId: $locationId');
    }

    final responseBody = json.decode(response.body);
    final Weather weather = Weather.fromJson(responseBody);

    return weather;
  }
}
