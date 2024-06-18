import 'package:clue_ui_component/clue_navigator_key.dart';
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/sample_widget_page/dialog_tap_page/dialog_tap_page.dart';
import 'package:clue_ui_component/sample_widget_page/theme_tap_page/theme_tap_page.dart';
import 'package:clue_ui_component/sample_widget_page/widget_tap_page/widget_tap_page.dart';
import 'package:clue_ui_component/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SampleWidgetPage extends StatelessWidget {
  const SampleWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: clueNavigatorKey, // << Add this line
      // locale: context.locale,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      theme: themeData(context, "NotoSansKR"),
      home: const SampleWidgetPageHome(),
    );
  }
}

List<String> _titleTabs = ['Theme', 'Widget', 'Dialog'];
List<Widget> _widgetTabs = [const ThemeTapPage(), const WidgetTapPage(), const DialogTapPage()];

class SampleWidgetPageHome extends StatelessWidget {
  const SampleWidgetPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _titleTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _titleTabs.map((String name) => Tab(text: name)).toList(),
          ),
        ),
        body: TabBarView(
          children: _widgetTabs,
        ),
      ),
    );
  }
}

class CopyTooltipWidget extends StatelessWidget {
  const CopyTooltipWidget({
    super.key,
    required this.code,
    required this.child,
  });

  final String code;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: code));
        ClueOverlay.showSuccessToast(
          '코드가 복사되었습니다.',
        );
      },
      child: Tooltip(
        message: code,
        child: child,
      ),
    );
  }
}
