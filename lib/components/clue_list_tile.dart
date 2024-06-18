import 'package:flutter/material.dart';

/// A custom list tile widget for CLUe UI components.
class ClueListTile extends StatelessWidget {
  /// Creates a ClueListTile.
  ///
  /// [mainAxisSize] specifies the main axis size of the row.
  /// [crossAxisAlignment] specifies the cross axis alignment of the row.
  /// [onTap] is the callback function called when the tile is tapped.
  /// [padding] is the padding inside the tile.
  /// [leftWidget] is the widget displayed on the left side of the tile.
  /// [leftWidgetMinWidth] is the minimum width of the left widget.
  /// [centerWidget] is the widget displayed in the center of the tile.
  /// [centerAndRightGapWidget] is the widget displayed between the center and right widgets.
  /// [rightWidget] is the widget displayed on the right side of the tile.
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

  /// The main axis size of the row.
  final MainAxisSize mainAxisSize;

  /// The cross axis alignment of the row.
  final CrossAxisAlignment crossAxisAlignment;

  /// The padding inside the tile.
  final EdgeInsets padding;

  /// The callback function called when the tile is tapped.
  final VoidCallback? onTap;

  /// The widget displayed on the left side of the tile.
  final Widget leftWidget;

  /// The minimum width of the left widget.
  final double leftWidgetMinWidth;

  /// The widget displayed in the center of the tile.
  final Widget centerWidget;

  /// The widget displayed between the center and right widgets.
  final Widget centerAndRightGapWidget;

  /// The widget displayed on the right side of the tile.
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
