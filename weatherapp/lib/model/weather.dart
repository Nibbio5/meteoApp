import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
    WeatherData({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.currentWeather,
        required this.hourlyUnits,
        required this.hourly,
        required this.dailyUnits,
        required this.daily,
    });

    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    int elevation;
    CurrentWeather currentWeather;
    HourlyUnits hourlyUnits;
    Hourly hourly;
    DailyUnits dailyUnits;
    Daily daily;

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeather: CurrentWeather.fromJson(json["current_weather"]),
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather": currentWeather.toJson(),
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
    };
}

class CurrentWeather {
    CurrentWeather({
        required this.temperature,
        required this.windspeed,
        required this.winddirection,
        required this.weathercode,
        required this.time,
    });

    double temperature;
    double windspeed;
    int winddirection;
    int weathercode;
    String time;

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "weathercode": weathercode,
        "time": time,
    };
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
    List<double> temperature2MMax;
    List<double> temperature2MMin;
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
        temperature2MMax: List<double>.from(json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(json["temperature_2m_min"].map((x) => x?.toDouble())),
        apparentTemperatureMax: List<double>.from(json["apparent_temperature_max"].map((x) => x?.toDouble())),
        apparentTemperatureMin: List<double>.from(json["apparent_temperature_min"].map((x) => x?.toDouble())),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
        precipitationSum: List<int>.from(json["precipitation_sum"].map((x) => x)),
        rainSum: List<int>.from(json["rain_sum"].map((x) => x)),
        showersSum: List<int>.from(json["showers_sum"].map((x) => x)),
        snowfallSum: List<int>.from(json["snowfall_sum"].map((x) => x)),
        precipitationHours: List<int>.from(json["precipitation_hours"].map((x) => x)),
        windspeed10MMax: List<double>.from(json["windspeed_10m_max"].map((x) => x?.toDouble())),
        winddirection10MDominant: List<int>.from(json["winddirection_10m_dominant"].map((x) => x)),
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

class DailyUnits {
    DailyUnits({
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

    String time;
    String weathercode;
    String temperature2MMax;
    String temperature2MMin;
    String apparentTemperatureMax;
    String apparentTemperatureMin;
    String sunrise;
    String sunset;
    String precipitationSum;
    String rainSum;
    String showersSum;
    String snowfallSum;
    String precipitationHours;
    String windspeed10MMax;
    String winddirection10MDominant;

    factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weathercode: json["weathercode"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        apparentTemperatureMax: json["apparent_temperature_max"],
        apparentTemperatureMin: json["apparent_temperature_min"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        precipitationSum: json["precipitation_sum"],
        rainSum: json["rain_sum"],
        showersSum: json["showers_sum"],
        snowfallSum: json["snowfall_sum"],
        precipitationHours: json["precipitation_hours"],
        windspeed10MMax: json["windspeed_10m_max"],
        winddirection10MDominant: json["winddirection_10m_dominant"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "weathercode": weathercode,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "apparent_temperature_max": apparentTemperatureMax,
        "apparent_temperature_min": apparentTemperatureMin,
        "sunrise": sunrise,
        "sunset": sunset,
        "precipitation_sum": precipitationSum,
        "rain_sum": rainSum,
        "showers_sum": showersSum,
        "snowfall_sum": snowfallSum,
        "precipitation_hours": precipitationHours,
        "windspeed_10m_max": windspeed10MMax,
        "winddirection_10m_dominant": winddirection10MDominant,
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
        required this.showers,
        required this.snowfall,
        required this.snowDepth,
        required this.weathercode,
        required this.pressureMsl,
        required this.surfacePressure,
        required this.cloudcover,
        required this.visibility,
        required this.windspeed10M,
        required this.winddirection10M,
    });

    List<String> time;
    List<double> temperature2M;
    List<int> relativehumidity2M;
    List<double> apparentTemperature;
    List<int> precipitation;
    List<int> rain;
    List<int> showers;
    List<int> snowfall;
    List<int> snowDepth;
    List<int> weathercode;
    List<double> pressureMsl;
    List<double> surfacePressure;
    List<int> cloudcover;
    List<int> visibility;
    List<double> windspeed10M;
    List<int> winddirection10M;

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M: List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        apparentTemperature: List<double>.from(json["apparent_temperature"].map((x) => x?.toDouble())),
        precipitation: List<int>.from(json["precipitation"].map((x) => x)),
        rain: List<int>.from(json["rain"].map((x) => x)),
        showers: List<int>.from(json["showers"].map((x) => x)),
        snowfall: List<int>.from(json["snowfall"].map((x) => x)),
        snowDepth: List<int>.from(json["snow_depth"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        pressureMsl: List<double>.from(json["pressure_msl"].map((x) => x?.toDouble())),
        surfacePressure: List<double>.from(json["surface_pressure"].map((x) => x?.toDouble())),
        cloudcover: List<int>.from(json["cloudcover"].map((x) => x)),
        visibility: List<int>.from(json["visibility"].map((x) => x)),
        windspeed10M: List<double>.from(json["windspeed_10m"].map((x) => x?.toDouble())),
        winddirection10M: List<int>.from(json["winddirection_10m"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relativehumidity_2m": List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "apparent_temperature": List<dynamic>.from(apparentTemperature.map((x) => x)),
        "precipitation": List<dynamic>.from(precipitation.map((x) => x)),
        "rain": List<dynamic>.from(rain.map((x) => x)),
        "showers": List<dynamic>.from(showers.map((x) => x)),
        "snowfall": List<dynamic>.from(snowfall.map((x) => x)),
        "snow_depth": List<dynamic>.from(snowDepth.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "pressure_msl": List<dynamic>.from(pressureMsl.map((x) => x)),
        "surface_pressure": List<dynamic>.from(surfacePressure.map((x) => x)),
        "cloudcover": List<dynamic>.from(cloudcover.map((x) => x)),
        "visibility": List<dynamic>.from(visibility.map((x) => x)),
        "windspeed_10m": List<dynamic>.from(windspeed10M.map((x) => x)),
        "winddirection_10m": List<dynamic>.from(winddirection10M.map((x) => x)),
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
        required this.showers,
        required this.snowfall,
        required this.snowDepth,
        required this.weathercode,
        required this.pressureMsl,
        required this.surfacePressure,
        required this.cloudcover,
        required this.visibility,
        required this.windspeed10M,
        required this.winddirection10M,
    });

    String time;
    String temperature2M;
    String relativehumidity2M;
    String apparentTemperature;
    String precipitation;
    String rain;
    String showers;
    String snowfall;
    String snowDepth;
    String weathercode;
    String pressureMsl;
    String surfacePressure;
    String cloudcover;
    String visibility;
    String windspeed10M;
    String winddirection10M;

    factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativehumidity2M: json["relativehumidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        showers: json["showers"],
        snowfall: json["snowfall"],
        snowDepth: json["snow_depth"],
        weathercode: json["weathercode"],
        pressureMsl: json["pressure_msl"],
        surfacePressure: json["surface_pressure"],
        cloudcover: json["cloudcover"],
        visibility: json["visibility"],
        windspeed10M: json["windspeed_10m"],
        winddirection10M: json["winddirection_10m"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relativehumidity_2m": relativehumidity2M,
        "apparent_temperature": apparentTemperature,
        "precipitation": precipitation,
        "rain": rain,
        "showers": showers,
        "snowfall": snowfall,
        "snow_depth": snowDepth,
        "weathercode": weathercode,
        "pressure_msl": pressureMsl,
        "surface_pressure": surfacePressure,
        "cloudcover": cloudcover,
        "visibility": visibility,
        "windspeed_10m": windspeed10M,
        "winddirection_10m": winddirection10M,
    };
}