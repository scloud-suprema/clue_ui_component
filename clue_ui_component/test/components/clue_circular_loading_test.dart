import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clue_ui_component/themes/themes.dart';

void main() {
  testWidgets('ClueCircularLoading displays with default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircularLoading(),
        ),
      ),
    );

    // 위젯의 크기 확인
    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, 18);
    expect(sizedBox.height, 18);

    // CircularProgressIndicator 색상 확인
    final progressIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(progressIndicatorFinder, findsOneWidget);

    final progressIndicator = tester.widget<CircularProgressIndicator>(progressIndicatorFinder);
    expect(progressIndicator.color, MyColors.xFF000000);
    expect(progressIndicator.strokeWidth, 2);
  });

  testWidgets('ClueCircularLoading displays with white color', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircularLoading.white(),
        ),
      ),
    );

    // 위젯의 크기 확인
    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, 18);
    expect(sizedBox.height, 18);

    // CircularProgressIndicator 색상 확인
    final progressIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(progressIndicatorFinder, findsOneWidget);

    final progressIndicator = tester.widget<CircularProgressIndicator>(progressIndicatorFinder);
    expect(progressIndicator.color, MyColors.xFFFFFFFF);
    expect(progressIndicator.strokeWidth, 2);
  });

  testWidgets('ClueCircularLoading displays with custom values', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClueCircularLoading(
            width: 30,
            height: 30,
            color: MyColors.xFF6682FF,
          ),
        ),
      ),
    );

    // 위젯의 크기 확인
    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, 30);
    expect(sizedBox.height, 30);

    // CircularProgressIndicator 색상 확인
    final progressIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(progressIndicatorFinder, findsOneWidget);

    final progressIndicator = tester.widget<CircularProgressIndicator>(progressIndicatorFinder);
    expect(progressIndicator.color, MyColors.xFF6682FF);
    expect(progressIndicator.strokeWidth, 2);
  });
}
