import 'package:intl/intl.dart';

var weatherCodes2 = {
  0: 'clearsky',//
  1: 'mainly_clear',//
  2: 'mainly_clear',//
  3: 'cloudy',//
  45: 'fog',//
  48: 'fog',//
  51: 'rain_slight', //
  53: 'rain_slight',//
  55: 'rain_slight',//
  56: 'freezing_light',//
  57: 'freezing_light',//
  61: 'rain_slight',//
  63: 'rain_moderate',//
  65: 'rain_heavy',//
  66: 'freezing_rain',//
  67: 'freezing_rain',//
  71: 'show_fall',//
  73: 'show_fall',//
  75: 'show_fall_heavy',//
  77: 'show_grains',//
  80: 'rain_showers_light',
  81: 'rain_moderate',//
  82: 'rain_showers_heavy',
  85: 'show_fall',//
  86: 'show_fall',//
  95: 'thunderstorm',//
  96: 'thunderstorm',//
  99: 'thunderstorm',//
  100: "prova"
};

String getDayOrNight(int code) {
  String str = '';
  if (code == 0 || code == 1 || code == 2) {
    int num = int.parse(DateFormat('H').format(DateTime.now()));

    num > 6 && num < 20
        ? str = "assets/weather/${weatherCodes2[99]}.png"                                // "assets/weather/${weatherCodes2[code]}d.png"
        : str = "assets/weather/${weatherCodes2[code]}n.png";
  } else {
    str =
        "assets/weather/${weatherCodes2[code]}.png";
  }
  return str;
}



          //"assets/weather/prova.png",
          