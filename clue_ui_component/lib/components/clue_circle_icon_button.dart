import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueCircleButton extends StatelessWidget {
  const ClueCircleButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
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
