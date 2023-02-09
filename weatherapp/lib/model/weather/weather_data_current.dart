//instance for getting the api response
class WeahterDataCurrent {
  final CurrentWeather current;
  WeahterDataCurrent({required this.current});

  factory WeahterDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeahterDataCurrent(
          current: CurrentWeather.fromJson(json['current_weather']));
}

class CurrentWeather {
  double? temperature;
  int? windspeed;
  int? winddirection;
  int? weathercode;
  String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: (json['temperature'] as num?)?.toDouble(),
      windspeed: json['windspeed'] as int?,
      winddirection: json['winddirection'] as int?,
      weathercode: json['weathercode'] as int?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'temperature': temperature,
        'windspeed': windspeed,
        'winddirection': winddirection,
        'weathercode': weathercode,
        'time': time,
      };
}
