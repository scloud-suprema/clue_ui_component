import 'package:flutter/material.dart';

// import clue component module
import 'package:clue_ui_component/clue_ui_component.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
