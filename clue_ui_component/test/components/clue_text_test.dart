import 'package:clue_ui_component/components/clue_text.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueText displays text and required asterisk', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueText('Test Text', isRequired: true),
        ),
      ),
    );

    // EasyRichText 위젯의 텍스트 내용 확인
    final richTextFinder = find.byWidgetPredicate(
      (widget) => widget is EasyRichText && widget.text == 'Test Text *',
    );
    expect(richTextFinder, findsOneWidget);
  });

  testWidgets('ClueText applies target styles and handles taps', (WidgetTester tester) async {
    final targetModel = TargetModel(
      text: 'clickable',
      style: const TextStyle(color: Colors.blue),
      onTap: () {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueText(
            'Test Text with clickable part',
            targetList: [targetModel],
          ),
        ),
      ),
    );

    // EasyRichText 위젯의 텍스트 내용 확인
    final richTextFinder = find.byWidgetPredicate(
      (widget) => widget is EasyRichText && widget.text == 'Test Text with clickable part',
    );
    expect(richTextFinder, findsOneWidget);

    // 클릭 가능한 텍스트가 존재하는지 확인
    final textSpanFinder = find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final textSpan = widget.text as TextSpan;
        return textSpan.toPlainText().contains('clickable');
      }
      return false;
    });
    expect(textSpanFinder, findsOneWidget);
  });
}
