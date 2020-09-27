class Weather {
  final String weatherStateName;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String city; // title
  final int woeid;
  final DateTime lastUpdated;

  Weather({
    this.weatherStateName,
    this.created,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.city,
    this.woeid,
    this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];

    return Weather(
      weatherStateName: consolidatedWeather['weather_state_name'],
      created: consolidatedWeather['created'],
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      theTemp: consolidatedWeather['the_temp'] as double,
      city: json['title'],
      woeid: json['woeid'] as int,
      lastUpdated: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weatherStateName': weatherStateName,
      'created': created,
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'theTemp': theTemp,
      'city': city,
      'woeid': woeid,
      'lastUpdated': lastUpdated,
    };
  }
}
