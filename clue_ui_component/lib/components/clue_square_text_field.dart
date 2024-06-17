import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A square text field widget for CLUe UI components.
class ClueSquareTextField extends StatefulWidget {
  /// Creates a ClueSquareTextField.
  ///
  /// [width] specifies the width of the text field.
  /// [autofocus] determines if the text field should autofocus.
  /// [initialValue] is the initial value of the text field.
  /// [controller] is the controller for the text field.
  /// [onChanged] is the callback function when the text changes.
  /// [onEditingComplete] is the callback function when editing is complete.
  /// [hintText] is the hint text displayed in the text field.
  /// [errorText] is the error text displayed below the text field.
  /// [errorMaxLines] specifies the maximum number of lines for the error text.
  /// [suffixIcon] is the icon displayed at the end of the text field.
  /// [inputFormatters] specifies the input formatters for the text field.
  /// [obscureText] determines if the text should be obscured.
  /// [maxLength] specifies the maximum length of the text.
  /// [enabled] determines if the text field is enabled.
  /// [showCounterText] determines if the counter text should be displayed.
  /// [useErrorText] determines if the error text should be used.
  const ClueSquareTextField({
    super.key,
    this.width = 250,
    this.autofocus = false,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.hintText,
    this.errorText,
    this.errorMaxLines = 1,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLength = 30,
    this.enabled = true,
    this.showCounterText = false,
    this.useErrorText = false,
  });

  /// The width of the text field.
  final double width;

  /// Determines if the text field should autofocus.
  final bool autofocus;

  /// The initial value of the text field.
  final String? initialValue;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The callback function when the text changes.
  final void Function(String value)? onChanged;

  /// The callback function when editing is complete.
  final void Function()? onEditingComplete;

  /// The hint text displayed in the text field.
  final String? hintText;

  /// The error text displayed below the text field.
  final String? errorText;

  /// The maximum number of lines for the error text.
  final int errorMaxLines;

  /// The icon displayed at the end of the text field.
  final Widget? suffixIcon;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Determines if the text should be obscured.
  final bool obscureText;

  /// The maximum length of the text.
  final int maxLength;

  /// Determines if the text field is enabled.
  final bool enabled;

  /// Determines if the counter text should be displayed.
  final bool showCounterText;

  /// Determines if the error text should be used.
  final bool useErrorText;

  @override
  State<ClueSquareTextField> createState() => _ClueSquareTextFieldState();
}

class _ClueSquareTextFieldState extends State<ClueSquareTextField> {
  late String text;
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
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: widget.errorText == null ? MyColors.xFFE2E8F0 : MyColors.xFFFF9292,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 1, color: MyColors.xFFF7F7F7),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: widget.errorText == null ? MyColors.xFF6682FF : MyColors.xFFFF5252,
                ),
              ),
            ),
      ),
      child: SizedBox(
        width: widget.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              enabled: widget.enabled,
              autofocus: widget.autofocus,
              initialValue: widget.initialValue,
              controller: widget.controller,
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
                filled: widget.enabled ? false : true,
                hintText: widget.hintText,
                counterText: '',
                suffixIcon: () {
                  if (widget.suffixIcon != null) {
                    return widget.suffixIcon;
                  }

                  if (widget.showCounterText == true) {
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

                  if (widget.obscureText == true) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    );
                  }
                }(),
              ),
              inputFormatters: widget.inputFormatters,
              obscureText: obscureText,
              maxLength: widget.maxLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
            if (widget.useErrorText) ...[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  height: widget.useErrorText ? 17.0 * widget.errorMaxLines : null,
                  child: Text(
                    widget.errorText ?? '',
                    style: Theme.of(context).inputDecorationTheme.errorStyle,
                    maxLines: widget.errorMaxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ] else ...[
              if (widget.errorText != null) ...[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.errorText ?? '',
                    style: Theme.of(context).inputDecorationTheme.errorStyle,
                    maxLines: widget.errorMaxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ]
          ],
        ),
      ),
    );
  }
}
