import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A circular button widget for CLUe UI components.
class ClueCircleButton extends StatelessWidget {
  /// Creates a ClueCircleButton.
  ///
  /// [child] is the widget to be displayed inside the button.
  /// [onPressed] is the callback function to be called when the button is pressed.
  const ClueCircleButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  /// The widget to be displayed inside the button.
  final Widget child;

  /// The callback function to be called when the button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: MyColors.xFF000000,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
