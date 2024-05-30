import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClueCircleTextField extends StatefulWidget {
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

  final bool enabled;
  final String? initialValue;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final String? hintText;
  final bool useErrorText;
  final String? errorText;
  final int errorMaxLines;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool showCounterText;

  @override
  State<ClueCircleTextField> createState() => _ClueCircleTextFieldState();
}

class _ClueCircleTextFieldState extends State<ClueCircleTextField> {
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
        ],
      ),
    );
  }
}
