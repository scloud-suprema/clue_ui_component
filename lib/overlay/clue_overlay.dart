import 'package:clue_ui_component/clue_navigator_key.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:clue_ui_component/extensions/date_time_extension.dart';
import 'package:clue_ui_component/overlay/clue_overlay_entry.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

class ClueOverlay {
  /// 전역 로딩 시작
  static void showLoading() {
    clueNavigatorKey.currentContext!.loaderOverlay.show();
  }

  /// 전역 로딩 종료
  static void hideLoading() {
    clueNavigatorKey.currentContext!.loaderOverlay.hide();
  }

  /// 성공 토스트 메시지 호출
  static void showSuccessToast(String text, {String? fontfamily, SvgPicture? circleBlueCheck}) {
    ClueOverlayEntry.showPopup(SuccessToast(text: text, fontfamily: fontfamily, circleBlueCheck: circleBlueCheck));
  }

  /// 실패 토스트 메시지 호출
  static void showErrorToast(String text, {String? fontfamily, SvgPicture? circleRedNotice}) {
    ClueOverlayEntry.showPopup(ErrorToast(text: text, fontfamily: fontfamily, circleRedNotice: circleRedNotice),
        duration: const Duration(seconds: 3));
  }

  /// 다이얼로그 호출
  static Future<DialogState?> showClueDialog({required Widget dialog, required}) async {
    DialogState result = await showDialog(
          routeSettings: const RouteSettings(name: 'showCustomDialog'),
          barrierDismissible: false,
          context: clueNavigatorKey.currentContext!,
          builder: (context) {
            return dialog;
          },
        ) ??
        DialogState.cancel;
    return result;
  }

  static void closeBackClueDialog() {
    final navigator = Navigator.of(clueNavigatorKey.currentContext!, rootNavigator: true);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  /// 달력 호출(single)
  static Future<DateTime?> showCalendarSingle({
    // 초기값
    DateTime? initDateTime,
    // 최소날짜
    DateTime? minDateTime,
    // 최대날짜
    DateTime? maxDateTime,
    required,
    final String? lastMonthString,
    final String? nextMonthString,
    final String? cancelString,
    final String? okString,
    final String? selectDateString,
  }) async {
    Set<DateTime> calendarSet = {};
    var result = await showCalendarDatePicker2Dialog(
      context: clueNavigatorKey.currentContext!,
      // 날짜 초기값
      value: [initDateTime],
      config: CalendarDatePicker2WithActionButtonsConfig(
        selectedDayHighlightColor: MyColors.xFF8299FF,
        selectedRangeHighlightColor: MyColors.xFF8299FF,
        dayTextStyle: const TextStyle(fontSize: 12, color: MyColors.xFF000000),
        calendarType: CalendarDatePicker2Type.single,
        dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
          if (date.day == 1) {
            calendarSet.clear();
          }

          if (isSelected == true) {
            calendarSet.add(date);
          }
          return null;
        },
        // 현재날짜 표시(테두리)
        currentDate: DateTime.now(),
        // 조건 - 최소날짜
        firstDate: minDateTime,
        // 조건 - 최대날짜
        lastDate: maxDateTime,
        // < 버튼
        lastMonthIcon: Tooltip(message: lastMonthString ?? "last_month", child: MyImages.leftArrow),
        // > 버튼
        nextMonthIcon: Tooltip(message: nextMonthString ?? "next_month", child: MyImages.rightArrow),
        // 버튼 여백
        buttonPadding: EdgeInsets.zero,
        // 취소 버튼
        cancelButton: TextButton(
          onPressed: () {
            Navigator.pop(clueNavigatorKey.currentContext!);
          },
          child: Text(
            cancelString ?? "cancel",
            style: MyTextStyle.size14,
          ),
        ),
        // 확인 버튼
        okButton: TextButton(
          onPressed: () {
            if (calendarSet.isEmpty) {
              ClueOverlay.showErrorToast(selectDateString ?? "select_date");
            } else {
              Navigator.pop(clueNavigatorKey.currentContext!, calendarSet.toList());
            }
          },
          child: Text(
            okString ?? "ok",
            style: MyTextStyle.size14,
          ),
        ),
      ),
      // 다이얼로그 크기
      dialogSize: const Size(500, 450),
      // 다이얼로그 배경색
      dialogBackgroundColor: MyColors.xFFFFFFFF,
      // 네비게이션 라우트 이름
      routeSettings: const RouteSettings(name: 'showCalendarSingle'),
      // 다이얼로그 테두리
      borderRadius: BorderRadius.circular(5),
    );

    return result?.first;
  }

