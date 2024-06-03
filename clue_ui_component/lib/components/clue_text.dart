import 'package:clue_ui_component/themes/themes.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClueText extends StatelessWidget {
  const ClueText(
    this.text, {
    this.isRequired = false,
    super.key,
    this.style = textStyle,
    this.textAlign = TextAlign.start,
    this.targetList = const [],
    this.maxLines,
  });

  static const textStyle = TextStyle(fontSize: 14, fontWeight: MyFontWeight.w500);

  final String text;
  final bool isRequired;
  final TextStyle style;
  final TextAlign textAlign;
  final List<TargetModel> targetList;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return EasyRichText(
      '$text${isRequired ? ' *' : ''}',
      defaultStyle: style,
      textAlign: textAlign,
      maxLines: maxLines,
      patternList: [
        if (isRequired) ...[
          EasyRichTextPattern(
            targetString: '*',
            hasSpecialCharacters: true,
            style: style.copyWith(color: MyColors.xFFFF5252),
          ),
        ],
        if (targetList.isNotEmpty) ...[
          ...targetList.map((e) {
            return EasyRichTextPattern(
              targetString: e.text,
              matchOption: e.matchOptions.isEmpty ? MatchOption.all.value : e.matchOptions.map((e) => e.value).toList(),
              style: e.style,
              recognizer: () {
                if (e.onTap == null) {
                  return null;
                } else {
                  return TapGestureRecognizer()..onTap = e.onTap;
                }
              }(),
              hasSpecialCharacters: true,
            );
          }),
        ],
      ],
    );
  }
}

enum MatchOption {
  all('all'),
  zero(0),
  first(1),
  second(2),
  third(3),
  // ...
  last('last');

  final dynamic value;

  const MatchOption(this.value);
}

class TargetModel {
  final String text;
  final List<MatchOption> matchOptions;
  final TextStyle style;
  final void Function()? onTap;

  TargetModel({
    required this.text,
    this.matchOptions = const [],
    required this.style,
    this.onTap,
  });
}
