import 'cities.dart';

class CitiesData {
  final dataCities? cities;

  CitiesData([this.cities]);

  //function to fetch the vbalues
  dataCities getCurrentWeather() => cities!;
}
