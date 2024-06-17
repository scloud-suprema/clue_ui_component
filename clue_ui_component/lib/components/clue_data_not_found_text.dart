import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A widget that displays a "data not found" message for CLUe UI components.
class ClueDataNotFoundText extends StatelessWidget {
  /// The text to be displayed when data is not found.
  final String notFoundText;

  /// Creates a ClueDataNotFoundText.
  ///
  /// [notFoundText] specifies the message to be displayed.
  const ClueDataNotFoundText({super.key, required this.notFoundText});

  @override
  Widget build(BuildContext context) {
    return Text(
      notFoundText,
      style: MyTextStyle.size14,
    );
  }
}
