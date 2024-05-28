import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context, String fontFamily) {
  return ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: MyColors.xFFFFFFFF,
    textTheme: TextTheme(
      // Text 기본 스타일
      bodyMedium: MyTextStyle.size12.w500.xFF000000,
      // Text Field 기본 스타일
      bodyLarge: MyTextStyle.size12.w500.xFF000000,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: MyTextStyle.size12.w500.xFFA3A3A3,
      errorStyle: MyTextStyle.size12.w500.xFFFF5252,
      helperStyle: MyTextStyle.size12.w500.xFFA3A3A3,
      isDense: true,
      // 높이 40기준
      contentPadding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 16),
      fillColor: MyColors.xFFF7F7F7,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.xFF000000,
        foregroundColor: MyColors.xFFFFFFFF,
        disabledForegroundColor: MyColors.xFFFFFFFF,
        textStyle: MyTextStyle.size14.w500.copyWith(fontFamily: fontFamily),
        // 높이 40기준
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: MyColors.xFF000000,
        textStyle: MyTextStyle.size14.w500.copyWith(fontFamily: fontFamily),
        side: const BorderSide(width: 1.0, color: MyColors.xFFE2E8F0),
        // 높이 40기준
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.xFF000000,
        textStyle: MyTextStyle.size14.w500.copyWith(fontFamily: fontFamily),
        // 높이 40기준
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    iconTheme: const IconThemeData(size: 18),
    tooltipTheme: TooltipThemeData(
      verticalOffset: 25,
      textStyle: MyTextStyle.size12.w500.xFFFFFFFF,
      decoration: const ShapeDecoration(
        color: Colors.black,
        shape: ToolTipCustomShape(),
      ),
    ),
    dialogTheme: const DialogTheme(elevation: 0),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: MaterialStateProperty.all<bool>(true),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: MyColors.xFFFFFFFF,
      elevation: 0,
      dayPeriodColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? MyColors.xFF92A6FF : MyColors.xFFFFFFFF),
      dayPeriodTextColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? MyColors.xFFFFFFFF : MyColors.xFF000000),
      hourMinuteColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? MyColors.xFF6682FF : MyColors.xFF92A6FF),
      hourMinuteTextColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? MyColors.xFFFFFFFF : MyColors.xFFFFFFFF),
    ),
  );
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding ? 10 : 0); // 화살표 크기를 줄이기 위해 padding 수정

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 10)); // 화살표 크기를 절반으로 줄이기 위해 rect 수정
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.bottomCenter.dx - 5, rect.topCenter.dy) // 화살표 시작점을 변경하고 크기를 줄임
      ..relativeLineTo(5, -10) // 위로 이동
      ..relativeLineTo(5, 10) // 아래로 이동
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
