extension ListExtension<T> on List<T> {
  /// map 사용 시 value와 index를 가지고 올 수 있게끔 확장버전 추가
  List<R> mapWithIndex<R>(R Function(T value, int index) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  List<T> operator +(other) => [...this, ...other];

  Map<int, T> toIndexKeyMap() {
    Map<int, T> extractedData = {};
    for (var i = 0; i < length; i++) {
      extractedData[i] = this[i];
    }
    return extractedData;
  }
}
