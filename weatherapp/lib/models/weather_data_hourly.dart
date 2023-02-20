

class WeatherDataHourly{
  final Hourly hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) => 
  WeatherDataHourly(hourly: Hourly.fromJson(json['hourly']));
}

class Hourly {
    Hourly({
        required this.time,
        required this.temperature2M,
        required this.relativehumidity2M,
        required this.weathercode,
        required this.cloudcover,
    });

    List<String> time;
    List<double> temperature2M;
    List<int> relativehumidity2M;
    List<int> weathercode;
    List<int> cloudcover;

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M: List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        cloudcover: List<int>.from(json["cloudcover"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relativehumidity_2m": List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "cloudcover": List<dynamic>.from(cloudcover.map((x) => x)),
    };
}