import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

enum MenuAlign {
  left(Alignment.bottomRight, Alignment.topRight, Alignment.topRight),
  center(Alignment.bottomCenter, Alignment.topCenter, Alignment.topCenter),
  right(Alignment.bottomLeft, Alignment.topLeft, Alignment.topLeft);

  final Alignment targetAnchorAlignment;
  final Alignment followerAnchorAlignment;
  final Alignment menuAlignment;

  const MenuAlign(
    this.targetAnchorAlignment,
    this.followerAnchorAlignment,
    this.menuAlignment,
  );
}

class CluePopupMenuButton<T> extends StatefulWidget {
  const CluePopupMenuButton({
    super.key,
    this.itemList = const [],
    this.menuWidth = 130,
    this.menuAlign = MenuAlign.center,
    required this.child,
    required this.onTap,
  });

  final initIndex = 0;
  final List<Widget> itemList;
  final double menuWidth;
  final MenuAlign menuAlign;
  final Widget child;
  final void Function(int index) onTap;

  @override
  State<StatefulWidget> createState() => CluePopupMenuButtonState<T>();
}

class CluePopupMenuButtonState<T> extends State<CluePopupMenuButton<T>> {
  // 기본 데이터
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          child: InkWell(
            onTap: () {
              if (widget.itemList.isNotEmpty) {
                onTap();
              }
            },
            child: Container(
              color: Colors.white,
              width: 40,
              height: 40,
              child: Center(child: widget.child),
            ),
          ),
          overlayChildBuilder: (BuildContext context) {
            return InkResponse(
              onTap: () {
                onTap();
              },
              mouseCursor: MouseCursor.defer,
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: widget.menuAlign.targetAnchorAlignment,
                followerAnchor: widget.menuAlign.followerAnchorAlignment,
                child: Align(
                  alignment: widget.menuAlign.menuAlignment,
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: menuWidget(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void onTap() {
    _tooltipController.toggle();
  }

  Widget menuWidget() {
    return Material(
      child: Container(
        width: widget.menuWidth,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.itemList.length,
          itemBuilder: (context, index) {
            var item = widget.itemList[index];
            return menuItem(index, item);
          },
          separatorBuilder: (context, index) {
            return const ClueDivider();
          },
        ),
      ),
    );
  }

  Widget menuItem(int index, Widget child) {
    return InkWell(
      onTap: () {
        _tooltipController.hide();
        widget.onTap(index);
      },
      child: Ink(
        color: MyColors.xFFFFFFFF,
        child: Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}
