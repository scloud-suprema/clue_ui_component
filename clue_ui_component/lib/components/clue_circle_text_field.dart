import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A circular text field widget for CLUe UI components.
class ClueCircleTextField extends StatefulWidget {
  /// Creates a ClueCircleTextField.
  ///
  /// [enabled] determines if the text field is enabled.
  /// [initialValue] is the initial text value of the text field.
  /// [onChanged] is the callback function when the text changes.
  /// [onEditingComplete] is the callback function when editing is complete.
  /// [hintText] is the hint text displayed inside the text field.
  /// [errorText] is the error message displayed below the text field.
  /// [errorMaxLines] is the maximum number of lines for the error text.
  /// [maxLength] is the maximum length of the input text.
  /// [suffixIcon] is the widget displayed at the end of the text field.
  /// [inputFormatters] is a list of text input formatters.
  /// [obscureText] determines if the text should be obscured.
  /// [showCounterText] determines if the counter text should be shown.
  /// [useErrorText] determines if the error text should be used.
  const ClueCircleTextField({
    super.key,
    this.enabled = true,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.hintText,
    this.errorText,
    this.errorMaxLines = 1,
    this.maxLength = 30,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    this.showCounterText = false,
    this.useErrorText = false,
  });

  /// Determines if the text field is enabled.
  final bool enabled;

  /// The initial text value of the text field.
  final String? initialValue;

  /// The callback function when the text changes.
  final void Function(String value)? onChanged;

  /// The callback function when editing is complete.
  final void Function()? onEditingComplete;

  /// The hint text displayed inside the text field.
  final String? hintText;

  /// Determines if the error text should be used.
  final bool useErrorText;

  /// The error message displayed below the text field.
  final String? errorText;

  /// The maximum number of lines for the error text.
  final int errorMaxLines;

  /// The maximum length of the input text.
  final int? maxLength;

  /// The widget displayed at the end of the text field.
  final Widget? suffixIcon;

  /// A list of text input formatters.
  final List<TextInputFormatter>? inputFormatters;

  /// Determines if the text should be obscured.
  final bool obscureText;

  /// Determines if the counter text should be shown.
  final bool showCounterText;

  @override
  State<ClueCircleTextField> createState() => _ClueCircleTextFieldState();
}

/// State for [ClueCircleTextField].
class _ClueCircleTextFieldState extends State<ClueCircleTextField> {
  /// The current text value.
  late String text;

  /// Determines if the text should be obscured.
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    text = widget.initialValue ?? "";
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 1,
                  color: widget.errorText == null ? MyColors.xFFE2E8F0 : MyColors.xFFFF9292,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(width: 1, color: MyColors.xFFF7F7F7),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 1,
                  color: widget.errorText == null ? MyColors.xFF6682FF : MyColors.xFFFF5252,
                ),
              ),
            ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            enabled: widget.enabled,
            initialValue: widget.initialValue,
            onChanged: (value) {
              setState(() {
                text = value;
              });

              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            onEditingComplete: widget.onEditingComplete,
            decoration: InputDecoration(
                filled: !widget.enabled,
                hintText: widget.hintText,
                counterText: '',
                suffixIcon: () {
                  if (widget.suffixIcon != null) {
                    return widget.suffixIcon;
                  }

                  if (widget.showCounterText) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${text.length}/${widget.maxLength}',
                          style: MyTextStyle.size12.xFFA3A3A3,
                        ),
                      ],
                    );
                  }

                  if (widget.obscureText) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    );
                  }
                }()),
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            obscureText: obscureText,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
          if (widget.useErrorText) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 17.0 * widget.errorMaxLines,
                child: Text(
                  widget.errorText ?? '',
                  style: Theme.of(context).inputDecorationTheme.errorStyle,
                  maxLines: widget.errorMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ] else if (widget.errorText != null) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.errorText ?? '',
                style: Theme.of(context).inputDecorationTheme.errorStyle,
                maxLines: widget.errorMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
