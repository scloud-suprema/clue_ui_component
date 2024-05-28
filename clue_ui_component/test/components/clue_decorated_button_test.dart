import 'package:clue_ui_component/components/clue_decorated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/themes/themes.dart'; // MyColors의 실제 경로로 변경

void main() {
  testWidgets('ClueDecoratedButton displays with default values and triggers onPressed', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueDecoratedButton(
            onPressed: () {
              wasPressed = true;
            },
            child: const Text('Button'),
          ),
        ),
      ),
    );

    // 버튼 텍스트 확인
    expect(find.text('Button'), findsOneWidget);

    // 버튼 탭하여 onPressed 콜백 호출 확인
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(wasPressed, true);
  });

  testWidgets('ClueDecoratedButton.icon30 has correct size and properties', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueDecoratedButton.icon30(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    // 버튼 크기 확인
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.maxWidth, 30);
    expect(container.constraints?.maxHeight, 30);

    // 버튼 아이콘 확인
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('ClueDecoratedButton.icon40 has correct size and properties', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueDecoratedButton.icon40(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    // 버튼 크기 확인
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.maxWidth, 40);
    expect(container.constraints?.maxHeight, 40);

    // 버튼 아이콘 확인
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('ClueDecoratedButton.text has correct padding and properties', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueDecoratedButton.text(
            onPressed: () {},
            child: const Text('Text Button'),
          ),
        ),
      ),
    );

    // 버튼 텍스트 확인
    expect(find.text('Text Button'), findsOneWidget);

    // 버튼 패딩 확인
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.padding, const EdgeInsets.symmetric(horizontal: 12, vertical: 4));
  });

  testWidgets('ClueDecoratedButton custom properties are applied', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueDecoratedButton(
            width: 50,
            height: 50,
            color: MyColors.xFF6682FF,
            borderColor: MyColors.xFFFF5252,
            onPressed: () {},
            child: const Text('Custom Button'),
          ),
        ),
      ),
    );

    // 버튼 크기 확인
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.maxWidth, 50);
    expect(container.constraints?.maxHeight, 50);

    // 버튼 테두리 색상 확인
    final boxDecoration = container.decoration as BoxDecoration;
    expect(boxDecoration.border?.top.color, MyColors.xFFFF5252);

    // 버튼 텍스트 확인
    expect(find.text('Custom Button'), findsOneWidget);
  });
}
