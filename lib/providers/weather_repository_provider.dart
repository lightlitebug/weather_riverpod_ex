import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_ex/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  print('>>> In weatherRepositoryProvider');
  return WeatherRepository(read: ref.read);
});
