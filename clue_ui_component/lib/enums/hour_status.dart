enum HourStatus {
  zero(0),
  one(1),
  two(2),
  three(3),
  four(4),
  five(5),
  six(6),
  seven(7),
  eight(8),
  nine(9),
  ten(10),
  eleven(11);

  // 멤버 변수
  final int value;

  // 생성자
  const HourStatus(this.value);

  // 확장
  @override
  String toString() {
    return '${value.toString().padLeft(2, '0')} hour';
  }

  factory HourStatus.fromHour(int hour) {
    return HourStatus.values.firstWhere((value) {
      return value.value == hour;
    }, orElse: () {
      return HourStatus.values.first;
    });
  }

  static final toMap = {for (var v in HourStatus.values) v: v.toString()};
}
