import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return isEmpty
        ? true
        : RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(this);
  }
}

String dateFormDatetime(DateTime datetime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(datetime);
  return formattedDate;
}

String getScore(List<dynamic> scores) {
  int correst = 0;
  scores.forEach((score) {
    if (score == true) correst++;
  });

  return "$correst/${scores.length}";
}
