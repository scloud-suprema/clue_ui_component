enum MinuteStatus {
  zero(0),
  five(5),
  ten(10),
  fifteen(15),
  twenty(20),
  twentyFive(25),
  thirty(30),
  thirtyFive(35),
  forty(40),
  fortyFive(45),
  fifty(50),
  fiftyFive(55);

  final int value;

  const MinuteStatus(this.value);

  factory MinuteStatus.fromMinute(int minute) {
    return MinuteStatus.values.firstWhere((value) {
      return value.value == minute;
    }, orElse: () {
      return MinuteStatus.zero;
    });
  }

  @override
  String toString() {
    return '${value.toString().padLeft(2, '0')} minute';
  }

  static final toMap = {for (var v in MinuteStatus.values) v: v.toString()};
}
