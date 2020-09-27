import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TemperatureUnit {
  celcius,
  fahrenheit,
}

final settingsaProvider = StateProvider<TemperatureUnit>((ref) {
  print('>>> In settingsProvider');
  return TemperatureUnit.celcius;
});
