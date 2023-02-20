
//instance for the api response
class WeatherDataCurrent{
  final CurrentWeather current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) => WeatherDataCurrent(current: CurrentWeather.fromJson(json['current_weather']));
}

class CurrentWeather {
	int? temperature;
	double? windspeed;
	int? weathercode;
	String? time;

	CurrentWeather({
		this.temperature, 
		this.windspeed,  
		this.weathercode, 
		this.time, 
	});

	factory CurrentWeather.fromJson(Map<String, dynamic> json) {
		return CurrentWeather(
			temperature: (json['temperature'] as num?)?.round(),
			windspeed: json['windspeed'] as double?,
			weathercode: json['weathercode'] as int?,
			time: json['time'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'temperature': temperature,
				'windspeed': windspeed,
				'weathercode': weathercode,
				'time': time,
			};
}
