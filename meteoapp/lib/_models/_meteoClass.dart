// To parse this JSON data, do
//
//     final meteo = meteoFromJson(jsonString);

import 'dart:convert';

Meteo meteoFromJson(String str) => Meteo.fromJson(json.decode(str));

String meteoToJson(Meteo data) => json.encode(data.toJson());

class Meteo {
    Meteo({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.hourlyUnits,
        required this.hourly,
    });

    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    int elevation;
    HourlyUnits hourlyUnits;
    Hourly hourly;

    factory Meteo.fromJson(Map<String, dynamic> json) => Meteo(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
    };
}

class Hourly {
    Hourly({
        required this.time,
        required this.temperature2M,
        required this.relativehumidity2M,
        required this.apparentTemperature,
        required this.precipitation,
        required this.rain,
        required this.snowfall,
    });

    List<String> time;
    List<double> temperature2M;
    List<int> relativehumidity2M;
    List<double> apparentTemperature;
    List<double> precipitation;
    List<double> rain;
    List<int> snowfall;

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M: List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        apparentTemperature: List<double>.from(json["apparent_temperature"].map((x) => x?.toDouble())),
        precipitation: List<double>.from(json["precipitation"].map((x) => x?.toDouble())),
        rain: List<double>.from(json["rain"].map((x) => x?.toDouble())),
        snowfall: List<int>.from(json["snowfall"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relativehumidity_2m": List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "apparent_temperature": List<dynamic>.from(apparentTemperature.map((x) => x)),
        "precipitation": List<dynamic>.from(precipitation.map((x) => x)),
        "rain": List<dynamic>.from(rain.map((x) => x)),
        "snowfall": List<dynamic>.from(snowfall.map((x) => x)),
    };
}

class HourlyUnits {
    HourlyUnits({
        required this.time,
        required this.temperature2M,
        required this.relativehumidity2M,
        required this.apparentTemperature,
        required this.precipitation,
        required this.rain,
        required this.snowfall,
    });

    String time;
    String temperature2M;
    String relativehumidity2M;
    String apparentTemperature;
    String precipitation;
    String rain;
    String snowfall;

    factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativehumidity2M: json["relativehumidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        snowfall: json["snowfall"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relativehumidity_2m": relativehumidity2M,
        "apparent_temperature": apparentTemperature,
        "precipitation": precipitation,
        "rain": rain,
        "snowfall": snowfall,
    };
}