import 'package:clue_ui_component/components/clue_decorated_button.dart';
import 'package:clue_ui_component/extensions/date_time_extension.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

Duration animatedContainerDuration = const Duration(milliseconds: 200);

enum ArrowDirection {
  before,
  after,
}

class ClueScheduleCalendar extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget? headerLeftWidget;
  final Widget? headerRightWidget;
  final DateTime initStartTime;
  final DateTime initEndTime;
  final Function(DateTime startTime, DateTime endTime) select;
  final Function(DateTime startTime, DateTime endTime) range;
  final Function()? onRefresh;
  final Function() onCalanderClick;

  final String todayText;
  final String errorFontfamily;
  final String lastMonthString;
  final String nextMonthString;
  final String cancelString;
  final String okString;
  final String selectDateString;
  final String daysMaxString;
  final String selectDurationString;

  final SvgPicture leftArrowImage;
  final SvgPicture calendarImage;
  final SvgPicture rightArrowImage;
  final SvgPicture refreshImage;
  final SvgPicture circleLeftArrowImage;
  final SvgPicture circleRedNotice;
  const ClueScheduleCalendar({
    Key? key,
    this.headerLeftWidget,
    this.headerRightWidget,
    required this.navigatorKey,
    required this.errorFontfamily,
    required this.lastMonthString,
    required this.nextMonthString,
    required this.cancelString,
    required this.okString,
    required this.selectDateString,
    required this.daysMaxString,
    required this.selectDurationString,
    required this.initStartTime,
    required this.initEndTime,
    required this.select,
    required this.range,
    required this.todayText,
    required this.leftArrowImage,
    required this.calendarImage,
    required this.rightArrowImage,
    required this.refreshImage,
    required this.circleLeftArrowImage,
    required this.circleRedNotice,
    this.onRefresh,
    required this.onCalanderClick,
  }) : super(key: key);

  @override
  State<ClueScheduleCalendar> createState() => _ClueScheduleCalendarState();
}

class _ClueScheduleCalendarState extends State<ClueScheduleCalendar> {
  final double timeHeight = 160;
  late List<DateTime> last90Days;
  final double horizontalItemWidth = 60;
  final double stepOfHorizontalScroll = 60;
  final int maximumAvailableDate = 90;
  final int horizontalItemSize = 90 * 2;

  late ScrollController horizontalDateController;
  late DateTime now;
  late DateTime startTime;
  late DateTime endTime;

  double scrollPosition = 0;
  double windowWidth = 0;

  int mountStartIndex = 0;
  int mountEndIndex = 0;

  int? dragStartIndex;
  int? dragEndIndex;

  @override
  void initState() {
    horizontalDateController = ScrollController(onAttach: (_) {
      horizontalDateController.animateTo(
        horizontalItemWidth * maximumAvailableDate - (windowWidth / 2) + 40,
        curve: Curves.easeInOut,
        duration: animatedContainerDuration,
      );
    });
    horizontalDateController.addListener(() {
      scrollPosition = horizontalDateController.position.pixels;
      calcViewPoint();
    });
    now = DateTime.now();

    last90Days = List.generate(
      horizontalItemSize,
      (index) => widget.initStartTime.subtract(
        Duration(days: maximumAvailableDate - index),
      ),
    );

    startTime = widget.initStartTime;
    endTime = widget.initEndTime;

    super.initState();
  }

  @override
  void dispose() {
    horizontalDateController.dispose();
    super.dispose();
  }

