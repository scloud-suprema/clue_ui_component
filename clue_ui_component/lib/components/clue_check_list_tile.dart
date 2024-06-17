import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A custom check list tile widget for CLUe UI components.
class ClueCheckListTile extends StatefulWidget {
  /// Icon for checked state.
  final SvgPicture? checkboxOn;

  /// Icon for unchecked state.
  final SvgPicture? checkboxOff;

  /// Creates a CLUeCheckListTile.
  ///
  /// [title] is the text to be displayed.
  /// [initValue] is the initial checked state.
  /// [onChanged] is the callback function when the checked state changes.
  const ClueCheckListTile({
    super.key,
    required this.title,
    this.initValue,
    required this.onChanged,
    this.checkboxOn,
    this.checkboxOff,
  });

  /// The title of the check list tile.
  final String title;

  /// The initial value of the check list tile.
  final bool? initValue;

  /// The callback function that is called when the checked state changes.
  final Function onChanged;

  @override
  State<ClueCheckListTile> createState() => _ClueCheckListTileState();
}

/// State for [ClueCheckListTile].
class _ClueCheckListTileState extends State<ClueCheckListTile> {
  /// The current checked state.
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isChecked ? widget.checkboxOn ?? MyImages.checkboxOn : widget.checkboxOff ?? MyImages.checkboxOff,
            const SizedBox(width: 8),
            ClueText(widget.title),
          ],
        ),
      ),
    );
  }
}
