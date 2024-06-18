import 'package:clue_ui_component/components/clue_circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueCircleButton displays correct child and triggers onPressed', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueCircleButton(
            onPressed: () {
              wasPressed = true;
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    // 자식 위젯(Icon)이 올바르게 표시되는지 확인
    expect(find.byIcon(Icons.add), findsOneWidget);

    // 버튼 배경 색상 확인
    final rawMaterialButtonFinder = find.byType(RawMaterialButton);
    final rawMaterialButtonWidget = tester.widget<RawMaterialButton>(rawMaterialButtonFinder);
    expect(rawMaterialButtonWidget.fillColor, Colors.black); // MyColors.xFF000000 대신 Colors.black 사용

    // 버튼 탭 이벤트 테스트
    await tester.tap(rawMaterialButtonFinder);
    await tester.pumpAndSettle();
    expect(wasPressed, true);
  });
}
