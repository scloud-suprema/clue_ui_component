import 'package:clue_ui_component/components/clue_time_period_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClueTimePeriodButton 초기 값 표시 및 변경 반응 테스트', (WidgetTester tester) async {
    TimeOfDay initialTime = const TimeOfDay(hour: 9, minute: 30);
    TimeOfDay? selectedTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueTimePeriodButton(
            initValue: initialTime,
            onChanged: (TimeOfDay value) {
              selectedTime = value;
            },
            borderColor: Colors.grey,
            timePeriodStatus: 'am',
          ),
        ),
      ),
    );

    // 초기 값 확인
    expect(find.text('am'), findsOneWidget);
    expect(find.text('09hour'), findsOneWidget);
    expect(find.text('30minute'), findsOneWidget);

    // 'PM' 선택 시뮬레이션
    await tester.tap(find.text('am'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('pm').last);
    await tester.pumpAndSettle();
    expect(selectedTime, const TimeOfDay(hour: 21, minute: 30)); // 9 PM은 21:30

    // // 시간을 9에서 10으로 변경 시뮬레이션
    // await tester.tap(find.text('09hour'));
    // await tester.pumpAndSettle();
    // await tester.tap(find.text('10hour').last);
    // await tester.pumpAndSettle();
    // expect(selectedTime, TimeOfDay(hour: 22, minute: 30)); // 10 PM은 22:30
    //
    // // 분을 30에서 45로 변경 시뮬레이션
    // await tester.tap(find.text('30minute'));
    // await tester.pumpAndSettle();
    // await tester.tap(find.text('45minute').last);
    // await tester.pumpAndSettle();
    // expect(selectedTime, TimeOfDay(hour: 22, minute: 45)); // 22:45

    // 최종 선택된 시간이 표시되는지 확인
    // expect(find.text('pm'), findsOneWidget);
    // expect(find.text('10hour'), findsOneWidget);
    // expect(find.text('45minute'), findsOneWidget);
  });
}
