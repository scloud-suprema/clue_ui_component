import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/components/clue_infinite_list_view.dart';
import 'package:clue_ui_component/components/clue_circular_loading.dart';

void main() {
  testWidgets('ClueInfiniteListView가 올바르게 렌더링됨 length >= totalcount', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(10, (index) => 'Item $index');

    // ClueInfiniteListView 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteListView<String>(
            key: const Key('ClueInfiniteListView'), // 키 설정
            totalCount: 20,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {},
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteListView 위젯 찾기
    final infiniteListView = find.byKey(const Key('ClueInfiniteListView'));
    expect(infiniteListView, findsOneWidget);

    // 아이템 목록이 올바르게 렌더링되는지 확인
    for (var item in items) {
      expect(find.byKey(Key(item)), findsOneWidget);
    }
    // 로딩 위젯이 렌더링되는지 확인
    expect(find.byType(ClueCircularLoading), findsOneWidget);
  });

  testWidgets('ClueInfiniteListView가 올바르게 렌더링됨 length < totalcount', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(10, (index) => 'Item $index');

    // ClueInfiniteListView 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteListView<String>(
            key: const Key('ClueInfiniteListView'), // 키 설정
            totalCount: 9,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {},
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteListView 위젯 찾기
    final infiniteListView = find.byKey(const Key('ClueInfiniteListView'));
    expect(infiniteListView, findsOneWidget);

    // 아이템 목록이 올바르게 렌더링되는지 확인
    for (var item in items) {
      expect(find.byKey(Key(item)), findsOneWidget);
    }
  });

  testWidgets('ClueInfiniteListView에서 스크롤 이벤트가 발생하면 endOfScrollCallBack이 호출됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(10, (index) => 'Item $index');
    bool endOfScrollCalled = false;

    // ClueInfiniteListView 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteListView<String>(
            key: const Key('ClueInfiniteListView'), // 키 설정
            totalCount: 20,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {
              endOfScrollCalled = true;
            },
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteListView 위젯 찾기
    final infiniteListView = find.byKey(const Key('ClueInfiniteListView'));
    expect(infiniteListView, findsOneWidget);

    // 스크롤 이벤트 발생
    await tester.drag(infiniteListView, const Offset(0, -300));
    await tester.pump(); // 스크롤 직후 바로 pump 호출

    // endOfScrollCallBack이 호출되었는지 확인
    expect(endOfScrollCalled, isTrue);
  });
}
