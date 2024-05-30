import 'package:clue_ui_component/components/clue_circle_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueCircleCounter displays correct count and background color', (WidgetTester tester) async {
    const testCount = 5;
    const testBackgroundColor = Color(0xFFFF0000); // 빨간색 배경색

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleCounter(
            count: testCount,
            backgroundColor: testBackgroundColor,
          ),
        ),
      ),
    );

    // Count 텍스트가 올바르게 표시되는지 확인
    expect(find.text(testCount.toString()), findsOneWidget);

    // CircleAvatar 위젯이 존재하는지 확인
    final circleAvatarFinder = find.byType(CircleAvatar);
    expect(circleAvatarFinder, findsOneWidget);

    // 배경 색상이 올바른지 확인
    final circleAvatarWidget = tester.widget<CircleAvatar>(circleAvatarFinder);
    expect(circleAvatarWidget.backgroundColor, testBackgroundColor);
  });
}
