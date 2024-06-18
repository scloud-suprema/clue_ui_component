import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A widget that displays an error message with a refresh button for CLUe UI components.
class ClueErrorText extends StatelessWidget {
  /// The error message to be displayed.
  final String errorText;

  /// The callback function to be called when the refresh button is pressed.
  final void Function() onRefresh;

  /// Creates a ClueErrorText.
  ///
  /// [errorText] is the error message to be displayed.
  /// [onRefresh] is the callback function to be called when the refresh button is pressed.
  const ClueErrorText({
    super.key,
    required this.errorText,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClueText(
          errorText,
          textAlign: TextAlign.center,
          style: MyTextStyle.size16.h1_5,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: onRefresh,
          ),
        )
      ],
    );
  }
}
