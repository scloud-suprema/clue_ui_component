import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueDecoratedButton extends StatelessWidget {
  const ClueDecoratedButton({
    Key? key,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  }) : super(key: key);

  const ClueDecoratedButton.icon30({
    Key? key,
    this.width = 30,
    this.height = 30,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  }) : super(key: key);

  const ClueDecoratedButton.icon40({
    Key? key,
    this.width = 40,
    this.height = 40,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  }) : super(key: key);

  const ClueDecoratedButton.text({
    Key? key,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    required this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Widget child;
  final Color? color;
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
