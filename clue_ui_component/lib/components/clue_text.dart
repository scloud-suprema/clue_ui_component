import 'package:clue_ui_component/themes/themes.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A text widget for CLUe UI components that supports rich text formatting.
class ClueText extends StatelessWidget {
  /// Creates a ClueText.
  ///
  /// [text] is the main text to display.
  /// [isRequired] determines if an asterisk should be appended to the text.
  /// [style] is the text style of the main text.
  /// [textAlign] specifies the alignment of the text.
  /// [targetList] is a list of [TargetModel]s for rich text patterns.
  /// [maxLines] specifies the maximum number of lines for the text.
  const ClueText(
    this.text, {
    this.isRequired = false,
    super.key,
    this.style = textStyle,
    this.textAlign = TextAlign.start,
    this.targetList = const [],
    this.maxLines,
  });

  /// The default text style.
  static const textStyle = TextStyle(fontSize: 14, fontWeight: MyFontWeight.w500);

  /// The main text to display.
  final String text;

  /// Determines if an asterisk should be appended to the text.
  final bool isRequired;

  /// The text style of the main text.
  final TextStyle style;

  /// Specifies the alignment of the text.
  final TextAlign textAlign;

  /// A list of [TargetModel]s for rich text patterns.
  final List<TargetModel> targetList;

  /// Specifies the maximum number of lines for the text.
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

/// Enum for specifying match options for rich text patterns.
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

/// Model class for specifying rich text patterns.
class TargetModel {
  /// Creates a TargetModel.
  ///
  /// [text] is the target string to match.
  /// [matchOptions] specifies the match options for the target string.
  /// [style] is the text style to apply to the target string.
  /// [onTap] is the callback function when the target string is tapped.
  TargetModel({
    required this.text,
    this.matchOptions = const [],
    required this.style,
    this.onTap,
  });

  /// The target string to match.
  final String text;

  /// Specifies the match options for the target string.
  final List<MatchOption> matchOptions;

  /// The text style to apply to the target string.
  final TextStyle style;

  /// The callback function when the target string is tapped.
  final void Function()? onTap;
}