  calcViewPoint() {
    mountStartIndex = scrollPosition ~/ horizontalItemWidth;
    mountEndIndex = (scrollPosition + windowWidth) ~/ horizontalItemWidth;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        windowWidth = constraints.maxWidth;
        calcViewPoint();

        return Container(
          width: double.infinity,
          height: timeHeight,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: MyColors.xFFE2E8F0,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    widget.headerLeftWidget ?? const SizedBox.shrink(),
                    const Spacer(),
                    ClueDecoratedButton.text(
                      onPressed: () {
                        horizontalDateController.animateTo(
                          (horizontalItemWidth * maximumAvailableDate - (windowWidth / 2)) + 40,
                          curve: Curves.easeInOut,
                          duration: animatedContainerDuration,
                        );
                        setDate(st: now.startOfDay, et: now.endOfDay, callback: true);
                      },
                      child: Text(
                        widget.todayText,
                        style: MyTextStyle.size14.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClueDecoratedButton.icon30(
                      onPressed: () {
                        horizontalDateController.animateTo(
                          scrollPosition - horizontalItemWidth,
                          curve: Curves.easeInOut,
                          duration: animatedContainerDuration,
                        );
                        now = now.add(const Duration(days: -1));
                        setDate(st: now.startOfDay, et: now.endOfDay, callback: true);
                      },
                      child: Center(child: widget.leftArrowImage),
                    ),
                    const SizedBox(width: 16),
                    displayDate,
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () async {
                        widget.onCalanderClick();
                      },
                      icon: widget.calendarImage,
                    ),
                    const Gap(8),
                    ClueDecoratedButton.icon30(
                      onPressed: () {
                        if (now.yyyyMMdd != DateTime.now().yyyyMMdd) {
                          horizontalDateController.animateTo(
                            scrollPosition + horizontalItemWidth,
                            curve: Curves.easeInOut,
                            duration: animatedContainerDuration,
                          );
                          now = now.add(const Duration(days: 1));
                          setDate(st: now.startOfDay, et: now.endOfDay, callback: true);
                        }
                      },
                      child: widget.rightArrowImage,
                    ),
                    const Gap(8),
                    ClueDecoratedButton.icon30(
                      onPressed: () {
                        if (widget.onRefresh != null) {
                          widget.onRefresh!();
                        }
                      },
                      child: widget.refreshImage,
                    ),
                    const Spacer(),
                    widget.headerRightWidget ?? const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: MyColors.xFFE2E8F0.withOpacity(0.2),
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: MyColors.xFFE2E8F0,
                              width: 1,
                            ),
                          ),
                        ),
                        child: horizontalCalendar,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTapDown: (_) {
                                horizontalDateController.animateTo(scrollPosition - (horizontalItemWidth * 7),
                                    curve: Curves.easeInOut, duration: animatedContainerDuration);
                              },
                              child: SizedBox(key: const Key("before"), width: 40, height: 40, child: widget.circleLeftArrowImage),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTapDown: (_) {
                                horizontalDateController.animateTo(scrollPosition + (horizontalItemWidth * 7),
                                    curve: Curves.easeInOut, duration: animatedContainerDuration);
                              },
                              child: SizedBox(
                                  key: const Key("after"),
                                  width: 40,
                                  height: 40,
                                  child: RotatedBox(quarterTurns: 90, child: widget.circleLeftArrowImage)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get displayDate {
    return Row(
      children: [
        Text(
          startTime.frontFormat,
          style: MyTextStyle.size12.w700,
        ),
        Text(
          "  ~  ",
          style: MyTextStyle.size12.w700,
        ),
        Text(
          endTime.frontFormat,
          style: MyTextStyle.size12.w700,
        ),
      ],
    );
  }

  double longStartDx = 0;
  Widget get horizontalCalendar {
    DateFormat dateFormat = DateFormat('yy-MM-dd');
    String startDateForm = dateFormat.format(startTime);
    String endDateForm = dateFormat.format(endTime);

    bool isSameDate = startDateForm == endDateForm;

    return GestureDetector(
      key: const Key("horizontalCalendar"),
      onLongPressDown: (v) {
        longStartDx = v.globalPosition.dx;
      },
      onLongPressMoveUpdate: (v) {
        double moveTo = scrollPosition + (longStartDx - v.globalPosition.dx);
        horizontalDateController.jumpTo(moveTo);
        longStartDx = v.globalPosition.dx;
      },
      onHorizontalDragDown: (_) {
        dragStartIndex = null;
      },
      onHorizontalDragStart: (drag) {
        int offsetStart = drag.localPosition.dx ~/ horizontalItemWidth;
        int dIndex = mountStartIndex + offsetStart;
        if (dIndex > maximumAvailableDate) return;

        dragStartIndex = mountStartIndex + offsetStart;
      },
      onHorizontalDragUpdate: (drag) {
        if (dragStartIndex == null) return;

        int offsetEnd = drag.localPosition.dx ~/ horizontalItemWidth;
        int dIndex = mountStartIndex + offsetEnd;
        if (dIndex > maximumAvailableDate || (dragStartIndex! - dIndex).abs() >= 7) return;

        if (drag.localPosition.dx < (3 * horizontalItemWidth) && scrollPosition > (7 * horizontalItemWidth)) {
          horizontalDateController.animateTo(scrollPosition - (7 * horizontalItemWidth),
              curve: Curves.easeInOut, duration: animatedContainerDuration);
        }
        if (drag.localPosition.dx > (windowWidth - (3 * horizontalItemWidth)) &&
            scrollPosition < ((90 * horizontalItemWidth) - (7 * horizontalItemWidth))) {
          horizontalDateController.animateTo(scrollPosition + (7 * horizontalItemWidth),
              curve: Curves.easeInOut, duration: animatedContainerDuration);
        }

        dragEndIndex = dIndex;
        if (dragStartIndex! < dragEndIndex!) {
          setRange(st: last90Days[dragStartIndex!], et: last90Days[dragEndIndex!]);
        } else {
          setRange(st: last90Days[dragEndIndex!], et: last90Days[dragStartIndex!]);
        }
      },
      onHorizontalDragEnd: (_) {
        if (dragStartIndex == null || dragEndIndex == null) return;
        if (dragStartIndex! < dragEndIndex!) {
          setRange(st: last90Days[dragStartIndex!], et: last90Days[dragEndIndex!], callback: true);
        } else {
          setRange(st: last90Days[dragEndIndex!], et: last90Days[dragStartIndex!], callback: true);
        }
        dragStartIndex = null;
        dragEndIndex = null;
      },
      child: ListView.builder(
        controller: horizontalDateController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: horizontalItemSize,
        itemBuilder: (context, index) {
          String indexDate = dateFormat.format(last90Days[index]);
          bool isStartEdge = indexDate == startDateForm;
          bool isEndEdge = indexDate == endDateForm;
          bool isEdge = isStartEdge || isEndEdge;
          bool isInDate = last90Days[index].isAfter(startTime) && last90Days[index].isBefore(endTime.startOfDay);
          return HorizontalCalendarItem(
            dateTime: last90Days[index],
            itemWidth: horizontalItemWidth,
            isSameDate: isSameDate,
            isEndEdge: isEndEdge,
            isStartEdge: isStartEdge,
            isEdge: isEdge,
            isInDate: isInDate,
            setDate: (DateTime dateTime) {
              setDate(st: dateTime.startOfDay, et: dateTime.endOfDay, callback: true);
            },
          );
        },
      ),
    );
  }

  setDate({required DateTime st, required DateTime et, bool callback = false}) {
    DateTime start = st;
    DateTime end = et;
    setState(() {
      startTime = start;
      endTime = end;
    });
    if (callback) widget.select(startTime, endTime);
  }

  setRange({required DateTime st, required DateTime et, bool callback = false}) {
    DateTime start = st;
    DateTime end = et;
    setState(() {
      startTime = start.startOfDay;
      endTime = end.endOfDay;
    });
    if (callback) widget.range(startTime, endTime);
  }
}

class HorizontalCalendarItem extends StatefulWidget {
  final DateTime dateTime;
  final double itemWidth;
  final bool isSameDate;
  final bool isEndEdge;
  final bool isStartEdge;
  final bool isInDate;
  final bool isEdge;
  final Function(DateTime) setDate;

