class HourlyUnits {
	String? time;
	String? temperature2m;
	String? relativehumidity2m;
	String? apparentTemperature;
	String? precipitation;
	String? rain;
	String? showers;
	String? snowfall;
	String? snowDepth;
	String? weathercode;
	String? pressureMsl;
	String? surfacePressure;
	String? cloudcover;
	String? visibility;
	String? windspeed10m;
	String? winddirection10m;

	HourlyUnits({
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

	factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
				time: json['time'] as String?,
				temperature2m: json['temperature_2m'] as String?,
				relativehumidity2m: json['relativehumidity_2m'] as String?,
				apparentTemperature: json['apparent_temperature'] as String?,
				precipitation: json['precipitation'] as String?,
				rain: json['rain'] as String?,
				showers: json['showers'] as String?,
				snowfall: json['snowfall'] as String?,
				snowDepth: json['snow_depth'] as String?,
				weathercode: json['weathercode'] as String?,
				pressureMsl: json['pressure_msl'] as String?,
				surfacePressure: json['surface_pressure'] as String?,
				cloudcover: json['cloudcover'] as String?,
				visibility: json['visibility'] as String?,
				windspeed10m: json['windspeed_10m'] as String?,
				winddirection10m: json['winddirection_10m'] as String?,
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
