import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueDataNotFoundText extends StatelessWidget {
  final String notFoundText;
  const ClueDataNotFoundText({super.key, required this.notFoundText});
  @override
  Widget build(BuildContext context) {
    return Text(
      notFoundText,
      style: MyTextStyle.size14,
    );
  }
}
