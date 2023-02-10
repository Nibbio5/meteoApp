
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
        required this.apparentTemperatureMax,
        required this.apparentTemperatureMin,
        required this.sunrise,
        required this.sunset,
        required this.precipitationSum,
        required this.rainSum,
        required this.showersSum,
        required this.snowfallSum,
        required this.precipitationHours,
        required this.windspeed10MMax,
        required this.winddirection10MDominant,
    });

    List<DateTime> time;
    List<int> weathercode;
    List<int> temperature2MMax;
    List<int> temperature2MMin;
    List<double> apparentTemperatureMax;
    List<double> apparentTemperatureMin;
    List<String> sunrise;
    List<String> sunset;
    List<int> precipitationSum;
    List<int> rainSum;
    List<int> showersSum;
    List<int> snowfallSum;
    List<int> precipitationHours;
    List<double> windspeed10MMax;
    List<int> winddirection10MDominant;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        temperature2MMax: List<int>.from(json["temperature_2m_max"].map((x) => x?.round())),
        temperature2MMin: List<int>.from(json["temperature_2m_min"].map((x) => x?.round())),
        apparentTemperatureMax: List<double>.from(json["apparent_temperature_max"].map((x) => x?.toDouble())),
        apparentTemperatureMin: List<double>.from(json["apparent_temperature_min"].map((x) => x?.toDouble())),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
        precipitationSum: List<int>.from(json["precipitation_sum"].map((x) => x.round())),
        rainSum: List<int>.from(json["rain_sum"].map((x) => x.round())),
        showersSum: List<int>.from(json["showers_sum"].map((x) => x.round())),
        snowfallSum: List<int>.from(json["snowfall_sum"].map((x) => x.round())),
        precipitationHours: List<int>.from(json["precipitation_hours"].map((x) => x.round())),
        windspeed10MMax: List<double>.from(json["windspeed_10m_max"].map((x) => x?.toDouble())),
        winddirection10MDominant: List<int>.from(json["winddirection_10m_dominant"].map((x) => x.round())),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "temperature_2m_max": List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min": List<dynamic>.from(temperature2MMin.map((x) => x)),
        "apparent_temperature_max": List<dynamic>.from(apparentTemperatureMax.map((x) => x)),
        "apparent_temperature_min": List<dynamic>.from(apparentTemperatureMin.map((x) => x)),
        "sunrise": List<dynamic>.from(sunrise.map((x) => x)),
        "sunset": List<dynamic>.from(sunset.map((x) => x)),
        "precipitation_sum": List<dynamic>.from(precipitationSum.map((x) => x)),
        "rain_sum": List<dynamic>.from(rainSum.map((x) => x)),
        "showers_sum": List<dynamic>.from(showersSum.map((x) => x)),
        "snowfall_sum": List<dynamic>.from(snowfallSum.map((x) => x)),
        "precipitation_hours": List<dynamic>.from(precipitationHours.map((x) => x)),
        "windspeed_10m_max": List<dynamic>.from(windspeed10MMax.map((x) => x)),
        "winddirection_10m_dominant": List<dynamic>.from(winddirection10MDominant.map((x) => x)),
    };
}
