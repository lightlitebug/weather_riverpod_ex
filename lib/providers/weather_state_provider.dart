import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_ex/models/weather.dart';
import 'package:weather_riverpod_ex/providers/providers.dart';

class WeatherState {
  final bool loading;
  final Weather weather;
  final String error;

  WeatherState({
    this.loading,
    this.weather,
    this.error,
  });

  WeatherState copyWith({
    bool loading,
    Weather weather,
    String error,
  }) {
    return WeatherState(
      loading: loading ?? this.loading,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}

final currentWeatherProvider = StateNotifierProvider<CurrentWeather>((ref) {
  print('>>> In currentWeatherProvicer');
  return CurrentWeather(ref.read);
});

class CurrentWeather extends StateNotifier<WeatherState> {
  final Reader read;

  static WeatherState initialWeatherState = WeatherState();

  CurrentWeather(this.read) : super(initialWeatherState);

  Future<void> fetchWeather() async {
    state = state.copyWith(loading: true, error: '');
    final String city = read(cityProvider).state;

    try {
      final Weather weather =
          await read(weatherRepositoryProvider).getWeather();
      state = state.copyWith(
        loading: false,
        weather: weather,
        error: '',
      );
    } catch (e) {
      state = state.copyWith(
        loading: false,
        error: 'Can not fetch the weather of $city',
      );
    }
  }
}

final weatherStateProvider = Provider<WeatherState>((ref) {
  print('>>> In weatherStateProvider');
  final WeatherState weather = ref.watch(currentWeatherProvider.state);

  return weather;
});
