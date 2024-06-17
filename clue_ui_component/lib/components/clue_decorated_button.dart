import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A decorated button widget for CLUe UI components.
class ClueDecoratedButton extends StatelessWidget {
  /// Creates a ClueDecoratedButton.
  ///
  /// [width] specifies the width of the button.
  /// [height] specifies the height of the button.
  /// [padding] specifies the padding inside the button.
  /// [onPressed] is the callback function to be called when the button is pressed.
  /// [child] is the widget to be displayed inside the button.
  /// [color] specifies the background color of the button.
  /// [borderColor] specifies the border color of the button.
  const ClueDecoratedButton({
    super.key,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  });

  /// Creates a ClueDecoratedButton with icon size 30.
  ///
  /// [width] is set to 30.
  /// [height] is set to 30.
  const ClueDecoratedButton.icon30({
    super.key,
    this.width = 30,
    this.height = 30,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  });

  /// Creates a ClueDecoratedButton with icon size 40.
  ///
  /// [width] is set to 40.
  /// [height] is set to 40.
  const ClueDecoratedButton.icon40({
    super.key,
    this.width = 40,
    this.height = 40,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  });

  /// Creates a ClueDecoratedButton with text.
  ///
  /// [padding] is set to EdgeInsets.symmetric(horizontal: 12, vertical: 4).
  const ClueDecoratedButton.text({
    super.key,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  });

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// The callback function to be called when the button is pressed.
  final Function()? onPressed;

  /// The widget to be displayed inside the button.
  final Widget child;

  /// The background color of the button.
  final Color? color;

  /// The border color of the button.
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? MyColors.xFFE2E8F0),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: () {
          if (width == null) {
            return child;
          } else {
            return Center(child: child);
          }
        }(),
      ),
    );
  }
}