  const HorizontalCalendarItem({
    Key? key,
    required this.dateTime,
    required this.itemWidth,
    required this.isSameDate,
    required this.isEndEdge,
    required this.isStartEdge,
    required this.isInDate,
    required this.isEdge,
    required this.setDate,
  }) : super(key: key);

  @override
  State<HorizontalCalendarItem> createState() => _HorizontalCalendarItemState();
}

class _HorizontalCalendarItemState extends State<HorizontalCalendarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (DateTime.now().isAfter(widget.dateTime)) {
          widget.setDate(widget.dateTime);
        }
      },
      child: Container(
        width: widget.itemWidth,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Stack(
          children: [
            widget.isSameDate
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      const SizedBox(
                        width: 30,
                        height: 28,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (widget.itemWidth / 2),
                            height: 60,
                            child: OverflowBox(
                              maxWidth: (widget.itemWidth / 2) + 1,
                              child: Container(
                                color: (widget.isEndEdge || widget.isInDate) ? MyColors.xFFE2E8F0 : Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 60,
                            child: OverflowBox(
                              maxWidth: (widget.itemWidth / 2) + 1,
                              child: Container(
                                color: (widget.isStartEdge || widget.isInDate) ? MyColors.xFFE2E8F0 : Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            Column(
              children: [
                SizedBox(
                  width: 30,
                  height: 15,
                  child: Center(
                    child: widget.dateTime.startOfMonth
                        ? Text(widget.dateTime.monthLocale,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: MyFontWeight.w700, fontSize: 12, color: MyColors.xFF000000))
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: widget.itemWidth,
                  height: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: widget.isEdge
                        ? const BoxDecoration(
                            color: MyColors.xFF000000,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )
                        : null,
                    child: DateTime.now().isAfter(widget.dateTime)
                        ? Text(
                            widget.dateTime.horizontalCalendarFormat,
                            maxLines: 3,
                            style: MyTextStyle.size14.w500.h1_0.copyWith(color: widget.isEdge ? MyColors.xFFFFFFFF : MyColors.xFF000000),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            widget.dateTime.horizontalCalendarFormat,
                            maxLines: 3,
                            style: MyTextStyle.size14.xFF9CA3AF.h1_0,
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
