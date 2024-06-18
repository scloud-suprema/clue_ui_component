import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:flutter/material.dart';

/// A widget that provides an infinitely scrollable wrap view for CLUe UI components.
class ClueInfiniteWrap<T> extends StatelessWidget {
  /// Creates a ClueInfiniteWrap.
  ///
  /// [totalCount] is the total number of items.
  /// [itemList] is the list of items to display.
  /// [itemBuilder] is the function to build each item widget.
  /// [endOfScrollCallBack] is the callback function called at the end of scrolling.
  /// [itemWidth] is the width of each item.
  /// [itemHeight] is the height of each item.
  /// [spacing] is the horizontal spacing between items.
  /// [runSpacing] is the vertical spacing between items.
  /// [paddingSize] is the padding around the wrap view.
  /// [noMoreWidget] is the widget displayed when there are no more items to load.
  const ClueInfiniteWrap({
    super.key,
    required this.totalCount,
    required this.itemList,
    required this.itemBuilder,
    required this.endOfScrollCallBack,
    this.itemWidth = 236,
    this.itemHeight = 236,
    this.spacing = 8,
    this.runSpacing = 8,
    this.paddingSize = 16,
    required this.noMoreWidget,
  });

  /// The total number of items.
  final int totalCount;

  /// The list of items to display.
  final List<T> itemList;

  /// The function to build each item widget.
  final Widget Function(T data) itemBuilder;

  /// The callback function called at the end of scrolling.
  final VoidCallback endOfScrollCallBack;

  /// The width of each item.
  final double itemWidth;

  /// The height of each item.
  final double itemHeight;

  /// The horizontal spacing between items.
  final double spacing;

  /// The vertical spacing between items.
  final double runSpacing;

  /// The padding around the wrap view.
  final double paddingSize;

  /// The widget displayed when there are no more items to load.
  final Widget noMoreWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. Set up the list of widgets to display.
        var layoutWidth = constraints.maxWidth - paddingSize * 2;
        var rowItemCount = ((layoutWidth - itemWidth) / (itemWidth + spacing) + 1).toInt();
        List<Widget> listWidget = getRowListWidget(rowItemCount);

        // 2. Display the list.
        return ListView.separated(
          padding: EdgeInsets.all(paddingSize),
          itemCount: listWidget.length + 1,
          itemBuilder: (context, index) {
            if (index < listWidget.length) {
              var item = listWidget[index];
              return item;
            }

            if (itemList.length >= totalCount) {
              return Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                    child: noMoreWidget,
                  ),
                ),
              );
            } else {
              endOfScrollCallBack();
              return const SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(
                  child: ClueCircularLoading(),
                ),
              );
            }
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: runSpacing);
          },
        );
      },
    );
  }

  /// Returns the list of item widgets arranged in rows.
  List<Widget> getRowListWidget(int rowItemCount) {
    List<Widget> result = [];

    var itemCount = (itemList.length - 1) ~/ rowItemCount;
    for (var i = 0; i <= itemCount; i++) {
      Row rowData = Row(
        children: List.generate(
          rowItemCount,
          (index) {
            int curruentIndex = i * rowItemCount + index;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index != 0) ...[
                  SizedBox(width: spacing),
                ],
                if (curruentIndex < itemList.length) ...[
                  SizedBox(
                    width: itemWidth,
                    height: itemHeight,
                    child: itemBuilder(
                      itemList[i * rowItemCount + index],
                    ),
                  ),
                ] else ...[
                  SizedBox(
                    width: itemWidth,
                    height: itemHeight,
                  ),
                ],
              ],
            );
          },
        ),
      );
      result.add(rowData);
    }

    return result;
  }
}
