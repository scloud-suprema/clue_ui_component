import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClueCheckListTile extends StatefulWidget {
  final SvgPicture? checkboxOn;
  final SvgPicture? checkboxOff;

  const ClueCheckListTile({
    super.key,
    required this.title,
    this.initValue,
    required this.onChanged,
    this.checkboxOn,
    this.checkboxOff,
  });

  /// 타이틀
  final String title;

  /// 초기값
  final bool? initValue;

  /// 콜백함수
  final Function onChanged;

  @override
  State<ClueCheckListTile> createState() => _ClueCheckListTileState();
}

class _ClueCheckListTileState extends State<ClueCheckListTile> {
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
