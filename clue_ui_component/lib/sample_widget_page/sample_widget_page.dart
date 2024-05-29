import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/main.dart';
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/sample_widget_page/dialog_tap_page/dialog_tap_page.dart';
import 'package:clue_ui_component/sample_widget_page/image_tap_page/image_tap_page.dart';
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
      navigatorKey: rootNavigatorKey,
      // locale: context.locale,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      theme: themeData(context, "NotoSansKR"),
      home: const SampleWidgetPageHome(),
    );
  }
}

List<String> _titleTabs = ['Theme', 'Widget', 'Dialog', 'Image'];
List<Widget> _widgetTabs = [const ThemeTapPage(), const WidgetTapPage(), const DialogTapPage(), const ImageTapPage()];

class SampleWidgetPageHome extends StatelessWidget {
  const SampleWidgetPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _titleTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const ClueText('Visior Component Sample'),
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
    Key? key,
    required this.code,
    required this.child,
  }) : super(key: key);

  final String code;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: code));
        ClueOverlay.showSuccessToast('코드가 복사되었습니다.', rootNavigatorKey);
      },
      child: Tooltip(
        message: code,
        child: child,
      ),
    );
  }
}