  /// 달력 호출(multi)
  static Future<List<DateTime>?> showCalendarMulti({
    // 초기값
    List<DateTime>? initDateTime,
    // 최소날짜
    DateTime? minDateTime,
    // 최대날짜
    DateTime? maxDateTime,
    // 최대 개수
    int selectMaxCount = 5,
    required,
    final String? errorFontfamily,
    final String? lastMonthString,
    final String? nextMonthString,
    final String? cancelString,
    final String? okString,
    final String? selectDateString,
    final String? daysMaxString,
  }) async {
    Set<DateTime> calendarSet = {};
    var result = await showCalendarDatePicker2Dialog(
      context: clueNavigatorKey.currentContext!,
      // 날짜 초기값
      value: initDateTime ?? [],
      config: CalendarDatePicker2WithActionButtonsConfig(
        selectedDayHighlightColor: MyColors.xFF8299FF,
        selectedRangeHighlightColor: MyColors.xFF8299FF,
        dayTextStyle: const TextStyle(fontSize: 12, color: MyColors.xFF000000),
        calendarType: CalendarDatePicker2Type.multi,
        dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
          if (isSelected == true) {
            calendarSet.add(date);
          } else {
            calendarSet.removeWhere((element) => element.yyyyMMdd == date.yyyyMMdd);
          }
          return null;
        },
        // 현재날짜 표시(테두리)
        currentDate: DateTime.now(),
        // 조건 - 최소날짜
        firstDate: minDateTime,
        // 조건 - 최대날짜
        lastDate: maxDateTime,
        // < 버튼
        lastMonthIcon: Tooltip(message: lastMonthString ?? "last_month", child: MyImages.leftArrow),
        // > 버튼
        nextMonthIcon: Tooltip(message: nextMonthString ?? "next_month", child: MyImages.rightArrow),
        buttonPadding: EdgeInsets.zero,
        // 취소버튼
        cancelButton: TextButton(
          onPressed: () {
            Navigator.pop(clueNavigatorKey.currentContext!);
          },
          child: Text(
            cancelString ?? "cancel",
            style: MyTextStyle.size14,
          ),
        ),
        // 확인버튼
        okButton: TextButton(
          onPressed: () {
            if (calendarSet.isEmpty) {
              ClueOverlay.showErrorToast(selectDateString ?? "select_date");
            } else if (calendarSet.length > selectMaxCount) {
              ClueOverlay.showErrorToast(daysMaxString ?? "days_maximum");
            } else {
              Navigator.pop(clueNavigatorKey.currentContext!, calendarSet.toList());
            }
          },
          child: Text(
            okString ?? "ok",
            style: MyTextStyle.size14,
          ),
        ),
      ),
      // 다이얼로그 크기
      dialogSize: const Size(500, 450),
      // 다이얼로그 배경색
      dialogBackgroundColor: MyColors.xFFFFFFFF,
      // 네비게이션 라우트 이름
      routeSettings: const RouteSettings(name: 'showCalendarMulti'),
      // 다이얼로그 테두리
      borderRadius: BorderRadius.circular(5),
    );

