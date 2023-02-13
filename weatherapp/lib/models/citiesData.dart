import 'cities.dart';

class CitiesData {
  final List<Cityes>? cities;

  CitiesData([this.cities]);

  //function to fetch the vbalues
  List<Cityes> getCurrentWeather() => cities!;
}
