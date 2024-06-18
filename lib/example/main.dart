import 'package:flutter/material.dart';

import '../clue_ui_component.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

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
