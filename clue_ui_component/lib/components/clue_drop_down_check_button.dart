import 'package:clue_ui_component/components/clue_circle_counter.dart';
import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClueDropDownCheckButton<T, E> extends StatefulWidget {
  SvgPicture? checkboxOn;
  SvgPicture? checkboxOff;
  SvgPicture? arrowImage;

  ClueDropDownCheckButton(
      {super.key,
      this.title,
      required this.allSelectText,
      required this.notSelectText,
      this.emptyIsAll = true,
      this.selectedKeyList = const [],
      this.blockKeyList = const [],
      this.itemMap = const {},
      this.width,
      required this.onChanged,
      this.checkboxOn,
      this.checkboxOff,
      this.arrowImage});

  final String? title;
  final String allSelectText;
  final String notSelectText;
  final bool emptyIsAll;
  final List<T> selectedKeyList;
  final List<T> blockKeyList;
  final Map<T, E> itemMap;
  final double? width;
  final void Function(List<T> selectedKeyList, List<E> selectedValueList) onChanged;

  @override
  State<StatefulWidget> createState() => ClueDropDownCheckListState<T, E>();
}

class ClueDropDownCheckListState<T, E> extends State<ClueDropDownCheckButton<T, E>> {
  // 기본 데이터
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  late double _buttonWidth;
  late List<T> selectedKeyList;

  bool get selectAll => widget.itemMap.length == selectedKeyList.length;
  bool get deselectAll => selectedKeyList.isEmpty;
  int get selectedItemCount => selectedKeyList.length;
  T get firstSelectKey => selectedKeyList.first;

  @override
  void initState() {
    super.initState();
    selectedKeyList = List<T>.of(widget.selectedKeyList);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          child: InkWell(
            onTap: () {
              if (widget.itemMap.isNotEmpty) {
                onTap();
              }
            },
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: SizedBox(
              width: widget.width,
              child: Ink(
                color: MyColors.xFFFFFFFF,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      if (widget.title != null) ...[
                        if (deselectAll) ...[
                          ClueText(
                            '${widget.title} : ${widget.allSelectText}',
                            style: MyTextStyle.size14.w500.xFF000000,
                          ),
                        ] else ...[
                          Row(
                            children: [
                              ClueText(
                                '${widget.title}',
                                style: MyTextStyle.size14.w500.xFF000000,
                              ),
                              if (selectedItemCount > 0) ...[
                                Row(
                                  children: [
                                    ClueText(
                                      ' + ',
                                      style: MyTextStyle.size14.w500.xFF000000,
                                    ),
                                    ClueCircleCounter(
                                      count: selectedItemCount,
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ] else ...[
                        if (deselectAll) ...[
                          ClueText(
                            widget.emptyIsAll ? widget.allSelectText ?? "" : widget.notSelectText ?? "",
                            style: MyTextStyle.size14.w500.xFF000000,
                          ),
                        ] else ...[
                          if (selectedItemCount == 1) ...[
                            // 1개
                            ClueText(
                              widget.itemMap[firstSelectKey]?.toString() ?? '',
                              style: MyTextStyle.size14.w500.xFF000000,
                            ),
                          ] else ...[
                            // 1개 초과
                            Row(
                              children: [
                                ClueText(
                                  '${widget.itemMap[firstSelectKey]?.toString() ?? ''} + ',
                                  style: MyTextStyle.size14.w500.xFF000000,
                                ),
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircleAvatar(
                                    backgroundColor: MyColors.xFF000000,
                                    child: Center(
                                      child: ClueText(
                                        selectedItemCount.toString(),
                                        style: MyTextStyle.size12.w500.xFFFFFFFF,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ],
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

  void onTap() {
    _buttonWidth = context.size!.width;
    _tooltipController.toggle();
  }

  Widget menuWidget() {
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
          itemCount: widget.itemMap.length,
          itemBuilder: (context, index) {
            T key = widget.itemMap.keys.toList()[index];
            E item = widget.itemMap[key] as E;

            return menuItem(key, item);
          },
          separatorBuilder: (context, index) {
            return const ClueDivider();
          },
        ),
      ),
    );
  }

  Widget menuItem(T key, E value) {
    bool isChecked = selectedKeyList.contains(key);
    if (widget.blockKeyList.contains(key)) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          color: MyColors.xFFFFFFFF,
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              isChecked ? widget.checkboxOn ?? MyImages.checkboxOn : widget.checkboxOff ?? MyImages.checkboxOff,
              const SizedBox(width: 8),
              ClueText(
                value.toString(),
                style: MyTextStyle.size14.w500.xFFA3A3A3,
              ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          if (isChecked) {
            setState(() {
              selectedKeyList.remove(key);
            });
          } else {
            setState(() {
              selectedKeyList.add(key);
            });
          }

          List<T> keyIndices = [];
          List<E> valueIndices = [];

          for (var key in selectedKeyList) {
            keyIndices.add(key);
            valueIndices.add(widget.itemMap[key] as E);
          }

          widget.onChanged(keyIndices, valueIndices);
        },
        child: Ink(
          color: MyColors.xFFFFFFFF,
          child: Container(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                isChecked ? widget.checkboxOn ?? MyImages.checkboxOn : widget.checkboxOff ?? MyImages.checkboxOff,
                const SizedBox(width: 8),
                ClueText(
                  value.toString(),
                  style: isChecked ? MyTextStyle.size14.w700.xFF8299FF : MyTextStyle.size14.w500.xFF000000,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
