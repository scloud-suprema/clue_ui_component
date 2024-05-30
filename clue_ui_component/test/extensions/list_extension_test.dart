import 'package:clue_ui_component/extensions/list_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListExtension Tests', () {
    test('mapWithIndex 적용 테스트', () {
      List<int> list = [1, 2, 3, 4, 5];

      List<String> result = list.mapWithIndex((value, index) {
        return '$index: $value';
      });

      expect(result, ['0: 1', '1: 2', '2: 3', '3: 4', '4: 5']);
    });

    test('+ 연산자 오버로딩 테스트', () {
      List<int> list1 = [1, 2, 3];
      List<int> list2 = [4, 5, 6];

      List<int> result = list1 + list2;

      expect(result, [1, 2, 3, 4, 5, 6]);
    });

    test('toIndexKeyMap 적용 테스트', () {
      List<String> list = ['a', 'b', 'c'];

      Map<int, String> result = list.toIndexKeyMap();

      expect(result, {0: 'a', 1: 'b', 2: 'c'});
    });
  });
}
