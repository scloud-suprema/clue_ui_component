import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/components/clue_error_text.dart';

void main() {
  testWidgets('ClueErrorText 위젯이 올바르게 렌더링됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    const String errorText = '에러가 발생했습니다.';

    // ClueErrorText 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueErrorText(
            errorText: errorText,
            onRefresh: () {},
          ),
        ),
      ),
    );

    // ClueErrorText 위젯 찾기
    final clueErrorText = find.byType(ClueErrorText);

    // ClueErrorText 위젯이 하나 존재하는지 확인
    expect(clueErrorText, findsOneWidget);

    // 오류 텍스트가 올바르게 표시되는지 확인
    final errorTextWidget = find.text(errorText);
    expect(errorTextWidget, findsOneWidget);

    // 새로고침 버튼이 존재하는지 확인
    final refreshButton = find.byIcon(Icons.refresh);
    expect(refreshButton, findsOneWidget);
  });

  testWidgets('ClueErrorText의 새로고침 버튼을 클릭하면 onRefresh 콜백이 호출됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    const String errorText = '에러가 발생했습니다.';
    bool wasRefreshed = false;

    // ClueErrorText 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueErrorText(
            errorText: errorText,
            onRefresh: () {
              wasRefreshed = true;
            },
          ),
        ),
      ),
    );

    // 새로고침 버튼을 찾기
    final refreshButton = find.byIcon(Icons.refresh);

    // 새로고침 버튼이 존재하는지 확인
    expect(refreshButton, findsOneWidget);

    // 새로고침 버튼을 탭
    await tester.tap(refreshButton);
    await tester.pumpAndSettle();

    // onRefresh 콜백이 호출되었는지 확인
    expect(wasRefreshed, isTrue);
  });
}
