import 'package:clue_ui_component/components/clue_circular_loading.dart';
import 'package:flutter/material.dart';

class ClueInfiniteListView<T> extends StatelessWidget {
  const ClueInfiniteListView(
      {super.key,
      required this.totalCount,
      required this.itemList,
      required this.itemBuilder,
      required this.endOfScrollCallBack,
      this.itemHeight = 40,
      this.runSpacing = 16,
      this.padding = const EdgeInsets.all(16),
      required this.noMoreWidget});

  /// 총 아이템 개수
  final int totalCount;

  /// 아이템 목록
  final List<T>? itemList;

  /// 아이템 위젯 반환 빌더
  final Widget Function(T data) itemBuilder;

  /// 추가 조회 콜백
  final VoidCallback endOfScrollCallBack;

  /// 아이템 세로 길이
  final double itemHeight;

  /// 아이템간 세로 여백
  final double runSpacing;

  /// 전체 패딩 사이즈
  final EdgeInsets padding;

  final Widget noMoreWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1.보여줄 위젯 목록 세팅
        List<Widget> listWidget = getRowListWidget();

        // 2.목록을 보여준다.
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

  List<Widget> getRowListWidget() {
    List<Widget> result = [];

    for (var element in itemList!) {
      result.add(itemBuilder(element));
    }

    return result;
  }
}
