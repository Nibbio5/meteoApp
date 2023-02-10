

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
    List<double> visibility;
    List<double> windspeed10M;
    List<int> winddirection10M;

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M: List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        apparentTemperature: List<double>.from(json["apparent_temperature"].map((x) => x?.toDouble())),
        precipitation: List<int>.from(json["precipitation"].map((x) => x.round())),
        rain: List<int>.from(json["rain"].map((x) => x.round())),
        showers: List<int>.from(json["showers"].map((x) => x.round())),
        snowfall: List<int>.from(json["snowfall"].map((x) => x.round())),
        snowDepth: List<int>.from(json["snow_depth"].map((x) => x.round())),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        pressureMsl: List<double>.from(json["pressure_msl"].map((x) => x?.toDouble())),
        surfacePressure: List<double>.from(json["surface_pressure"].map((x) => x?.toDouble())),
        cloudcover: List<int>.from(json["cloudcover"].map((x) => x)),
        visibility: List<double>.from(json["visibility"].map((x) => x?.toDouble())),
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

/*class Hourly {
	List<String>? time;
	List<double>? temperature2m;
	List<int>? relativehumidity2m;
	List<double>? apparentTemperature;
	List<double>? precipitation;
	List<double>? rain;
	List<String>? showers;
	List<int>? snowfall;
	List<int>? snowDepth;
	List<int>? weathercode;
	List<num>? pressureMsl;
	List<num>? surfacePressure;
	List<int>? cloudcover;
	List<int>? visibility;
	List<num>? windspeed10m;
	List<int>? winddirection10m;

	
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  Hourly({
		this.time, 
		this.temperature2m, 
		this.relativehumidity2m, 
		this.apparentTemperature, 
		this.precipitation, 
		this.rain, 
		this.showers, 
		this.snowfall, 
		this.snowDepth, 
		this.weathercode, 
		this.pressureMsl, 
		this.surfacePressure, 
		this.cloudcover, 
		this.visibility, 
		this.windspeed10m, 
		this.winddirection10m, 
	});

	factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
				time: List<String>.from(json['time'].map((e)=>e.toString())),
				temperature2m: List<double>.from(json['temperature_2m'].map((e)=>double.parse(e.toString()))),
				relativehumidity2m: List<int>.from(json['relativehumidity_2m'].map((e)=>int.parse(e.toString()))),
				apparentTemperature: List<double>.from(json['apparent_temperature'].map((e)=>double.parse(e.toString()))),
				precipitation: List<double>.from(json['precipitation'].map((e)=>double.parse(e.toString()))),
				rain: List<double>.from(json['rain'].map((e)=>double.parse(e.toString()))),
				showers: List<String>.from(json['showers'].map((e)=>e.toString())),
				snowfall: List<int>.from(json['snowfall'].map((e)=>int.parse(e.toString()))),
				snowDepth: json['snow_depth'] as List<int>?,
				weathercode: json['weathercode'] as List<int>?,
				pressureMsl: json['pressure_msl'] as List<num>?,
				surfacePressure: json['surface_pressure'] as List<num>?,
				cloudcover: json['cloudcover'] as List<int>?,
				visibility: json['visibility'] as List<int>?,
				windspeed10m: json['windspeed_10m'] as List<num>?,
				winddirection10m: json['winddirection_10m'] as List<int>?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'temperature_2m': temperature2m,
				'relativehumidity_2m': relativehumidity2m,
				'apparent_temperature': apparentTemperature,
				'precipitation': precipitation,
				'rain': rain,
				'showers': showers,
				'snowfall': snowfall,
				'snow_depth': snowDepth,
				'weathercode': weathercode,
				'pressure_msl': pressureMsl,
				'surface_pressure': surfacePressure,
				'cloudcover': cloudcover,
				'visibility': visibility,
				'windspeed_10m': windspeed10m,
				'winddirection_10m': winddirection10m,
			};
}*/