    return result?.map((e) => e!).toList();
  }

  /// 달력 호출(range)
  static Future<({DateTime startDate, DateTime endDate})?> showCalendarRange({
    // 초기값
    ({DateTime startDate, DateTime endDate})? initDateTime,
    // 최소날짜
    DateTime? minDateTime,
    // 최대날짜
    DateTime? maxDateTime,
    // 최대 선택 가능기간
    int maxRangeCount = 7,
    required,
    final String? errorFontfamily,
    final String? lastMonthString,
    final String? nextMonthString,
    final String? cancelString,
    final String? okString,
    final String? selectDateString,
    final String? daysMaxString,
    final String? selectDurationString,
  }) async {
    Set<DateTime> calendarSet = {};
    var result = await showCalendarDatePicker2Dialog(
      context: clueNavigatorKey.currentContext!,
      // 날짜 초기값
      value: [initDateTime?.startDate, initDateTime?.endDate],
      config: CalendarDatePicker2WithActionButtonsConfig(
        selectedDayHighlightColor: MyColors.xFF8299FF,
        selectedRangeHighlightColor: MyColors.xFF8299FF,
        dayTextStyle: const TextStyle(fontSize: 12, color: MyColors.xFF000000),
        calendarType: CalendarDatePicker2Type.range,
        dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
          if (isSelected == true) {
            calendarSet.add(date);
          } else {
            calendarSet.removeWhere((element) => element.yyyyMMdd == date.yyyyMMdd);
          }
          return null;
        },
        // 현재날짜 표시(테두리)
        currentDate: DateTime.now(),
        // 조건 - 최소날짜
        firstDate: minDateTime,
        // 조건 - 최대날짜
        lastDate: maxDateTime,
        // < 버튼
        lastMonthIcon: Tooltip(message: lastMonthString ?? "last_month", child: MyImages.leftArrow),
        // > 버튼
        nextMonthIcon: Tooltip(message: nextMonthString ?? "next_month", child: MyImages.rightArrow),
        buttonPadding: EdgeInsets.zero,
        // 취소버튼
        cancelButton: TextButton(
          onPressed: () {
            Navigator.pop(clueNavigatorKey.currentContext!);
          },
          child: Text(
            cancelString ?? "cancel",
            style: MyTextStyle.size14,
          ),
        ),
        // 확인버튼
        okButton: TextButton(
          onPressed: () {
            var calendarList = calendarSet.toList();

            if (calendarList.isEmpty) {
              ClueOverlay.showErrorToast(selectDurationString ?? "select_date");
            } else if (calendarList.last.difference(calendarList.first).inDays > maxRangeCount) {
              ClueOverlay.showErrorToast(daysMaxString ?? "days_maximum");
            } else if (calendarList.length == 1) {
              calendarList.add(calendarList[0]);
              Navigator.pop(clueNavigatorKey.currentContext!, calendarList.toList());
            } else {
              Navigator.pop(clueNavigatorKey.currentContext!, calendarList.toList());
            }
          },
          child: Text(
            okString ?? "ok",
            style: MyTextStyle.size14,
          ),
        ),
      ),
      // 다이얼로그 크기
      dialogSize: const Size(500, 450),
      // 다이얼로그 배경색
      dialogBackgroundColor: MyColors.xFFFFFFFF,
      // 네비게이션 라우트 이름
      routeSettings: const RouteSettings(name: 'showCalendarRange'),
      // 다이얼로그 테두리
      borderRadius: BorderRadius.circular(5),
    );

    if (result == null || result.length < 2) {
      return null;
    } else {
      return (startDate: result[0]!, endDate: result[1]!);
    }
  }
}

class ClueOkDialog extends StatelessWidget {
  const ClueOkDialog({
    super.key,
    required this.title,
    required this.body,
    this.padding = const EdgeInsets.all(16),
    required this.okButtonText,
  });

  final String title;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final String okButtonText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
          color: MyColors.xFFFFFFFF,
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: MyTextStyle.size20.w500.xFF000000,
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            Flexible(
              child: Center(
                child: SingleChildScrollView(
                  padding: padding,
                  child: Center(child: body),
                ),
              ),
            ),
            const Divider(height: 0),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: constraints.maxWidth / 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, DialogState.ok);
                    },
                    child: Text(okButtonText),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ClueOkCancelDialog extends StatelessWidget {
  const ClueOkCancelDialog({
    super.key,
    required this.title,
    required this.body,
    this.padding = const EdgeInsets.all(16),
    this.okButtonFunction,
    required this.okButtonText,
    required this.cancelButtonText,
    this.okButtonEnable = true,
    this.cancelButtonEnable = true,
  });

  final String title;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final Future<bool> Function()? okButtonFunction;
  final String okButtonText;
  final String cancelButtonText;
  final bool okButtonEnable;
  final bool cancelButtonEnable;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
          color: MyColors.xFFFFFFFF,
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: MyTextStyle.size20.w500.xFF000000,
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            Flexible(
              child: Center(
                child: SingleChildScrollView(
                  padding: padding,
                  child: Center(child: body),
                ),
              ),
            ),
            const Divider(height: 0),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: cancelButtonEnable
                        ? () {
                            Navigator.pop(context, DialogState.cancel);
                          }
                        : null,
                    child: Text(cancelButtonText),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: okButtonEnable
                        ? () async {
                            if (okButtonFunction != null) {
                              var result = await okButtonFunction!();
                              if (result == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context, DialogState.ok);
                              }
                            } else {
                              Navigator.pop(context, DialogState.ok);
                            }
                          }
                        : null,
                    child: Text(okButtonText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum DialogState { ok, cancel }
