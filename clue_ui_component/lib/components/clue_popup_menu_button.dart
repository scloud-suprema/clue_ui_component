import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// Enum for menu alignment options.
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

/// A popup menu button for CLUe UI components.
class CluePopupMenuButton<T> extends StatefulWidget {
  /// Creates a CluePopupMenuButton.
  ///
  /// [itemList] is the list of menu items to display.
  /// [menuWidth] is the width of the menu.
  /// [menuAlign] specifies the alignment of the menu.
  /// [child] is the widget to display as the button.
  /// [onTap] is the callback function called when a menu item is tapped.
  const CluePopupMenuButton({
    super.key,
    this.itemList = const [],
    this.menuWidth = 130,
    this.menuAlign = MenuAlign.center,
    required this.child,
    required this.onTap,
  });

  /// The initial index of the selected item.
  final initIndex = 0;

  /// The list of menu items to display.
  final List<Widget> itemList;

  /// The width of the menu.
  final double menuWidth;

  /// Specifies the alignment of the menu.
  final MenuAlign menuAlign;

  /// The widget to display as the button.
  final Widget child;

  /// The callback function called when a menu item is tapped.
  final void Function(int index) onTap;

  @override
  State<StatefulWidget> createState() => CluePopupMenuButtonState<T>();
}

/// State for [CluePopupMenuButton].
class CluePopupMenuButtonState<T> extends State<CluePopupMenuButton<T>> {
  /// Controller for the tooltip overlay.
  final OverlayPortalController _tooltipController = OverlayPortalController();

  /// Layer link for the popup menu.
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

  /// Toggles the popup menu visibility.
  void onTap() {
    _tooltipController.toggle();
  }

  /// Builds the popup menu widget.
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

  /// Builds each item in the popup menu.
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
