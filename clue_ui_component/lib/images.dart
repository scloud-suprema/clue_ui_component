import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'themes/themes.dart';

/// 이미지&아이콘 관리
class MyImages {
  MyImages._();
  static final Image appIcon = Image.asset("assets/images/app-icon.png");
  static final Image headerLogo = Image.asset("assets/images/header_logo.png");
  static final SvgPicture footerLogo = SvgPicture.asset("assets/images/footer_logo.svg");
  static final SvgPicture checkboxOn = SvgPicture.asset("assets/images/checkbox_on.svg");
  static final SvgPicture checkboxOff = SvgPicture.asset("assets/images/checkbox_off.svg");
  static final SvgPicture calendar = SvgPicture.asset("assets/images/calendar.svg");
  static final SvgPicture pageLeft = SvgPicture.asset("assets/images/page_left.svg");
  static final SvgPicture pageRight = SvgPicture.asset("assets/images/page_right.svg");
  static final SvgPicture circleRightArrow = SvgPicture.asset("assets/images/circle_right_arrow.svg");
  static final SvgPicture circleLeftArrow = SvgPicture.asset("assets/images/circle_left_arrow.svg");
  static final SvgPicture grayDownArrow = SvgPicture.asset("assets/images/gray_down_arrow.svg");
  static final SvgPicture monitoring = SvgPicture.asset("assets/images/monitoring.svg");
  static final SvgPicture monitoringOn = SvgPicture.asset("assets/images/monitoring-on.svg");
  static final SvgPicture user = SvgPicture.asset("assets/images/user.svg");
  static final SvgPicture userOn = SvgPicture.asset("assets/images/user-on.svg");
  static final SvgPicture schedule = SvgPicture.asset("assets/images/schedule.svg");
  static final SvgPicture scheduleOn = SvgPicture.asset("assets/images/schedule-on.svg");
  static final SvgPicture door = SvgPicture.asset("assets/images/door.svg");
  static final SvgPicture doorOn = SvgPicture.asset("assets/images/door-on.svg");
  static final SvgPicture device = SvgPicture.asset("assets/images/device.svg");
  static final SvgPicture deviceOn = SvgPicture.asset("assets/images/device-on.svg");
  static final SvgPicture video = SvgPicture.asset("assets/images/video.svg");
  static final SvgPicture videoOn = SvgPicture.asset("assets/images/video-on.svg");
  static final SvgPicture setting = SvgPicture.asset("assets/images/setting.svg");
  static final SvgPicture settingOn = SvgPicture.asset("assets/images/setting-on.svg");
  static final SvgPicture circleCheckedBlack = SvgPicture.asset("assets/images/circle_checked_black.svg");
  static final SvgPicture circleBlueCheck = SvgPicture.asset("assets/images/success_blue_point_circle.svg");
  static final SvgPicture circleRedNotice = SvgPicture.asset("assets/images/circle_red_notice.svg");
  static final SvgPicture doorNone = SvgPicture.asset("assets/images/sc_icon_door_none.svg");
  static const Widget leftArrow = Icon(
    Icons.chevron_left_outlined,
    color: MyColors.xFF9CA3AF,
  );
  static final SvgPicture leftArrowBox = SvgPicture.asset("assets/images/sc_btn_list_arrow_left_off.svg");
  static const Widget rightArrow = Icon(
    Icons.chevron_right_outlined,
    color: MyColors.xFF9CA3AF,
  );
  static final SvgPicture rightArrowBox = SvgPicture.asset("assets/images/sc_btn_list_arrow_left_off.svg");
  static final SvgPicture moreBlack = SvgPicture.asset("assets/images/more_black.svg");
  static final SvgPicture search = SvgPicture.asset("assets/images/sc_btn_search.svg");
  static final SvgPicture close = SvgPicture.asset("assets/images/sc_btn_close.svg");
  static final SvgPicture plus = SvgPicture.asset(
    "assets/images/plus.svg",
    colorFilter: const ColorFilter.mode(MyColors.xFF7D7D7D, BlendMode.srcIn),
  );
  static final SvgPicture minus = SvgPicture.asset(
    "assets/images/minus.svg",
    colorFilter: const ColorFilter.mode(MyColors.xFF7D7D7D, BlendMode.srcIn),
  );
  static final SvgPicture searchNone = SvgPicture.asset("assets/images/sc_icon_ico_none.svg");
  static final SvgPicture add = SvgPicture.asset("assets/images/sc_icon_plus_g.svg");
  static final SvgPicture addButton = SvgPicture.asset("assets/images/sc_btn_add_b_off.svg");
  static final SvgPicture mail = SvgPicture.asset("assets/images/mail.svg");
  static final SvgPicture more = SvgPicture.asset("assets/images/sc_btn_more.svg");
  static final SvgPicture userDelete = SvgPicture.asset("assets/images/user_delete.svg");
  static final SvgPicture userCancel = SvgPicture.asset("assets/images/user_cancel.svg");

  // resize

  // 12 size
  static final SvgPicture refresh = SvgPicture.asset(
    "assets/images/refresh.svg",
    width: 12,
    height: 12,
  );

  // 16 size
  static final SvgPicture whitePlus = SvgPicture.asset(
    "assets/images/plus.svg",
    colorFilter: const ColorFilter.mode(MyColors.xFFFFFFFF, BlendMode.srcIn),
    width: 16,
    height: 16,
  );
  static final SvgPicture whiteMinus = SvgPicture.asset(
    "assets/images/minus.svg",
    colorFilter: const ColorFilter.mode(MyColors.xFFFFFFFF, BlendMode.srcIn),
    width: 16,
    height: 16,
  );
  static final SvgPicture whiteClose = SvgPicture.asset(
    "assets/images/close.svg",
    colorFilter: const ColorFilter.mode(MyColors.xFFFFFFFF, BlendMode.srcIn),
    width: 16,
    height: 16,
  );
  static final SvgPicture circleGrayShell = SvgPicture.asset(
    "assets/images/circle_gray_shell.svg",
    width: 16,
    height: 16,
  );
  static final SvgPicture circleGraySolid = SvgPicture.asset(
    "assets/images/circle_gray_solid.svg",
    width: 16,
    height: 16,
  );

  // 18 size
  static final SvgPicture authFaceBlack = SvgPicture.asset(
    "assets/images/auth_face.svg",
    width: 18,
    height: 18,
    colorFilter: const ColorFilter.mode(MyColors.xFF000000, BlendMode.srcIn),
  );
  static final SvgPicture authFaceBlue = SvgPicture.asset(
    "assets/images/auth_face.svg",
    width: 18,
    height: 18,
    colorFilter: const ColorFilter.mode(MyColors.xFF6682FF, BlendMode.srcIn),
  );
  static final SvgPicture authQRBlack = SvgPicture.asset(
    "assets/images/auth_qr.svg",
    width: 18,
    height: 18,
    colorFilter: const ColorFilter.mode(MyColors.xFF000000, BlendMode.srcIn),
  );
  static final SvgPicture authQRBlue = SvgPicture.asset(
    "assets/images/auth_qr.svg",
    width: 18,
    height: 18,
    colorFilter: const ColorFilter.mode(MyColors.xFF6682FF, BlendMode.srcIn),
  );

  // 22 size
  static final SvgPicture circleGraySolid22 = SvgPicture.asset(
    "assets/images/circle_gray_solid.svg",
    width: 22,
    height: 22,
  );
  static final SvgPicture circleCheckedBlack22 = SvgPicture.asset(
    "assets/images/circle_checked_black.svg",
    width: 22,
    height: 22,
  );
}
