import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_ex/models/weather.dart';
import 'package:weather_riverpod_ex/providers/providers.dart';

class WeatherRepository {
  final Reader read;

  WeatherRepository({this.read});

  Future<Weather> getWeather() async {
    final String city = read(cityProvider).state;

    try {
      final int locationId =
          await read(weatherApiClientProvider).getLocationId(city);

      return await read(weatherApiClientProvider).fetchWeather(locationId);
    } catch (e) {
      throw e.toString();
    }
  }
}
