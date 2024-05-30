import 'package:clue_ui_component/components/clue_check_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets('ClueCheckListTile toggles state on tap', (WidgetTester tester) async {
    bool isChecked = false;

    // 유효한 SVG 데이터를 포함하는 SvgPicture를 만듭니다.
    final String validSvgData = '''
    <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
      <rect width="100" height="100" fill="black"/>
    </svg>
    ''';

    final SvgPicture checkboxOn = SvgPicture.string(validSvgData);
    final SvgPicture checkboxOff = SvgPicture.string(validSvgData);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueCheckListTile(
            title: 'Test Title',
            initValue: isChecked,
            onChanged: (bool value) {
              isChecked = value;
            },
            checkboxOn: checkboxOn,
            checkboxOff: checkboxOff,
          ),
        ),
      ),
    );

    // 초기 상태 검증
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);

    // 체크박스를 탭하여 상태 변경
    await tester.tap(find.byType(ClueCheckListTile));
    await tester.pumpAndSettle();

    // 상태 변경 후 검증
    expect(isChecked, true);

    // 다시 체크박스를 탭하여 상태 변경
    await tester.tap(find.byType(ClueCheckListTile));
    await tester.pumpAndSettle();

    // 상태 변경 후 검증
    expect(isChecked, false);
  });
}
