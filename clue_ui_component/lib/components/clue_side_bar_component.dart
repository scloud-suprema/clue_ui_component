import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

/// A sidebar component for CLUe UI that provides navigation and information.
class ClueSideBarComponent extends StatefulWidget {
  /// Creates a ClueSideBarComponent.
  ///
  /// [title] is the title displayed at the top of the sidebar.
  /// [titleOnTap] is the callback function when the title is tapped.
  /// [logo] is the logo widget displayed below the title.
  /// [logoTitle] is the title displayed below the logo.
  /// [infoList] is the list of information items to display.
  /// [itemList] is the list of navigation items to display.
  /// [child] is the main content widget displayed next to the sidebar.
  /// [leftArrow] is the widget displayed when the sidebar is expanded.
  /// [rightArrow] is the widget displayed when the sidebar is collapsed.
  const ClueSideBarComponent({
    super.key,
    required this.title,
    required this.titleOnTap,
    required this.logo,
    required this.logoTitle,
    required this.infoList,
    required this.itemList,
    required this.child,
    this.leftArrow,
    this.rightArrow,
  });

  /// The title displayed at the top of the sidebar.
  final String title;

  /// The callback function when the title is tapped.
  final void Function()? titleOnTap;

  /// The logo widget displayed below the title.
  final Widget logo;

  /// The title displayed below the logo.
  final String logoTitle;

  /// The list of information items to display.
  final List<ClueSideBarInfo> infoList;

  /// The list of navigation items to display.
  final List<ClueSideBarItem> itemList;

  /// The main content widget displayed next to the sidebar.
  final Widget child;

  /// The widget displayed when the sidebar is expanded.
  final Widget? leftArrow;

  /// The widget displayed when the sidebar is collapsed.
  final Widget? rightArrow;

  @override
  State<ClueSideBarComponent> createState() => _ClueSideBarComponentState();
}

class _ClueSideBarComponentState extends State<ClueSideBarComponent> {
  bool useSideTapExpand = true;
  bool animationFinished = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.xFFEFEFEF,
      body: Row(
        children: [
          AnimatedContainer(
            width: useSideTapExpand ? 250 : 50,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            onEnd: () {
              setState(() {
                animationFinished = true;
              });
            },
            child: Ink(
              color: MyColors.xFFFFFFFF,
              child: Column(
                children: [
                  if (useSideTapExpand && animationFinished) ...[
                    Column(
                      children: [
                        Container(
                          height: 76,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: widget.titleOnTap,
                            child: Text(
                              widget.title,
                              style: MyTextStyle.size16.w500.xFF000000,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const ClueDivider(),
                        const Gap(16),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                              borderRadius: BorderRadius.circular(50),
                              color: MyColors.xFFFF5252,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: widget.logo,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Text(
                          widget.logoTitle,
                          style: MyTextStyle.size14.w500.xFF000000,
                        ),
                        const Gap(16),
                        const ClueDivider(),
                        const Gap(8),
                        ...widget.infoList,
                        const Gap(8),
                        const ClueDivider(),
                        ...widget.itemList,
                      ],
                    ),
                  ] else ...[
                    ...widget.itemList.map((e) {
                      return InkWell(
                        onTap: e.onPressed,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          color: e.color,
                          child: Center(
                            child: e.icon,
                          ),
                        ),
                      );
                    })
                  ],
                  const Spacer(),
                  const ClueDivider(),
                  Container(
                    height: 76,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      key: const Key("Icon"),
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {
                          useSideTapExpand = !useSideTapExpand;
                          animationFinished = false;
                        });
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.xFFE2E8F0),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: useSideTapExpand ? (widget.leftArrow ?? MyImages.leftArrow) : (widget.rightArrow ?? MyImages.rightArrow),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

/// A widget for displaying information items in the CLUe sidebar.
class ClueSideBarInfo extends StatelessWidget {
  /// Creates a ClueSideBarInfo.
  ///
  /// [title] is the title of the information item.
  /// [subTitle] is the subtitle of the information item.
  const ClueSideBarInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });

  /// The title of the information item.
  final String title;

  /// The subtitle of the information item.
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: MyTextStyle.size12.w500.xFF9CA3AF,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            subTitle,
            style: MyTextStyle.size12.w500.xFF000000,
          ),
        ],
      ),
    );
  }
}

/// A widget for displaying navigation items in the CLUe sidebar.
class ClueSideBarItem extends StatelessWidget {
  /// Creates a ClueSideBarItem.
  ///
  /// [icon] is the icon of the navigation item.
  /// [title] is the title of the navigation item.
  /// [style] is the text style of the title.
  /// [onPressed] is the callback function when the item is pressed.
  /// [color] is the background color of the item.
  const ClueSideBarItem({
    super.key,
    required this.icon,
    required this.title,
    this.style,
    this.onPressed,
    this.color,
  });

  /// The icon of the navigation item.
  final SvgPicture icon;

  /// The title of the navigation item.
  final String title;

  /// The text style of the title.
  final TextStyle? style;

  /// The callback function when the item is pressed.
  final Function()? onPressed;

  /// The background color of the item.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        color: color ?? MyColors.xFFFFFFFF,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              icon,
              const Gap(16),
              Text(
                title,
                style: style ?? MyTextStyle.size14.w500.xFF000000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
