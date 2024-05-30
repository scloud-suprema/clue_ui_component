import 'package:clue_ui_component/components/clue_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueListTile이 올바르게 렌더링됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final leftWidget = Container(key: Key('leftWidget'), width: 50, height: 50, color: Colors.red);
    final centerWidget = Container(key: Key('centerWidget'), width: 50, height: 50, color: Colors.green);
    final rightWidget = Container(key: Key('rightWidget'), width: 50, height: 50, color: Colors.blue);

    // ClueListTile 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueListTile(
            leftWidget: leftWidget,
            centerWidget: centerWidget,
            rightWidget: rightWidget,
          ),
        ),
      ),
    );

    // ClueListTile 위젯 찾기
    final clueListTile = find.byType(ClueListTile);
    expect(clueListTile, findsOneWidget);

    // leftWidget, centerWidget, rightWidget이 올바르게 렌더링되는지 확인
    expect(find.byKey(Key('leftWidget')), findsOneWidget);
    expect(find.byKey(Key('centerWidget')), findsOneWidget);
    expect(find.byKey(Key('rightWidget')), findsOneWidget);
  });

  testWidgets('ClueListTile 탭 이벤트가 제대로 호출됨', (WidgetTester tester) async {
    bool wasTapped = false;

    // ClueListTile 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueListTile(
            leftWidget: Text('Left'),
            centerWidget: Text('Center'),
            rightWidget: Text('Right'),
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      ),
    );

    // ClueListTile 위젯 찾기
    final clueListTile = find.byType(ClueListTile);
    expect(clueListTile, findsOneWidget);

    // ClueListTile 탭
    await tester.tap(clueListTile);
    await tester.pumpAndSettle();

    // onTap 콜백이 호출되었는지 확인
    expect(wasTapped, isTrue);
  });
}
