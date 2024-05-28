import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueCircleCounter extends StatelessWidget {
  const ClueCircleCounter({
    super.key,
    this.backgroundColor = MyColors.xFF000000,
    required this.count,
  });

  final Color backgroundColor;
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
