import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueErrorText extends StatelessWidget {
  const ClueErrorText({
    super.key,
    required this.errorText,
    required this.onRefresh,
  });

  final String errorText;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClueText(
          errorText,
          textAlign: TextAlign.center,
          style: MyTextStyle.size16.h1_5,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: onRefresh,
          ),
        )
      ],
    );
  }
}
