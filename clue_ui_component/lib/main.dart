import 'package:flutter/material.dart';

// import clue component module
import 'package:clue_ui_component/clue_ui_component.dart';

void main() {
  // runApp(MyApp());

  runApp(SampleApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GlobalLoaderOverlay(
//       useDefaultLoading: false,
//       overlayWidgetBuilder: (dynamic progress) {
//         return const Center(child: ClueCircularLoading());
//       },
//       child: const SampleWidgetPage(),
//     );
//   }
// }

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: clueNavigatorKey, // << Add this line
      home: Scaffold(
        body: Center(
          child: ClueDropDownButton(
            itemMap: const {"Key1": "value1", "Key2": "value2"},
            onChanged: (String key) {
              ClueOverlay.showSuccessToast(
                key,
              );
            },
          ),
        ),
      ),
    );
  }
}
