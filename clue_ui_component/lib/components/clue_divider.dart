import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueDivider extends StatelessWidget {
  const ClueDivider({
    super.key,
    this.color = MyColors.xFFE2E8F0,
  });

  const ClueDivider.white({
    super.key,
    this.color = MyColors.xFFFFFFFF,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, color: color);
  }
}
