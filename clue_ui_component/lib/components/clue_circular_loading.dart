import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueCircularLoading extends StatelessWidget {
  const ClueCircularLoading({
    super.key,
    this.width = 18,
    this.height = 18,
    this.color = MyColors.xFF000000,
  });

  const ClueCircularLoading.white({
    super.key,
    this.width = 18,
    this.height = 18,
    this.color = MyColors.xFFFFFFFF,
  });

  final double width;
  final double height;
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
