import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_riverpod_ex/repositories/weather_api_client.dart';

final weatherApiClientProvider = Provider<WeatherApiClient>((ref) {
  print('>>> In weatherApiClientProvider');
  return WeatherApiClient(httpClient: http.Client());
});
