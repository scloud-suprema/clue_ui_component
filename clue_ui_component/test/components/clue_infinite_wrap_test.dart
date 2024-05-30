import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/components/clue_infinite_wrap.dart';
import 'package:clue_ui_component/components/clue_circular_loading.dart';

void main() {
  testWidgets('ClueInfiniteWrap가 올바르게 렌더링됨 length < totalcount', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(5, (index) => 'Item $index');

    // ClueInfiniteWrap 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteWrap<String>(
            key: const Key('ClueInfiniteWrap'), // 키 설정
            totalCount: 20,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {},
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteWrap 위젯 찾기
    final infiniteWrap = find.byKey(const Key('ClueInfiniteWrap'));
    expect(infiniteWrap, findsOneWidget);

    // 아이템 목록이 올바르게 렌더링되는지 확인
    for (var i = 0; i < items.length; i++) {
      expect(find.byKey(Key('Item $i')), findsOneWidget);
    }

    // 로딩 위젯이 렌더링되는지 확인
    expect(find.byType(ClueCircularLoading), findsOneWidget);
  });

  testWidgets('ClueInfiniteWrap가 올바르게 렌더링됨 length >= totalcount', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(5, (index) => 'Item $index');

    // ClueInfiniteWrap 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteWrap<String>(
            key: const Key('ClueInfiniteWrap'), // 키 설정
            totalCount: 4,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {},
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteWrap 위젯 찾기
    final infiniteWrap = find.byKey(const Key('ClueInfiniteWrap'));
    expect(infiniteWrap, findsOneWidget);

    // 아이템 목록이 올바르게 렌더링되는지 확인
    for (var i = 0; i < items.length; i++) {
      expect(find.byKey(Key('Item $i')), findsOneWidget);
    }
  });

  testWidgets('ClueInfiniteWrap에서 스크롤 이벤트가 발생하면 endOfScrollCallBack이 호출됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<String> items = List.generate(5, (index) => 'Item $index');
    bool endOfScrollCalled = false;

    // ClueInfiniteWrap 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueInfiniteWrap<String>(
            key: const Key('ClueInfiniteWrap'), // 키 설정
            totalCount: 20,
            itemList: items,
            itemBuilder: (item) => Container(
              key: Key(item),
              padding: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Text(item, style: TextStyle(color: Colors.white)),
            ),
            endOfScrollCallBack: () {
              endOfScrollCalled = true;
            },
            noMoreWidget: const Text('더 이상 항목이 없습니다.'),
          ),
        ),
      ),
    );

    // ClueInfiniteWrap 위젯 찾기
    final infiniteWrap = find.byKey(const Key('ClueInfiniteWrap'));
    expect(infiniteWrap, findsOneWidget);

    // 스크롤 이벤트 발생
    await tester.drag(infiniteWrap, const Offset(0, -300));
    await tester.pump(); // 스크롤 직후 바로 pump 호출

    // endOfScrollCallBack이 호출되었는지 확인
    expect(endOfScrollCalled, isTrue);
  });
}
