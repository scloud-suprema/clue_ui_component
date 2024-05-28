import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/components/clue_popup_menu_button.dart';
import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/themes/themes.dart';

void main() {
  testWidgets('CluePopupMenuButton이 올바르게 렌더링됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<Widget> items = List.generate(5, (index) => Text('Item $index'));

    // CluePopupMenuButton 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CluePopupMenuButton<int>(
            itemList: items,
            child: Icon(Icons.menu),
            onTap: (index) {},
          ),
        ),
      ),
    );

    // CluePopupMenuButton 위젯 찾기
    final popupMenuButton = find.byType(CluePopupMenuButton<int>);
    expect(popupMenuButton, findsOneWidget);

    // 팝업 메뉴 버튼 탭
    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    // 팝업 메뉴 항목이 올바르게 렌더링되는지 확인
    for (var i = 0; i < items.length; i++) {
      expect(find.text('Item $i'), findsOneWidget);
    }
  });

  testWidgets('CluePopupMenuButton의 항목을 선택하면 onTap 콜백이 호출됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final List<Widget> items = List.generate(5, (index) => Text('Item $index'));
    int? selectedItemIndex;

    // CluePopupMenuButton 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CluePopupMenuButton<int>(
            itemList: items,
            child: Icon(Icons.menu),
            onTap: (index) {
              selectedItemIndex = index;
            },
          ),
        ),
      ),
    );

    // 팝업 메뉴 버튼 탭
    final popupMenuButton = find.byType(CluePopupMenuButton<int>);
    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    // 첫 번째 항목을 선택
    await tester.tap(find.text('Item 0'));
    await tester.pumpAndSettle();

    // 선택된 항목 인덱스가 올바르게 설정되었는지 확인
    expect(selectedItemIndex, 0);
  });
}
