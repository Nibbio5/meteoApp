import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isLoading = true.obs;
  RxDouble _latitude = 0.0.obs;
  RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  RxString _cityName = "".obs;

  // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxString getCityName() => _cityName;
  var weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation('');
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation(str) async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location service is not enabled');
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      //request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (str == ''){
          return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update our latitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      //calling weather api
        _isLoading.value = true;
        return FetchWeatherAPI()
            .processData(value.latitude, value.longitude)
            .then((value) {
          weatherData.value = value;
          _isLoading.value = false;
        });
      
    });
    }else {
       //getting the currentposition
 
      //calling weather api
        _isLoading.value = true;
        return FetchWeatherAPI()
            .processData(_latitude.value, _longitude.value)
            .then((value) {
          weatherData.value = value;
          _isLoading.value = false;
        });
    }
   
  }

  changeCoordinates(str) async {
    //latitude substring(17, 22)
    List<Location> locations = await locationFromAddress(str);
    var lat = double.parse(double.parse(locations
            .toString()
            .split(',')[0]
            .replaceAll("[      Latitude: ", ""))
        .toStringAsFixed(2));
    var lon = double.parse(double.parse(locations
            .toString()
            .split(',')[1]
            .replaceAll("      Longitude: ", ""))
        .toStringAsFixed(2));
    _latitude.value = lat;
    _longitude.value = lon;
    getLocation(str);
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
