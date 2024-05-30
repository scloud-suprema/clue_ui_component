import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_side_page.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueSidePage widget test', (WidgetTester tester) async {
    // 필요한 위젯을 설정합니다.
    final body = Container(color: Colors.blue);
    final bottomCenter = Text('Bottom Center');

    // 테스트할 ClueSidePage 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(
      home: ClueSidePage(
        menuTitle: 'Menu Title',
        headerLeft: Icon(Icons.menu),
        headerCenter: Text('Header Center'),
        headerRight: Icon(Icons.search),
        body: body,
        bottomCenter: bottomCenter,
        showHeaderDivider: true,
        showBottomDivider: true,
      ),
    ));

    // menuTitle이 렌더링 되었는지 확인합니다.
    expect(find.text('Menu Title'), findsOneWidget);

    // Header와 Bottom의 위젯들이 렌더링 되었는지 확인합니다.
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Header Center'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byWidget(body), findsOneWidget);
    expect(find.text('Bottom Center'), findsOneWidget);

    // ClueDivider가 두 번 렌더링 되었는지 확인합니다 (Header와 Bottom).
    expect(find.byType(ClueDivider), findsNWidgets(2));
  });
}
