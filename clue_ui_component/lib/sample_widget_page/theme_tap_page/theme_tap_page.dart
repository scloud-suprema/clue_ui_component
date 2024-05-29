import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/sample_widget_page/sample_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../themes/themes.dart';

class ThemeTapPage extends StatelessWidget {
  const ThemeTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black12,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClueText('Color', style: MyTextStyle.size20.w700),
            const Gap(8),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ColorWidget(color: MyColors.xFF000000, code: 'MyColors.xFF000000'),
                ColorWidget(color: MyColors.xFF7D7D7D, code: 'MyColors.xFF7D7D7D'),
                ColorWidget(color: MyColors.xFF959595, code: 'MyColors.xFF959595'),
                ColorWidget(color: MyColors.xFFA3A3A3, code: 'MyColors.xFFA3A3A3'),
                ColorWidget(color: MyColors.xFF9CA3AF, code: 'MyColors.xFF9CA3AF'),
                ColorWidget(color: MyColors.xFFC9C9C9, code: 'MyColors.xFFC9C9C9'),
                ColorWidget(color: MyColors.xFFE2E8F0, code: 'MyColors.xFFE2E8F0'),
                ColorWidget(color: MyColors.xFFF1F5F9, code: 'MyColors.xFFF1F5F9'),
                ColorWidget(color: MyColors.xFFF7F7F7, code: 'MyColors.xFFF7F7F7'),
                ColorWidget(color: MyColors.xFFFDFDFD, code: 'MyColors.xFFFDFDFD'),
                ColorWidget(color: MyColors.xFFFFFFFF, code: 'MyColors.xFFFFFFFF'),
                ColorWidget(color: MyColors.xFF92A6FF, code: 'MyColors.xFF92A6FF'),
                ColorWidget(color: MyColors.xFF8299FF, code: 'MyColors.xFF8299FF'),
                ColorWidget(color: MyColors.xFF6682FF, code: 'MyColors.xFF6682FF'),
                ColorWidget(color: MyColors.xFF5CC691, code: 'MyColors.xFF5CC691'),
                ColorWidget(color: MyColors.xFFFF9292, code: 'MyColors.xFFFF9292'),
                ColorWidget(color: MyColors.xFFFF5252, code: 'MyColors.xFFFF5252'),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Font Size', style: MyTextStyle.size20.w700),
            const Gap(8),
            const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '플러터(size10)',
                  style: MyTextStyle.size10,
                ),
                ClueText(
                  '플러터(size12)',
                  style: MyTextStyle.size12,
                ),
                ClueText(
                  '플러터(size14)',
                  style: MyTextStyle.size14,
                ),
                ClueText(
                  '플러터(size16)',
                  style: MyTextStyle.size16,
                ),
                ClueText(
                  '플러터(size18)',
                  style: MyTextStyle.size18,
                ),
                ClueText(
                  '플러터(size20)',
                  style: MyTextStyle.size20,
                ),
                ClueText(
                  '플러터(size22)',
                  style: MyTextStyle.size22,
                ),
                ClueText(
                  '플러터(size24)',
                  style: MyTextStyle.size24,
                ),
                ClueText(
                  '플러터(size30)',
                  style: MyTextStyle.size30,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Font Family', style: MyTextStyle.size20.w700),
            const Gap(8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '한국어/English/日本語/2024(notoSansKR)',
                  style: MyTextStyle.size20.notoSansKR,
                ),
                ClueText(
                  '한국어/English/日本語/2024(roboto)',
                  style: MyTextStyle.size20.roboto,
                ),
                ClueText(
                  '한국어/English/日本語/2024(notoSansJP)',
                  style: MyTextStyle.size20.notoSansJP,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Font Weight', style: MyTextStyle.size20.w700),
            const Gap(8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '플러터(w300)',
                  style: MyTextStyle.size20.w300,
                ),
                ClueText(
                  '플러터(w500)',
                  style: MyTextStyle.size20.w500,
                ),
                ClueText(
                  '플러터(w700)',
                  style: MyTextStyle.size20.w700,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Font Height', style: MyTextStyle.size20.w700),
            const Gap(8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '플러터(h1_0)\n플러터(h1_0)',
                  style: MyTextStyle.size20.h1_0,
                ),
                ClueText(
                  '플러터(h1_5)\n플러터(h1_5)',
                  style: MyTextStyle.size20.h1_5,
                ),
                ClueText(
                  '플러터(h2_0)\n플러터(h2_0)',
                  style: MyTextStyle.size20.h2_0,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Underline', style: MyTextStyle.size20.w700),
            const Gap(8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '플러터(underLine)',
                  style: MyTextStyle.size20.xFF6682FF.underLine,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
            ClueText('Extension', style: MyTextStyle.size20.w700),
            const Gap(8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ClueText(
                  '방문자 초대',
                  style: MyTextStyle.size24.w700,
                ),
                ClueText(
                  '방문자 서비스 운영센터',
                  style: MyTextStyle.size20.w500,
                ),
                ClueText(
                  '공간 관리 사이트',
                  style: MyTextStyle.size14.w500.xFF92A6FF.underLine,
                ),
                ClueText(
                  '방문자 초대',
                  style: MyTextStyle.size14.w500,
                ),
                ClueText(
                  '금일 방문 일정',
                  style: MyTextStyle.size12.w700.xFF9CA3AF,
                ),
                ClueText(
                  '이용약관',
                  style: MyTextStyle.size12.w500.xFF7D7D7D,
                ),
              ],
            ),
            const Gap(16),
            const ClueDivider.white(),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    Key? key,
    required this.color,
    required this.code,
  }) : super(key: key);

  final Color color;
  final String code;

  @override
  Widget build(BuildContext context) {
    return CopyTooltipWidget(
      code: code,
      child: Container(
        width: 30,
        height: 30,
        color: color,
      ),
    );
  }
}
