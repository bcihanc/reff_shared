import 'package:flutter/foundation.dart';

class TimeCast {
  final String now, min, hour, day, month;

  TimeCast(
      {@required this.now,
      @required this.min,
      @required this.hour,
      @required this.day,
      @required this.month});

  static String castToTranslate(int minutes, TimeCast time) {
    const hour = 60;
    const day = 1440;
    const month = 43200;

    if (minutes == 0) {
      return time.now;
    } else if (minutes < hour) {
      final result = minutes;
      return "${result.toStringAsFixed(0)} ${time.min}";
    } else if (minutes < day) {
      final result = minutes / hour;
      return "${result.toStringAsFixed(0)} ${time.hour}";
    } else if (minutes < month) {
      final result = minutes / day;
      return "${result.toStringAsFixed(0)} ${time.day}";
    } else {
      final result = minutes / month;
      return "${result.toStringAsFixed(0)} ${time.month}";
    }
  }
}
