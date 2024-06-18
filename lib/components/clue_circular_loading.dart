import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A circular loading indicator for CLUe UI components.
class ClueCircularLoading extends StatelessWidget {
  /// Creates a ClueCircularLoading.
  ///
  /// [width] specifies the width of the loading indicator.
  /// [height] specifies the height of the loading indicator.
  /// [color] specifies the color of the loading indicator.
  const ClueCircularLoading({
    super.key,
    this.width = 18,
    this.height = 18,
    this.color = MyColors.xFF000000,
  });

  /// Creates a ClueCircularLoading with a white color.
  ///
  /// [width] specifies the width of the loading indicator.
  /// [height] specifies the height of the loading indicator.
  const ClueCircularLoading.white({
    super.key,
    this.width = 18,
    this.height = 18,
    this.color = MyColors.xFFFFFFFF,
  });

  /// The width of the loading indicator.
  final double width;

  /// The height of the loading indicator.
  final double height;

  /// The color of the loading indicator.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
    );
  }
}
