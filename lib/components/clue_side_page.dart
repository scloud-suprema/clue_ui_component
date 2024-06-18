import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

/// A side page layout for CLUe UI components.
class ClueSidePage extends StatelessWidget {
  /// Creates a ClueSidePage.
  ///
  /// [menuTitle] is the title of the menu.
  /// [headerLeft] is the widget displayed on the left side of the header.
  /// [headerCenter] is the widget displayed in the center of the header.
  /// [headerRight] is the widget displayed on the right side of the header.
  /// [body] is the main content of the page.
  /// [bottomLeft] is the widget displayed on the left side of the footer.
  /// [bottomCenter] is the widget displayed in the center of the footer.
  /// [bottomRight] is the widget displayed on the right side of the footer.
  /// [showHeaderDivider] determines whether to show the divider below the header.
  /// [showBottomDivider] determines whether to show the divider above the footer.
  const ClueSidePage({
    super.key,
    this.menuTitle,
    this.headerLeft,
    this.headerCenter,
    this.headerRight,
    required this.body,
    this.bottomLeft,
    this.bottomCenter,
    this.bottomRight,
    this.showHeaderDivider = true,
    this.showBottomDivider = true,
  });

  /// The title of the menu.
  final String? menuTitle;

  /// The widget displayed on the left side of the header.
  final Widget? headerLeft;

  /// The widget displayed in the center of the header.
  final Widget? headerCenter;

  /// The widget displayed on the right side of the header.
  final Widget? headerRight;

  /// The main content of the page.
  final Widget body;

  /// The widget displayed on the left side of the footer.
  final Widget? bottomLeft;

  /// The widget displayed in the center of the footer.
  final Widget? bottomCenter;

  /// The widget displayed on the right side of the footer.
  final Widget? bottomRight;

  /// Determines whether to show the divider below the header.
  final bool showHeaderDivider;

  /// Determines whether to show the divider above the footer.
  final bool showBottomDivider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.xFFFFFFFF,
      body: Column(
        children: [
          if (headerLeft != null || menuTitle != null) ...[
            Container(
              color: Colors.white,
              height: 60,
              child: Row(
                children: [
                  if (menuTitle != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: ClueText(
                          menuTitle!,
                          style: MyTextStyle.size16.w700,
                        ),
                      ),
                    ),
                  ],
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          headerLeft ?? const SizedBox.shrink(),
                          const Spacer(),
                          headerCenter ?? const SizedBox.shrink(),
                          const Spacer(),
                          headerRight ?? const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showHeaderDivider) ...[
              const ClueDivider(),
            ],
          ],
          Expanded(
            child: body,
          ),
          if (bottomCenter != null) ...[
            if (showBottomDivider) ...[
              const ClueDivider(),
            ],
            Container(
              color: Colors.white,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  bottomLeft ?? const SizedBox.shrink(),
                  const Spacer(),
                  bottomCenter ?? const SizedBox.shrink(),
                  const Spacer(),
                  bottomRight ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
