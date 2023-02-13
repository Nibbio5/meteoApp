import 'package:intl/intl.dart';

import 'constants.dart';

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
          