import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  TimeOfDay operator -(DateTime other) {
    var differnce = difference(other);
    return TimeOfDay(hour: differnce.inHours, minute: differnce.inMinutes - (60 * differnce.inHours));
  }

  bool operator >(other) => compareTo(other) > 0;
  bool operator <(other) => compareTo(other) < 0;
  bool operator >=(other) => compareTo(other) >= 0;
  bool operator <=(other) => compareTo(other) <= 0;

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime applyTimeOfDay(TimeOfDay timeOfDay) {
    return DateTime(year, month, day, timeOfDay.hour, timeOfDay.minute);
  }

  TimeOfDay get toTimeOfDay {
    return TimeOfDay(hour: hour, minute: minute);
  }

  DateTime get startOfDay {
    return DateTime(year, month, day, 0, 0, 0, 0);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  /// ```dart
  /// var now = DateTime.now(); // 2024-02-07 15:19:21.944
  /// now.yyyyMMdd; // 2024.02.07
  /// ```
  String get yyyyMMdd {
    return DateFormat('yyyy.MM.dd').format(this);
  }

  String get yyyyMMdd2 {
    return DateFormat('yyyy.MM.dd (EE)').format(this);
  }

  bool get startOfMonth {
    String date = DateFormat('dd').format(this);
    return date == "01";
  }

  String get monthLocale {
    String month = DateFormat('MMMM').format(this);
    return month;
  }

  String get frontFormat {
    String date = DateFormat('yyyy.MM.dd').format(this);
    String dayOfWeek = DateFormat('EE').format(this);
    return "$date ($dayOfWeek)";
  }

  String get horizontalCalendarFormat {
    String date = DateFormat('dd').format(this);
    String dayOfWeek = DateFormat('EE').format(this);
    return "$dayOfWeek\n\n$date";
  }
}
