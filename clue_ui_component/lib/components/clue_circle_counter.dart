import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A circular counter widget for CLUe UI components.
class ClueCircleCounter extends StatelessWidget {
  /// Creates a ClueCircleCounter.
  ///
  /// [backgroundColor] is the background color of the counter.
  /// [count] is the number to be displayed inside the counter.
  const ClueCircleCounter({
    super.key,
    this.backgroundColor = MyColors.xFF000000,
    required this.count,
  });

  /// The background color of the counter.
  final Color backgroundColor;

  /// The number to be displayed inside the counter.
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Center(
          child: Text(
            count.toString(),
            style: MyTextStyle.size12.w500.xFFFFFFFF,
          ),
        ),
      ),
    );
  }
}
