import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueDivider가 기본 색상으로 렌더링됨', (WidgetTester tester) async {
    // ClueDivider 위젯 빌드
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueDivider(
            key: Key("ClueDivider"),
          ),
        ),
      ),
    );

    // Divider 위젯 찾기
    final divider = find.byType(ClueDivider);

    // Divider 위젯이 하나 존재하는지 확인
    expect(divider, findsOneWidget);

    // 색상이 기본 색상인지 확인
    final ClueDivider dividerWidget = tester.widget(divider);
    expect(dividerWidget.color, MyColors.xFFE2E8F0);
  });

  testWidgets('ClueDivider가 명명된 생성자를 사용하여 흰색으로 렌더링됨', (WidgetTester tester) async {
    // 명명된 생성자를 사용하여 ClueDivider 위젯 빌드
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueDivider.white(),
        ),
      ),
    );

    // Divider 위젯 찾기
    final divider = find.byType(Divider);

    // Divider 위젯이 하나 존재하는지 확인
    expect(divider, findsOneWidget);

    // 색상이 흰색인지 확인
    final Divider dividerWidget = tester.widget(divider);
    expect(dividerWidget.color, MyColors.xFFFFFFFF);
  });

  testWidgets('ClueDivider가 사용자 정의 색상으로 렌더링됨', (WidgetTester tester) async {
    // 사용자 정의 색상 정의
    const customColor = Colors.red;

    // 사용자 정의 색상으로 ClueDivider 위젯 빌드
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueDivider(color: customColor),
        ),
      ),
    );

    // Divider 위젯 찾기
    final divider = find.byType(Divider);

    // Divider 위젯이 하나 존재하는지 확인
    expect(divider, findsOneWidget);

    // 색상이 사용자 정의 색상인지 확인
    final Divider dividerWidget = tester.widget(divider);
    expect(dividerWidget.color, customColor);
  });
}
