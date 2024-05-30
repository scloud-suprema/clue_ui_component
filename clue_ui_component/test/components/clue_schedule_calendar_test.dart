import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/svg.dart';
import 'package:clue_ui_component/components/clue_schedule_calendar.dart';

void main() {
  const String svgData = '''
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v6h-2zm0 8h2v2h-2z"/>
  </svg>
  ''';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  testWidgets('ClueScheduleCalendar가 올바르게 렌더링됨', (WidgetTester tester) async {
    // 기본 데이터를 설정
    final now = DateTime.now();
    final SvgPicture leftArrowImage = SvgPicture.string(svgData);
    final SvgPicture calendarImage = SvgPicture.string(svgData);
    final SvgPicture rightArrowImage = SvgPicture.string(svgData);
    final SvgPicture refreshImage = SvgPicture.string(svgData);
    final SvgPicture circleLeftArrowImage = SvgPicture.string(svgData);
    final SvgPicture circleRedNotice = SvgPicture.string(svgData);

    // ClueScheduleCalendar 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('ClueScheduleCalendar Demo')),
          body: ClueScheduleCalendar(
            key: Key("ClueScheduleCalendar"),
            navigatorKey: navigatorKey,
            initStartTime: now.subtract(Duration(days: 7)),
            initEndTime: now,
            select: (startTime, endTime) {},
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onRefresh: () {
              print('Refresh button clicked');
            },
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // ClueScheduleCalendar 위젯 찾기
    final scheduleCalendar = find.byKey(const Key("ClueScheduleCalendar"));
    expect(scheduleCalendar, findsOneWidget);

    // 각 버튼과 아이콘이 올바르게 렌더링되는지 확인
    expect(find.text('Today'), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(6)); // SVG 아이콘 6개가 있는지 확인
  });

  testWidgets('왼쪽 화살표 버튼 클릭 시 이전 날짜로 이동', (WidgetTester tester) async {
    final initialDate = DateTime.now();
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);

    DateTime? selectedStartTime;
    DateTime? selectedEndTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: GlobalKey<NavigatorState>(),
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {
              selectedStartTime = startTime;
              selectedEndTime = endTime;
            },
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // 초기 날짜 설정 확인
    expect(selectedStartTime, isNull);
    expect(selectedEndTime, isNull);

    // 왼쪽 화살표 버튼 클릭
    await tester.tap(find.byWidget(leftArrowImage));
    await tester.pumpAndSettle();

    // 날짜가 이전 날짜로 이동했는지 확인
    var initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day);
    expect(selectedStartTime, initialDateOnly.subtract(Duration(days: 1)));
    initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day, 23, 59, 59, 999);
    expect(selectedEndTime, initialDateOnly.subtract(Duration(days: 1)));
  });

  testWidgets('오른쪽 화살표 버튼 클릭 시 다음 날짜로 이동', (WidgetTester tester) async {
    final initialDate = DateTime.now().subtract(Duration(days: 1));
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);

    DateTime? selectedStartTime;
    DateTime? selectedEndTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: GlobalKey<NavigatorState>(),
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {
              selectedStartTime = startTime;
              selectedEndTime = endTime;
            },
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // 초기 날짜 설정 확인
    expect(selectedStartTime, isNull);
    expect(selectedEndTime, isNull);

    // 왼쪽 화살표 버튼 클릭
    await tester.tap(find.byWidget(leftArrowImage));
    await tester.pumpAndSettle();

    // 오른쪽 화살표 버튼 클릭
    await tester.tap(find.byWidget(rightArrowImage));
    await tester.pumpAndSettle();

    // 날짜가 이전 날짜로 이동했는지 확인
    var initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day);
    expect(selectedStartTime, initialDateOnly.add(Duration(days: 1)));
    initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day, 23, 59, 59, 999);
    expect(selectedEndTime, initialDateOnly.add(Duration(days: 1)));
  });

  testWidgets('Today 버튼 클릭 시 다음 날짜로 이동', (WidgetTester tester) async {
    final initialDate = DateTime.now();
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);

    DateTime? selectedStartTime;
    DateTime? selectedEndTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: GlobalKey<NavigatorState>(),
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {
              selectedStartTime = startTime;
              selectedEndTime = endTime;
            },
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // 초기 날짜 설정 확인
    expect(selectedStartTime, isNull);
    expect(selectedEndTime, isNull);

    // Today 버튼 클릭
    await tester.tap(find.text("Today"));
    await tester.pumpAndSettle();

    // 날짜가 이전 날짜로 이동했는지 확인
    var initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day);
    expect(selectedStartTime, initialDateOnly);
    initialDateOnly = DateTime(initialDate.year, initialDate.month, initialDate.day, 23, 59, 59, 999);
    expect(selectedEndTime, initialDateOnly);
  });

  testWidgets('캘린더 아이콘 버튼 클릭 시 onCalanderClick 함수 호출', (WidgetTester tester) async {
    final initialDate = DateTime.now();
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);
    final key = GlobalKey<NavigatorState>();
    DateTime? selectedStartTime;
    DateTime? selectedEndTime;
    bool isCalanerClick = false;

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: key,
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {},
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {
              isCalanerClick = true;
            },
          ),
        ),
      ),
    );

    // 초기 날짜 설정 확인
    expect(selectedStartTime, isNull);
    expect(selectedEndTime, isNull);

    // 캘린더 아이콘 버튼 클릭
    await tester.tap(find.byType(IconButton).first);
    await tester.pumpAndSettle();

    // Mocking 결과를 반영하여 날짜가 선택되었는지 확인
    expect(isCalanerClick, true);
  });

  testWidgets('ClueScheduleCalendar의 새로 고침 버튼을 클릭하면 onRefresh 콜백이 호출됨', (WidgetTester tester) async {
    final now = DateTime.now();
    final SvgPicture leftArrowImage = SvgPicture.string(svgData);
    final SvgPicture calendarImage = SvgPicture.string(svgData);
    final SvgPicture rightArrowImage = SvgPicture.string(svgData);
    final SvgPicture refreshImage = SvgPicture.string(svgData);
    final SvgPicture circleLeftArrowImage = SvgPicture.string(svgData);
    final SvgPicture circleRedNotice = SvgPicture.string(svgData);
    bool refreshButtonClicked = false;

    // ClueScheduleCalendar 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediaQuery(
            data: MediaQueryData(size: Size(800, 600)),
            child: ClueScheduleCalendar(
              navigatorKey: navigatorKey,
              initStartTime: now.subtract(Duration(days: 7)),
              initEndTime: now,
              select: (startTime, endTime) {},
              range: (startTime, endTime) {},
              todayText: 'Today',
              errorFontfamily: 'Arial',
              lastMonthString: 'Last Month',
              nextMonthString: 'Next Month',
              cancelString: 'Cancel',
              okString: 'OK',
              selectDateString: 'Select Date',
              daysMaxString: 'Max Days',
              selectDurationString: 'Select Duration',
              leftArrowImage: leftArrowImage,
              calendarImage: calendarImage,
              rightArrowImage: rightArrowImage,
              refreshImage: refreshImage,
              circleLeftArrowImage: circleLeftArrowImage,
              onRefresh: () {
                refreshButtonClicked = true;
              },
              onCalanderClick: () {},
            ),
          ),
        ),
      ),
    );

    // 새로 고침 버튼 클릭
    await tester.tap(find.byType(SvgPicture).at(3)); // 새로 고침 버튼 인덱스
    await tester.pumpAndSettle();

    // 새로 고침 버튼 클릭 여부 확인
    expect(refreshButtonClicked, isTrue);
  });

  testWidgets('horizontalCalendar - 초기 날짜 설정 확인', (WidgetTester tester) async {
    final initialDate = DateTime.now();
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);

    DateTime? selectedStartTime;
    DateTime? selectedEndTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: GlobalKey<NavigatorState>(),
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {
              selectedStartTime = startTime;
              selectedEndTime = endTime;
            },
            range: (startTime, endTime) {},
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // 초기 날짜 설정 확인
    expect(selectedStartTime, isNull);
    expect(selectedEndTime, isNull);
  });

  testWidgets('Test gesture events in horizontal calendar', (WidgetTester tester) async {
    final initialDate = DateTime.now();
    final leftArrowImage = SvgPicture.string(svgData);
    final calendarImage = SvgPicture.string(svgData);
    final rightArrowImage = SvgPicture.string(svgData);
    final refreshImage = SvgPicture.string(svgData);
    final circleLeftArrowImage = SvgPicture.string(svgData);
    final circleRedNotice = SvgPicture.string(svgData);

    DateTime? selectedStartTime;
    DateTime? selectedEndTime;

    DateTime? rangedStartTime;
    DateTime? rangedEndTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueScheduleCalendar(
            navigatorKey: GlobalKey<NavigatorState>(),
            initStartTime: initialDate.subtract(Duration(days: 7)),
            initEndTime: initialDate,
            select: (startTime, endTime) {
              selectedStartTime = startTime;
              selectedEndTime = endTime;
            },
            range: (startTime, endTime) {
              rangedStartTime = startTime;
              rangedEndTime = endTime;
            },
            todayText: 'Today',
            errorFontfamily: 'Arial',
            lastMonthString: 'Last Month',
            nextMonthString: 'Next Month',
            cancelString: 'Cancel',
            okString: 'OK',
            selectDateString: 'Select Date',
            daysMaxString: 'Max Days',
            selectDurationString: 'Select Duration',
            leftArrowImage: leftArrowImage,
            calendarImage: calendarImage,
            rightArrowImage: rightArrowImage,
            refreshImage: refreshImage,
            circleLeftArrowImage: circleLeftArrowImage,
            onCalanderClick: () {},
          ),
        ),
      ),
    );

    // Find the ListView widget
    Finder listViewFinder = find.byType(ListView);

    // Simulate onLongPressDown gesture
    await tester.longPress(listViewFinder);
    await tester.pumpAndSettle();

    // Simulate onLongPressMoveUpdate gesture
    await tester.drag(listViewFinder, const Offset(-100, 0));
    await tester.pumpAndSettle();

    // Simulate onHorizontalDragDown gesture
    TestGesture dragGesture = await tester.startGesture(tester.getCenter(listViewFinder));
    await tester.pumpAndSettle();

    // Simulate onHorizontalDragStart gesture
    await dragGesture.moveBy(const Offset(50, 0));
    await tester.pumpAndSettle();

    // Simulate onHorizontalDragUpdate gesture
    await dragGesture.moveBy(const Offset(-100, 0));
    await tester.pumpAndSettle();

    // Simulate onHorizontalDragEnd gesture
    await dragGesture.up();
    await tester.pumpAndSettle();
  });
}
