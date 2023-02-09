class DailyUnits {
	String? time;
	String? weathercode;
	String? temperature2mMax;
	String? temperature2mMin;
	String? apparentTemperatureMax;
	String? apparentTemperatureMin;
	String? sunrise;
	String? sunset;
	String? precipitationSum;
	String? rainSum;
	String? showersSum;
	String? snowfallSum;
	String? precipitationHours;
	String? windspeed10mMax;
	String? winddirection10mDominant;

	DailyUnits({
		this.time, 
		this.weathercode, 
		this.temperature2mMax, 
		this.temperature2mMin, 
		this.apparentTemperatureMax, 
		this.apparentTemperatureMin, 
		this.sunrise, 
		this.sunset, 
		this.precipitationSum, 
		this.rainSum, 
		this.showersSum, 
		this.snowfallSum, 
		this.precipitationHours, 
		this.windspeed10mMax, 
		this.winddirection10mDominant, 
	});

	factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
				time: json['time'] as String?,
				weathercode: json['weathercode'] as String?,
				temperature2mMax: json['temperature_2m_max'] as String?,
				temperature2mMin: json['temperature_2m_min'] as String?,
				apparentTemperatureMax: json['apparent_temperature_max'] as String?,
				apparentTemperatureMin: json['apparent_temperature_min'] as String?,
				sunrise: json['sunrise'] as String?,
				sunset: json['sunset'] as String?,
				precipitationSum: json['precipitation_sum'] as String?,
				rainSum: json['rain_sum'] as String?,
				showersSum: json['showers_sum'] as String?,
				snowfallSum: json['snowfall_sum'] as String?,
				precipitationHours: json['precipitation_hours'] as String?,
				windspeed10mMax: json['windspeed_10m_max'] as String?,
				winddirection10mDominant: json['winddirection_10m_dominant'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'weathercode': weathercode,
				'temperature_2m_max': temperature2mMax,
				'temperature_2m_min': temperature2mMin,
				'apparent_temperature_max': apparentTemperatureMax,
				'apparent_temperature_min': apparentTemperatureMin,
				'sunrise': sunrise,
				'sunset': sunset,
				'precipitation_sum': precipitationSum,
				'rain_sum': rainSum,
				'showers_sum': showersSum,
				'snowfall_sum': snowfallSum,
				'precipitation_hours': precipitationHours,
				'windspeed_10m_max': windspeed10mMax,
				'winddirection_10m_dominant': winddirection10mDominant,
			};
}
