class Hourly {
	List<String>? time;
	List<num>? temperature2m;
	List<int>? relativehumidity2m;
	List<num>? apparentTemperature;
	List<int>? precipitation;
	List<int>? rain;
	List<int>? showers;
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
				time: json['time'] as List<String>?,
				temperature2m: json['temperature_2m'] as List<num>?,
				relativehumidity2m: json['relativehumidity_2m'] as List<int>?,
				apparentTemperature: json['apparent_temperature'] as List<num>?,
				precipitation: json['precipitation'] as List<int>?,
				rain: json['rain'] as List<int>?,
				showers: json['showers'] as List<int>?,
				snowfall: json['snowfall'] as List<int>?,
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
