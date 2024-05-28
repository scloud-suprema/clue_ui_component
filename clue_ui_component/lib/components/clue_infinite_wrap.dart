import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueInfiniteWrap<T> extends StatelessWidget {
  const ClueInfiniteWrap(
      {super.key,
      required this.totalCount,
      required this.itemList,
      required this.itemBuilder,
      required this.endOfScrollCallBack,
      this.itemWidth = 236,
      this.itemHeight = 236,
      this.spacing = 8,
      this.runSpacing = 8,
      this.paddingSize = 16,
      required this.noMoreWidget});

  /// 총 아이템 개수
  final int totalCount;

  /// 아이템 목록
  final List<T> itemList;

  /// 아이템 위젯 반환 빌더
  final Widget Function(T data) itemBuilder;

  /// 추가 조회 콜백
  final VoidCallback endOfScrollCallBack;

  /// 아이템 가로 길이
  final double itemWidth;

  /// 아이템 세로 길이
  final double itemHeight;

  /// 아이템간 가로 여백
  final double spacing;

  /// 아이템간 세로 여백
  final double runSpacing;

  /// 전체 패딩 사이즈
  final double paddingSize;
  final Widget noMoreWidget;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1.보여줄 위젯 목록 세팅
        var layoutWidth = constraints.maxWidth - paddingSize * 2;
        var rowItemCount = ((layoutWidth - itemWidth) / (itemWidth + spacing) + 1).toInt();
        List<Widget> listWidget = getRowListWidget(rowItemCount);

        // 2.목록을 보여준다.
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
