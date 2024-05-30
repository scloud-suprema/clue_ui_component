import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:clue_ui_component/sample_widget_page/sample_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (dynamic progress) {
        return const Center(child: ClueCircularLoading());
      },
      child: const SampleWidgetPage(),
    );
  }
}
