

class WeatherDataHourly{
  final Hourly hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) => 
  WeatherDataHourly(hourly: Hourly.fromJson(json['hourly']));
}


class Hourly {
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
}
