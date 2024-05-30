import 'package:clue_ui_component/components/clue_square_text_field.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueSquareTextField widget test', (WidgetTester tester) async {
    // 필요한 텍스트 컨트롤러와 초기 값을 설정합니다.
    final controller = TextEditingController(text: 'Initial Value');
    const hintText = 'Enter text';
    const errorText = 'Error message';

    // 테스트할 ClueSquareTextField 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ClueSquareTextField(
          width: 300,
          autofocus: true,
          controller: controller,
          hintText: hintText,
          errorText: errorText,
          useErrorText: true,
        ),
      ),
    ));

    // 초기 값이 올바르게 설정되었는지 확인합니다.
    expect(find.text('Initial Value'), findsOneWidget);

    // 힌트 텍스트가 올바르게 표시되는지 확인합니다.
    expect(find.text(hintText), findsOneWidget);

    // 오류 메시지가 올바르게 표시되는지 확인합니다.
    expect(find.text(errorText), findsOneWidget);

    // 텍스트 필드에 입력할 수 있는지 테스트합니다.
    await tester.enterText(find.byType(TextFormField), 'Test Input');
    expect(controller.text, 'Test Input');

    // 텍스트 필드의 포커스를 잃었을 때의 동작을 테스트합니다.
    await tester.tap(find.byType(TextFormField));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  });

  testWidgets('ClueSquareTextField obscure text toggle test', (WidgetTester tester) async {
    const errorText = 'Error message';
    // 테스트할 ClueSquareTextField 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ClueSquareTextField(
          width: 300,
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () {},
          ),
          showCounterText: true,
          maxLength: 10,
          errorText: errorText,
        ),
      ),
    ));

    // 눈 아이콘이 있는지 확인합니다.
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    // 텍스트 필드에 입력할 수 있는지 테스트합니다.
    await tester.enterText(find.byType(TextFormField), 'password');
    expect(find.text('password'), findsOneWidget);
  });

  testWidgets('ClueSquareTextField counter text test', (WidgetTester tester) async {
    const errorText = 'Error message';
    // 필요한 텍스트 컨트롤러를 설정합니다.
    final controller = TextEditingController();

    // 테스트할 ClueSquareTextField 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ClueSquareTextField(
          width: 300,
          controller: controller,
          showCounterText: true,
          maxLength: 10,
          errorText: errorText,
        ),
      ),
    ));

    // 초기 카운터 텍스트가 올바르게 표시되는지 확인합니다.
    expect(find.text('0/10'), findsOneWidget);

    // 텍스트 필드에 입력할 수 있는지 테스트합니다.
    await tester.enterText(find.byType(TextFormField), '12345');
    await tester.pump(); // setState가 호출된 후 UI가 업데이트 되도록 기다립니다.

    // 카운터 텍스트가 올바르게 업데이트되는지 확인합니다.
    expect(find.text('5/10'), findsOneWidget);
  });
}
