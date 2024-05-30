import 'package:clue_ui_component/components/clue_drop_down_button.dart';
import 'package:clue_ui_component/enums/hour_status.dart';
import 'package:clue_ui_component/enums/minute_status.dart';
import 'package:clue_ui_component/enums/time_period_status.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ClueTimePeriodButton extends StatefulWidget {
  const ClueTimePeriodButton({
    Key? key,
    required this.initValue,
    required this.onChanged,
    this.borderColor,
    required this.timePeriodStatus,
  }) : super(key: key);

  final TimeOfDay initValue;
  final void Function(TimeOfDay value) onChanged;
  final Color? borderColor;
  final String timePeriodStatus;
  @override
  State<ClueTimePeriodButton> createState() => _ClueTimePeriodButtonState();
}

class _ClueTimePeriodButtonState extends State<ClueTimePeriodButton> {
  late TimeOfDay timeOfDay;

  @override
  void initState() {
    super.initState();
    timeOfDay = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClueDropDownButton(
          width: 200,
          selectedKey: TimePeriodStatus.hourToStatus(timeOfDay.hour),
          itemMap: TimePeriodStatus.toMap,
          onChanged: (key) {
            if (key == TimePeriodStatus.am && timeOfDay.hour >= 12) {
              timeOfDay = timeOfDay.replacing(hour: timeOfDay.hour - 12);
            }
            if (key == TimePeriodStatus.pm && timeOfDay.hour < 12) {
              timeOfDay = timeOfDay.replacing(hour: timeOfDay.hour + 12);
            }
            widget.onChanged(timeOfDay);
          },
          borderColor: widget.borderColor,
        ),
        const Gap(16),
        ClueDropDownButton(
          width: 200,
          selectedKey: HourStatus.fromHour(timeOfDay.hour % 12),
          itemMap: HourStatus.toMap,
          onChanged: (key) {
            if (timeOfDay.hour < 12) {
              timeOfDay = timeOfDay.replacing(hour: key.value);
            } else {
              timeOfDay = timeOfDay.replacing(hour: 12 + key.value);
            }
            widget.onChanged(timeOfDay);
          },
          borderColor: widget.borderColor,
        ),
        const Gap(16),
        ClueDropDownButton(
          width: 200,
          selectedKey: MinuteStatus.fromMinute(timeOfDay.minute),
          itemMap: MinuteStatus.toMap,
          onChanged: (key) {
            timeOfDay = timeOfDay.replacing(minute: key.value);
            widget.onChanged(timeOfDay);
          },
          borderColor: widget.borderColor,
        ),
      ],
    );
  }
}
