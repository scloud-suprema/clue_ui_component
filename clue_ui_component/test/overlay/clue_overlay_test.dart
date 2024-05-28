// clue_overlay_test.dart
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/overlay/clue_overlay_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  const String svgData = '''
  <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
    <circle cx="12" cy="12" r="10" stroke="black" stroke-width="2" fill="white" />
  </svg>
  ''';

  testWidgets('showLoading와 hideLoading가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.black.withOpacity(0.7),
          overlayWholeScreen: true,
          overlayWidgetBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          child: Scaffold(
            appBar: AppBar(title: const Text('Loader Overlay Test')),
            body: const Center(child: Text('Test Body')),
          ),
        ),
      ),
    );

    // Initially, the overlay should not be visible
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Show the loading overlay
    ClueOverlay.showLoading(navigatorKey);
    await tester.pump(); // Pump to update the widget tree

    // The overlay should be visible
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Hide the loading overlay
    ClueOverlay.hideLoading(navigatorKey);
    await tester.pump(); // Pump to update the widget tree

    // The overlay should no longer be visible
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('showSuccessToast와 showErrorToast가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(builder: (context) => child!),
              ClueOverlayEntry.overlayEntry,
            ],
          );
        },
        home: Scaffold(),
      ),
    );

    // SVG 그림을 위한 가짜 데이터 설정
    const String svgData = '''
    <svg height="100" width="100">
      <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="blue" />
    </svg>
    ''';

    final SvgPicture circleBlueCheck = SvgPicture.string(svgData);
    final SvgPicture circleRedNotice = SvgPicture.string(svgData);

    // showSuccessToast 테스트
    ClueOverlay.showSuccessToast("Success", "Arial", circleBlueCheck, navigatorKey);
    await tester.pumpAndSettle();

    expect(find.text("Success"), findsOneWidget);

    // showErrorToast 테스트
    ClueOverlay.showErrorToast("Error", "Arial", circleRedNotice, navigatorKey);
    await tester.pumpAndSettle();

    expect(find.text("Error"), findsOneWidget);

    // Fast-forward the timer
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('showClueDialog가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 다이얼로그 표시
    ClueOverlay.showClueDialog(
      dialog: AlertDialog(title: Text('Dialog')),
      navigatorKey: navigatorKey,
    );
    await tester.pump();

    // 다이얼로그 확인
    expect(find.text('Dialog'), findsOneWidget);
  });

  testWidgets('showCalendarSingle가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarSingle(
      navigatorKey: navigatorKey,
      initDateTime: DateTime.now(),
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select a date',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    // 달력 확인
    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('showCalendarSingle가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarSingle(
      navigatorKey: navigatorKey,
      initDateTime: DateTime.now(),
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select a date',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('showCalendarMulti가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarMulti(
      navigatorKey: navigatorKey,
      initDateTime: [DateTime.now()],
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select dates',
      daysMaxString: 'Max 5 days',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    // 달력 확인
    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('showCalendarMulti가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarMulti(
      navigatorKey: navigatorKey,
      initDateTime: [DateTime.now()],
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select dates',
      daysMaxString: 'Max 5 days',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    // 달력 확인
    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('showCalendarRange가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarRange(
      navigatorKey: navigatorKey,
      initDateTime: (startDate: DateTime.now().subtract(Duration(days: 7)), endDate: DateTime.now()),
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select a date range',
      daysMaxString: 'Max 7 days',
      selectDurationString: 'Select a duration',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    // 달력 확인
    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('showCalendarRange가 제대로 작동함', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final SvgPicture leftArrow = SvgPicture.string(svgData);
    final SvgPicture rightArrow = SvgPicture.string(svgData);
    final SvgPicture errorIcon = SvgPicture.string(svgData);

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(body: Center(child: Text('Home Page'))),
      ),
    );

    // 달력 표시
    ClueOverlay.showCalendarRange(
      navigatorKey: navigatorKey,
      initDateTime: (startDate: DateTime.now().subtract(Duration(days: 7)), endDate: DateTime.now()),
      minDateTime: DateTime.now().subtract(Duration(days: 365)),
      maxDateTime: DateTime.now().add(Duration(days: 365)),
      errorFontfamily: 'Arial',
      lastMonthString: 'Previous',
      nextMonthString: 'Next',
      cancelString: 'Cancel',
      okString: 'OK',
      selectDateString: 'Select a date range',
      daysMaxString: 'Max 7 days',
      selectDurationString: 'Select a duration',
      leftArrow: leftArrow,
      circleRedNotice: errorIcon,
      rightArrow: rightArrow,
    );
    await tester.pump();

    // 달력 확인
    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text('OK'), findsNothing);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('ClueOkDialog 표시 및 OK 버튼 동작 테스트', (WidgetTester tester) async {
    // 테스트용 데이터 설정
    const String testTitle = 'Test Title';
    const String testBody = 'This is a test body.';
    const String testOkButtonText = 'OK';

    // ClueOkDialog 위젯 생성
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClueOkDialog(
                        title: testTitle,
                        body: Text(testBody),
                        okButtonText: testOkButtonText,
                      );
                    },
                  );
                },
                child: Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    // 다이얼로그 표시 버튼 클릭
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // 다이얼로그 내용 확인
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testBody), findsOneWidget);
    expect(find.text(testOkButtonText), findsOneWidget);

    // OK 버튼 클릭
    await tester.tap(find.text(testOkButtonText));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text(testTitle), findsNothing);
    expect(find.text(testBody), findsNothing);
    expect(find.text(testOkButtonText), findsNothing);
  });

  testWidgets('ClueOkCancelDialog 표시 및 OK/Cancel 버튼 동작 테스트', (WidgetTester tester) async {
    // 테스트용 데이터 설정
    const String testTitle = 'Test Title';
    const String testBody = 'This is a test body.';
    const String testOkButtonText = 'OK';
    const String testCancelButtonText = 'Cancel';

    // ClueOkCancelDialog 위젯 생성
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClueOkCancelDialog(
                        title: testTitle,
                        body: Text(testBody),
                        okButtonText: testOkButtonText,
                        cancelButtonText: testCancelButtonText,
                      );
                    },
                  );
                },
                child: Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    // 다이얼로그 표시 버튼 클릭
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // 다이얼로그 내용 확인
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testBody), findsOneWidget);
    expect(find.text(testOkButtonText), findsOneWidget);
    expect(find.text(testCancelButtonText), findsOneWidget);

    // OK 버튼 클릭
    await tester.tap(find.text(testOkButtonText));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text(testTitle), findsNothing);
    expect(find.text(testBody), findsNothing);
    expect(find.text(testOkButtonText), findsNothing);
    expect(find.text(testCancelButtonText), findsNothing);

    // 다이얼로그 다시 표시
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Cancel 버튼 클릭
    await tester.tap(find.text(testCancelButtonText));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text(testTitle), findsNothing);
    expect(find.text(testBody), findsNothing);
    expect(find.text(testOkButtonText), findsNothing);
    expect(find.text(testCancelButtonText), findsNothing);
  });

  testWidgets('ClueOkCancelDialog 표시 및 OK/Cancel 버튼 동작 테스트', (WidgetTester tester) async {
    // 테스트용 데이터 설정
    const String testTitle = 'Test Title';
    const String testBody = 'This is a test body.';
    const String testOkButtonText = 'OK';
    const String testCancelButtonText = 'Cancel';
    bool isOkClick = false;
    // ClueOkCancelDialog 위젯 생성
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClueOkCancelDialog(
                        title: testTitle,
                        body: Text(testBody),
                        okButtonText: testOkButtonText,
                        cancelButtonText: testCancelButtonText,
                        okButtonFunction: () async {
                          isOkClick = true;
                          return isOkClick;
                        },
                      );
                    },
                  );
                },
                child: Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    // 다이얼로그 표시 버튼 클릭
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // 다이얼로그 내용 확인
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testBody), findsOneWidget);
    expect(find.text(testOkButtonText), findsOneWidget);
    expect(find.text(testCancelButtonText), findsOneWidget);

    // OK 버튼 클릭
    await tester.tap(find.text(testOkButtonText));
    await tester.pumpAndSettle();

    expect(isOkClick, true);
  });

  testWidgets('ClueOkCancelDialog OK 버튼 비활성화 테스트', (WidgetTester tester) async {
    // 테스트용 데이터 설정
    const String testTitle = 'Test Title';
    const String testBody = 'This is a test body.';
    const String testOkButtonText = 'OK';
    const String testCancelButtonText = 'Cancel';

    // ClueOkCancelDialog 위젯 생성
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClueOkCancelDialog(
                        title: testTitle,
                        body: Text(testBody),
                        okButtonText: testOkButtonText,
                        cancelButtonText: testCancelButtonText,
                        okButtonEnable: false,
                      );
                    },
                  );
                },
                child: Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    // 다이얼로그 표시 버튼 클릭
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // OK 버튼 비활성화 확인
    final ElevatedButton okButton = tester.widget(find.widgetWithText(ElevatedButton, testOkButtonText));
    expect(okButton.onPressed, isNull);

    // Cancel 버튼 클릭
    await tester.tap(find.text(testCancelButtonText));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text(testTitle), findsNothing);
    expect(find.text(testBody), findsNothing);
    expect(find.text(testOkButtonText), findsNothing);
    expect(find.text(testCancelButtonText), findsNothing);
  });

  testWidgets('ClueOkCancelDialog Cancel 버튼 비활성화 테스트', (WidgetTester tester) async {
    // 테스트용 데이터 설정
    const String testTitle = 'Test Title';
    const String testBody = 'This is a test body.';
    const String testOkButtonText = 'OK';
    const String testCancelButtonText = 'Cancel';

    // ClueOkCancelDialog 위젯 생성
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClueOkCancelDialog(
                        title: testTitle,
                        body: Text(testBody),
                        okButtonText: testOkButtonText,
                        cancelButtonText: testCancelButtonText,
                        cancelButtonEnable: false,
                      );
                    },
                  );
                },
                child: Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    // 다이얼로그 표시 버튼 클릭
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Cancel 버튼 비활성화 확인
    final OutlinedButton cancelButton = tester.widget(find.widgetWithText(OutlinedButton, testCancelButtonText));
    expect(cancelButton.onPressed, isNull);

    // OK 버튼 클릭
    await tester.tap(find.text(testOkButtonText));
    await tester.pumpAndSettle();

    // 다이얼로그가 닫혔는지 확인
    expect(find.text(testTitle), findsNothing);
    expect(find.text(testBody), findsNothing);
    expect(find.text(testOkButtonText), findsNothing);
    expect(find.text(testCancelButtonText), findsNothing);
  });

  testWidgets('closeBackClueDialog 팝 가능한 경우 테스트', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(title: Text('Second Page')))),
                    );
                  },
                  child: Text('Go to Second Page'),
                );
              },
            ),
          ),
        ),
      ),
    );

    // 홈 화면에서 버튼을 클릭하여 두 번째 페이지로 이동
    await tester.tap(find.text('Go to Second Page'));
    await tester.pumpAndSettle();

    // 두 번째 페이지가 표시되었는지 확인
    expect(find.text('Second Page'), findsOneWidget);

    // closeBackClueDialog 호출
    ClueOverlay.closeBackClueDialog(navigatorKey);
    await tester.pumpAndSettle();

    // 홈 화면으로 돌아왔는지 확인
    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('closeBackClueDialog 팝 불가능한 경우 테스트', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(child: Text('Home Page')),
        ),
      ),
    );

    // 홈 화면이 표시되었는지 확인
    expect(find.text('Home Page'), findsOneWidget);

    // closeBackClueDialog 호출
    ClueOverlay.closeBackClueDialog(navigatorKey);
    await tester.pumpAndSettle();

    // 여전히 홈 화면인지 확인 (팝 불가능한 경우)
    expect(find.text('Home Page'), findsOneWidget);
  });
}
