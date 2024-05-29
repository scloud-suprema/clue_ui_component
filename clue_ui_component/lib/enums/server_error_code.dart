enum ServerErrorCode {
  v0000('V0000', '성공'),
  v1000('V1000', 'V1000 오류'),
  v2000('V2000', 'V2000 오류'),
  v3000('V3000', 'V3000 오류'),
  v4000('V4000', 'V4000 오류'),
  v5000('V5000', 'V5000 오류'),
  v6000('V6000', 'V6000 오류'),
  v7000('V7000', 'V7000 오류'),
  v8000('V8000', 'V8000 오류'),
  v9999('V9000', 'V9000 오류'),
  v9000('V9999', 'V9999 오류');

  const ServerErrorCode(this.code, this.locale);

  /// 서버 오류 코드
  final String code;

  /// 서버 오류 메시지
  final String locale;

  // 확장
  @override
  String toString() {
    return locale;
  }

  factory ServerErrorCode.fromString(String code) {
    return ServerErrorCode.values.firstWhere((value) {
      return value.code == code;
    }, orElse: () {
      return ServerErrorCode.v9999;
    });
  }
}
