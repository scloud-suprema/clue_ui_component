enum TimePeriodStatus {
  am("am"),
  pm("pm");

  final String locale;

  const TimePeriodStatus(this.locale);

  @override
  String toString() {
    return locale;
  }

  static List<String> get titles => TimePeriodStatus.values.map((e) => e.toString()).toList();

  static TimePeriodStatus hourToStatus(int hour) {
    if (hour < 12) {
      return TimePeriodStatus.am;
    } else {
      return TimePeriodStatus.pm;
    }
  }

  static final toMap = {for (var v in TimePeriodStatus.values) v: v.toString()};
}
