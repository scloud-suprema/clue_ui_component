import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:flutter/material.dart';

/// A widget that provides an infinitely scrollable list view for CLUe UI components.
class ClueInfiniteListView<T> extends StatelessWidget {
  /// Creates a ClueInfiniteListView.
  ///
  /// [totalCount] is the total number of items.
  /// [itemList] is the list of items to display.
  /// [itemBuilder] is the function to build each item widget.
  /// [endOfScrollCallBack] is the callback function called at the end of scrolling.
  /// [itemHeight] is the height of each item.
  /// [runSpacing] is the vertical spacing between items.
  /// [padding] is the padding around the list view.
  /// [noMoreWidget] is the widget displayed when there are no more items to load.
  const ClueInfiniteListView({
    super.key,
    required this.totalCount,
    required this.itemList,
    required this.itemBuilder,
    required this.endOfScrollCallBack,
    this.itemHeight = 40,
    this.runSpacing = 16,
    this.padding = const EdgeInsets.all(16),
    required this.noMoreWidget,
  });

  /// The total number of items.
  final int totalCount;

  /// The list of items to display.
  final List<T>? itemList;

  /// The function to build each item widget.
  final Widget Function(T data) itemBuilder;

  /// The callback function called at the end of scrolling.
  final VoidCallback endOfScrollCallBack;

  /// The height of each item.
  final double itemHeight;

  /// The vertical spacing between items.
  final double runSpacing;

  /// The padding around the list view.
  final EdgeInsets padding;

  /// The widget displayed when there are no more items to load.
  final Widget noMoreWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. Set up the list of widgets to display.
        List<Widget> listWidget = getRowListWidget();

        // 2. Display the list.
        return ListView.separated(
          padding: padding,
          itemCount: listWidget.length + 1,
          itemBuilder: (context, index) {
            if (index < listWidget.length) {
              var item = listWidget[index];
              return item;
            }

            if (index >= totalCount) {
              return SizedBox(
                width: double.infinity,
                height: itemHeight,
                child: Center(
                  child: noMoreWidget,
                ),
              );
            } else {
              endOfScrollCallBack();
              return SizedBox(
                width: double.infinity,
                height: itemHeight,
                child: const Center(
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

  /// Returns the list of item widgets.
  List<Widget> getRowListWidget() {
    List<Widget> result = [];

    for (var element in itemList!) {
      result.add(itemBuilder(element));
    }

    return result;
  }
}
