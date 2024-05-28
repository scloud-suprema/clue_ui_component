import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyImages {
  static final SvgPicture grayDownArrow = SvgPicture.asset("assets/images/gray_down_arrow.svg");
  static const Widget leftArrow = Icon(
    Icons.chevron_left_outlined,
    color: MyColors.xFF9CA3AF,
  );
  static const Widget rightArrow = Icon(
    Icons.chevron_right_outlined,
    color: MyColors.xFF9CA3AF,
  );
}
