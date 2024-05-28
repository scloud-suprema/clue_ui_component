import 'package:flutter/material.dart';

class ClueListTile extends StatelessWidget {
  const ClueListTile({
    super.key,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onTap,
    this.padding = const EdgeInsets.only(),
    required this.leftWidget,
    this.leftWidgetMinWidth = 100,
    this.centerWidget = const SizedBox.shrink(),
    this.centerAndRightGapWidget = const Spacer(),
    this.rightWidget,
  });

  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Widget leftWidget;
  final double leftWidgetMinWidth;
  final Widget centerWidget;
  final Widget centerAndRightGapWidget;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: leftWidgetMinWidth),
              child: leftWidget,
            ),
            const SizedBox(width: 16),
            centerWidget,
            if (rightWidget != null) ...[
              centerAndRightGapWidget,
              rightWidget!,
            ],
          ],
        ),
      ),
    );
  }
}
