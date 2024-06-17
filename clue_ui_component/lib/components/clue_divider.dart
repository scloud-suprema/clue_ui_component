import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A custom divider widget for CLUe UI components.
class ClueDivider extends StatelessWidget {
  /// Creates a ClueDivider with a specified color.
  ///
  /// [color] specifies the color of the divider. Defaults to [MyColors.xFFE2E8F0].
  const ClueDivider({
    super.key,
    this.color = MyColors.xFFE2E8F0,
  });

  /// Creates a ClueDivider with white color.
  const ClueDivider.white({
    super.key,
    this.color = MyColors.xFFFFFFFF,
  });

  /// The color of the divider.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, color: color);
  }
}
