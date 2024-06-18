import 'package:clue_ui_component/components/clue_data_not_found_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/themes/themes.dart'; // MyTextStyle의 실제 경로로 변경

void main() {
  testWidgets('ClueDataNotFoundText displays text with correct style', (WidgetTester tester) async {
    const String notFoundMessage = 'Data not found';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueDataNotFoundText(notFoundText: notFoundMessage),
        ),
      ),
    );

    // 텍스트가 올바르게 표시되는지 확인
    final textFinder = find.text(notFoundMessage);
    expect(textFinder, findsOneWidget);

    // 텍스트 스타일이 올바르게 적용되는지 확인
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style, MyTextStyle.size14);
  });
}
