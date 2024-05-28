import 'package:clue_ui_component/components/clue_side_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clue_ui_component/components/clue_schedule_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: 1024, // 고정 너비
            height: 768, // 고정 높이
            child: MaterialApp(
              home: ClueScheduleCalendarDemo(),
            ),
          ),
        );
      },
    );
  }
}

class ClueScheduleCalendarDemo extends StatelessWidget {
  const ClueScheduleCalendarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String svgData = '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v6h-2zm0 8h2v2h-2z"/>
    </svg>
    ''';

    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final now = DateTime.now();
    final SvgPicture leftArrowImage = SvgPicture.string(svgData);
    final SvgPicture calendarImage = SvgPicture.string(svgData);
    final SvgPicture rightArrowImage = SvgPicture.string(svgData);
    final SvgPicture refreshImage = SvgPicture.string(svgData);
    final SvgPicture circleLeftArrowImage = SvgPicture.string(svgData);
    final SvgPicture circleRedNotice = SvgPicture.string(svgData);

    final String title = "Example Title";
    final Widget logo = Icon(Icons.ac_unit);
    final String logoTitle = "Logo Title";
    final List<ClueSideBarInfo> infoList = [
      ClueSideBarInfo(title: "Info Title 1", subTitle: "Info SubTitle 1"),
      ClueSideBarInfo(title: "Info Title 2", subTitle: "Info SubTitle 2"),
    ];
    final List<ClueSideBarItem> itemList = [
      ClueSideBarItem(
        icon: SvgPicture.string(svgData),
        title: "Item Title 1",
      ),
      ClueSideBarItem(
        icon: SvgPicture.string(svgData),
        title: "Item Title 2",
      ),
    ];
    final Widget child = Center(child: Text("Main Content"));

    return Scaffold(
      appBar: AppBar(title: Text('ClueScheduleCalendar Demo')),
      body: ClueSideBarComponent(
        title: title,
        titleOnTap: () {},
        logo: logo,
        logoTitle: logoTitle,
        infoList: infoList,
        itemList: itemList,
        child: SizedBox.shrink(),
        leftArrow: SvgPicture.string(svgData),
        rightArrow: SvgPicture.string(svgData),
      ),
    );
  }
}
