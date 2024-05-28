import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueSidePage extends StatelessWidget {
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

  final String? menuTitle;
  final Widget? headerLeft;
  final Widget? headerCenter;
  final Widget? headerRight;
  final Widget body;
  final Widget? bottomLeft;
  final Widget? bottomCenter;
  final Widget? bottomRight;
  final bool showHeaderDivider;
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
