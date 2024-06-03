import 'package:clue_ui_component/components/clue_side_bar_component.dart';
import 'package:clue_ui_component/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String validSvgData = '''
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v6h-2zm0 8h2v2h-2z"/>
  </svg>
  ''';

  Future<Widget> buildTestWidget(Widget target) async {
    final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(2080, 1080)); // 화면 크기 설정
    return MaterialApp(home: Scaffold(body: target));
  }

  testWidgets('ClueSideBarComponent 위젯 테스트', (WidgetTester tester) async {
    // 테스트를 위한 예제 데이터 생성
    const String title = "Example Title";
    const String logoTitle = "Logo Title";
    final List<ClueSideBarInfo> infoList = [
      const ClueSideBarInfo(title: "Info Title 1", subTitle: "Info SubTitle 1"),
      const ClueSideBarInfo(title: "Info Title 2", subTitle: "Info SubTitle 2"),
    ];
    final List<ClueSideBarItem> itemList = [
      ClueSideBarItem(
        icon: SvgPicture.string(validSvgData),
        title: "Item Title 1",
      ),
      ClueSideBarItem(
        icon: SvgPicture.string(validSvgData),
        title: "Item Title 2",
      ),
    ];
    const Widget child = Center(child: Text("Main Content"));
    const Widget leftWidget = MyImages.leftArrow;
    const Widget rightwidget = MyImages.rightArrow;
    // 테스트 위젯 빌드
    final testWidget = await buildTestWidget(
      SizedBox(
        width: 300, // 충분한 가로 크기를 할당하여 오버플로우 문제 방지
        child: ClueSideBarComponent(
          title: title,
          titleOnTap: () {},
          logo: SvgPicture.string(validSvgData),
          logoTitle: logoTitle,
          infoList: infoList,
          itemList: itemList,
          leftArrow: leftWidget,
          rightArrow: rightwidget,
          child: child,
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    // 위젯이 제대로 렌더링되는지 확인
    expect(find.text(title), findsOneWidget);
    expect(find.text(logoTitle), findsOneWidget);

    expect(find.text("Info Title 1"), findsOneWidget);
    expect(find.text("Info SubTitle 1"), findsOneWidget);
    expect(find.text("Info Title 2"), findsOneWidget);
    expect(find.text("Info SubTitle 2"), findsOneWidget);
    expect(find.text("Item Title 1"), findsOneWidget);
    expect(find.text("Item Title 2"), findsOneWidget);
    expect(find.text("Main Content"), findsOneWidget);

    // // 애니메이션이 시작되었을 때, 사이드바의 넓이가 줄어드는지 확인
    final initialWidth = tester.getSize(find.byType(AnimatedContainer)).width;
    await tester.tap(find.byKey(const Key("Icon")));
    await tester.pump(); // 애니메이션 시작
    await tester.pump(const Duration(milliseconds: 300)); // 애니메이션 끝날 때까지 기다림

    final updatedWidth = tester.getSize(find.byType(AnimatedContainer)).width;
    expect(updatedWidth, lessThan(initialWidth));

    expect(find.byType(SvgPicture), findsNWidgets(2)); // 아이콘 갯수 확인
  });
}
