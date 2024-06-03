import 'package:clue_ui_component/clue_navigator_key.dart';
import 'package:clue_ui_component/clue_ui_component.dart';
import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

final GlobalKey<AnimatedListState> _animatedKey = GlobalKey();
List<Widget> _overlayList = [];

class ClueOverlayEntry extends StatelessWidget {
  const ClueOverlayEntry({super.key});

  @override
  Widget build(BuildContext context) {
    // 인터페이스 영역 제거
    return IgnorePointer(
      child: Container(
        padding: const EdgeInsets.only(top: 60), // 앱 바 높이만큼 여백 추가
        alignment: Alignment.topCenter, // 시작 포인트 지정(세로 영역)
        child: AnimatedList(
          shrinkWrap: true, // 전체 영역 제거(자식크기 영역)
          key: _animatedKey,
          initialItemCount: _overlayList.length,
          itemBuilder: (context, index, animation) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                _AnimatedListItem(
                  item: _overlayList[index],
                  animation: animation,
                  index: index,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static OverlayEntry overlayEntry = OverlayEntry(builder: (context) => const ClueOverlayEntry());

  /// 팝업 보여주기
  static void showPopup(Widget title, {Duration duration = const Duration(seconds: 2)}) async {
    if (overlayEntry.mounted == false) {
      try {
        Navigator.of(clueNavigatorKey.currentContext!).overlay!.insert(overlayEntry);
        await Future.delayed(const Duration(milliseconds: 50));
      } catch (e) {
        // already overlayEntry
      }
    }
    await Future.delayed(const Duration(milliseconds: 50));
    addItem(title);
    await Future.delayed(duration);
    removeItem(0);
  }

  /// 오버레이 항목 추가
  static void addItem(Widget title) {
    int i = _overlayList.isNotEmpty ? _overlayList.length : 0;
    _overlayList.insert(i, title);

    /// animatedKey 할당한 AnimatedList 에서 i번째에 해당하는 순서에 아이템을 추가 한다.
    _animatedKey.currentState!.insertItem(i);
  }

  /// 오버레이 항목 제거
  static void removeItem(int index) {
    Widget removeItem = _overlayList.removeAt(index);

    /// animatedKey 할당한 AnimatedList 에서
    /// 첫번째 파라미터인 index 순서에 두번째 파라미터 builder 에 해당하는 아이템을 지운다.
    _animatedKey.currentState!.removeItem(index, (context, animation) {
      return _AnimatedListItem(item: removeItem, animation: animation, index: index);
    });
  }
}

/// Animated Item
class _AnimatedListItem extends StatelessWidget {
  const _AnimatedListItem({
    Key? key,
    required this.item,
    required this.animation,
    required this.index,
  }) : super(key: key);

  final Widget item;
  final Animation<double> animation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        alignment: Alignment.topCenter, // 시작 포인트 지정(가로)
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: MyColors.xFF000000,
            borderRadius: BorderRadius.circular(50),
          ),
          child: item,
        ),
      ),
    );
  }
}

class SuccessToast extends StatelessWidget {
  const SuccessToast({Key? key, required this.text, this.fontfamily, this.circleBlueCheck}) : super(key: key);
  final SvgPicture? circleBlueCheck;
  final String text;
  final String? fontfamily;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        circleBlueCheck ?? MyImages.circleBlueCheck,
        const SizedBox(width: 8),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 14,
            color: MyColors.xFFFFFFFF,
            fontFamily: fontfamily ?? "NotoSansKR",
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class ErrorToast extends StatelessWidget {
  ErrorToast({Key? key, required this.text, this.fontfamily, this.circleRedNotice}) : super(key: key);

  final String text;
  final String? fontfamily;
  SvgPicture? circleRedNotice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        circleRedNotice ?? MyImages.circleRedNotice,
        const SizedBox(width: 8),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 14,
            color: MyColors.xFFFFFFFF,
            fontFamily: fontfamily ?? "NotoSansKR",
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
