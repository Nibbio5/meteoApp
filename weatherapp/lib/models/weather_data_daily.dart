
//instance for the api response
class WeatherDataDaily{
  final Daily daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) => WeatherDataDaily(daily: Daily.fromJson(json['daily']));
}







class Daily {
    Daily({
        required this.time,
        required this.weathercode,
        required this.temperature2MMax,
        required this.temperature2MMin,
    });

    List<DateTime> time;
    List<int> weathercode;
    List<int> temperature2MMax;
    List<int> temperature2MMin;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        temperature2MMax: List<int>.from(json["temperature_2m_max"].map((x) => x?.round())),
        temperature2MMin: List<int>.from(json["temperature_2m_min"].map((x) => x?.round())),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "temperature_2m_max": List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min": List<dynamic>.from(temperature2MMin.map((x) => x)),

    };
}
