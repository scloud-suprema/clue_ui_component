import 'package:clue_ui_component/components/clue_circle_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueCircleTextField displays initial value and hint text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            initialValue: 'initial',
            hintText: 'hint',
          ),
        ),
      ),
    );

    // 초기 값 확인
    expect(find.text('initial'), findsOneWidget);

    // 힌트 텍스트 확인
    expect(find.text('hint'), findsOneWidget);
  });

  testWidgets('ClueCircleTextField calls onChanged and onEditingComplete', (WidgetTester tester) async {
    String? changedValue;
    bool editingCompleted = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            onChanged: (value) {
              changedValue = value;
            },
            onEditingComplete: () {
              editingCompleted = true;
            },
          ),
        ),
      ),
    );

    // 텍스트 입력 후 onChanged 콜백 확인
    await tester.enterText(find.byType(TextFormField), 'new value');
    expect(changedValue, 'new value');

    // 엔터 키 입력 후 onEditingComplete 콜백 확인
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(editingCompleted, true);
  });

  testWidgets('ClueCircleTextField toggles obscureText', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            obscureText: true,
          ),
        ),
      ),
    );

    // 비밀번호 아이콘 확인
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    // 비밀번호 아이콘 탭하여 obscureText 전환
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    // 아이콘이 visibility_off로 변경되었는지 확인
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets('ClueCircleTextField shows error text when useErrorText is true', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            errorText: 'error message',
            useErrorText: true,
            errorMaxLines: 2,
          ),
        ),
      ),
    );

    // 오류 메시지 확인
    expect(find.text('error message'), findsOneWidget);
  });

  testWidgets('ClueCircleTextField shows error text when useErrorText is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            errorText: 'error message',
            useErrorText: false,
            errorMaxLines: 2,
          ),
        ),
      ),
    );

    // 오류 메시지 확인
    expect(find.text('error message'), findsOneWidget);
  });

  testWidgets('ClueCircleTextField shows counter text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            initialValue: 'text',
            maxLength: 10,
            showCounterText: true,
          ),
        ),
      ),
    );

    // 카운터 텍스트 확인
    expect(find.text('4/10'), findsOneWidget);
  });

  testWidgets('ClueCircleTextField shows suffix icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            suffixIcon: const Icon(Icons.clear),
          ),
        ),
      ),
    );

    // suffix 아이콘 확인
    expect(find.byIcon(Icons.clear), findsOneWidget);
  });

  testWidgets('ClueCircleTextField respects input formatters', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ),
    );

    // 텍스트 입력 후 포맷터 확인 (숫자만 허용)
    await tester.enterText(find.byType(TextFormField), 'abc123');
    expect(find.text('123'), findsOneWidget);
  });

  testWidgets('ClueCircleTextField disabled state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircleTextField(
            enabled: false,
            hintText: 'hint',
          ),
        ),
      ),
    );

    // 비활성화된 상태 확인
    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.enabled, false);
    expect(find.text('hint'), findsOneWidget);
  });
}
