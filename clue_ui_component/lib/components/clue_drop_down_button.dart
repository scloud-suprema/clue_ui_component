import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A dropdown button widget for CLUe UI components.
class ClueDropDownButton<T, E> extends StatefulWidget {
  /// Creates a ClueDropDownButton.
  ///
  /// [enabled] determines if the dropdown is enabled.
  /// [selectedKey] is the initially selected key.
  /// [blockKeyList] is the list of keys to be disabled.
  /// [itemMap] is the map of keys and values to be displayed.
  /// [width] specifies the width of the dropdown button.
  /// [borderColor] specifies the border color of the dropdown button.
  /// [onChanged] is the callback function when the selected key changes.
  /// [noneText] is the text to display when no item is selected.
  /// [arrowImage] is the arrow image to display in the dropdown button.
  const ClueDropDownButton({
    super.key,
    this.enabled = true,
    this.selectedKey,
    this.blockKeyList = const [],
    required this.itemMap,
    this.width,
    this.borderColor,
    required this.onChanged,
    this.noneText,
    this.arrowImage,
  });

  /// Determines if the dropdown is enabled.
  final bool enabled;

  /// The initially selected key.
  final T? selectedKey;

  /// The list of keys to be disabled.
  final List<T> blockKeyList;

  /// The map of keys and values to be displayed.
  final Map<T, E> itemMap;

  /// The width of the dropdown button.
  final double? width;

  /// The border color of the dropdown button.
  final Color? borderColor;

  /// The callback function when the selected key changes.
  final void Function(T key) onChanged;

  /// The text to display when no item is selected.
  final String? noneText;

  /// The arrow image to display in the dropdown button.
  final SvgPicture? arrowImage;

  @override
  State<StatefulWidget> createState() => ClueDropDownButtonState<T, E>();
}

/// State for [ClueDropDownButton].
class ClueDropDownButtonState<T, E> extends State<ClueDropDownButton<T, E>> {
  /// Controller for the tooltip overlay.
  final OverlayPortalController _tooltipController = OverlayPortalController();

  /// Layer link for the dropdown menu.
  final _link = LayerLink();

  /// The width of the dropdown button.
  late double _buttonWidth;

  /// The currently selected data.
  T? selectedData;

  @override
  Widget build(BuildContext context) {
    if (selectedData == null) {
      if (widget.itemMap.isEmpty) {
        selectedData = null;
      } else {
        selectedData = widget.selectedKey ?? widget.itemMap.keys.first;
      }
    }
    return Material(
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          child: InkWell(
            onTap: widget.enabled
                ? () {
                    if (widget.itemMap.isNotEmpty) {
                      onTap();
                    }
                  }
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: SizedBox(
              width: widget.width,
              child: Ink(
                color: MyColors.xFFFFFFFF,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: widget.borderColor ?? MyColors.xFFE2E8F0),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: widget.enabled ? null : MyColors.xFFF7F7F7,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      ClueText(
                        selectedData == null
                            ? widget.noneText ?? "none"
                            : widget.itemMap[selectedData]?.toString() ?? widget.itemMap.values.first.toString(),
                        style: MyTextStyle.size14.w500.xFF000000,
                      ),
                      if (widget.width == null) ...[
                        const SizedBox(width: 16)
                      ] else ...[
                        const Spacer(),
                      ],
                      widget.arrowImage ?? MyImages.grayDownArrow,
                    ],
                  ),
                ),
              ),
            ),
          ),
          overlayChildBuilder: (BuildContext context) {
            return InkWell(
              onTap: () {
                onTap();
              },
              mouseCursor: MouseCursor.defer,
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
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

  /// Toggles the dropdown menu visibility.
  void onTap() {
    _buttonWidth = context.size!.width;
    _tooltipController.toggle();
  }

  /// Builds the dropdown menu widget.
  Widget menuWidget() {
    var entriesList = widget.itemMap.entries.toList();
    return Material(
      child: Container(
        width: _buttonWidth,
        constraints: const BoxConstraints(maxHeight: 160 + 2),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: entriesList.length,
          itemBuilder: (context, index) {
            var e = entriesList[index];
            return menuItem(e.key, e.value);
          },
          separatorBuilder: (context, index) {
            return const ClueDivider();
          },
        ),
      ),
    );
  }

  /// Builds each item in the dropdown menu.
  Widget menuItem(T key, E value) {
    if (widget.blockKeyList.contains(key)) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          color: MyColors.xFFFFFFFF,
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: ClueText(
            value.toString(),
            style: MyTextStyle.size14.w500.xFFA3A3A3,
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            selectedData = key;
          });
          _tooltipController.hide();
          widget.onChanged(key);
        },
        child: Ink(
          color: MyColors.xFFFFFFFF,
          child: Container(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: ClueText(
              value.toString(),
              style: key == selectedData ? MyTextStyle.size14.w500.xFF8299FF : MyTextStyle.size14.w500.xFF000000,
            ),
          ),
        ),
      );
    }
  }
}
