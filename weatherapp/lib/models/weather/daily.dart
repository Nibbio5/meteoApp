class Daily {
	List<String>? time;
	List<int>? weathercode;
	List<num>? temperature2mMax;
	List<num>? temperature2mMin;
	List<double>? apparentTemperatureMax;
	List<num>? apparentTemperatureMin;
	List<String>? sunrise;
	List<String>? sunset;
	List<int>? precipitationSum;
	List<int>? rainSum;
	List<int>? showersSum;
	List<int>? snowfallSum;
	List<int>? precipitationHours;
	List<num>? windspeed10mMax;
	List<int>? winddirection10mDominant;

	Daily({
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

	factory Daily.fromJson(Map<String, dynamic> json) => Daily(
				time: json['time'] as List<String>?,
				weathercode: json['weathercode'] as List<int>?,
				temperature2mMax: json['temperature_2m_max'] as List<num>?,
				temperature2mMin: json['temperature_2m_min'] as List<num>?,
				apparentTemperatureMax: json['apparent_temperature_max'] as List<double>?,
				apparentTemperatureMin: json['apparent_temperature_min'] as List<num>?,
				sunrise: json['sunrise'] as List<String>?,
				sunset: json['sunset'] as List<String>?,
				precipitationSum: json['precipitation_sum'] as List<int>?,
				rainSum: json['rain_sum'] as List<int>?,
				showersSum: json['showers_sum'] as List<int>?,
				snowfallSum: json['snowfall_sum'] as List<int>?,
				precipitationHours: json['precipitation_hours'] as List<int>?,
				windspeed10mMax: json['windspeed_10m_max'] as List<num>?,
				winddirection10mDominant: json['winddirection_10m_dominant'] as List<int>?,
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
