import 'package:flutter/material.dart';

import '../themes/themes.dart';

extension FontWeightExtension on TextStyle {
  TextStyle get w300 => copyWith(fontWeight: MyFontWeight.w300);
  TextStyle get w500 => copyWith(fontWeight: MyFontWeight.w500);
  TextStyle get w700 => copyWith(fontWeight: MyFontWeight.w700);
}

extension FontColorExtension on TextStyle {
  TextStyle get xFF000000 => copyWith(color: MyColors.xFF000000);
  TextStyle get xFF7D7D7D => copyWith(color: MyColors.xFF7D7D7D);
  TextStyle get xFF959595 => copyWith(color: MyColors.xFF959595);
  TextStyle get xFFA3A3A3 => copyWith(color: MyColors.xFFA3A3A3);
  TextStyle get xFF9CA3AF => copyWith(color: MyColors.xFF9CA3AF);
  TextStyle get xFFC9C9C9 => copyWith(color: MyColors.xFFC9C9C9);
  TextStyle get xFFD9D9D9 => copyWith(color: MyColors.xFFD9D9D9);
  TextStyle get xFFE2E8F0 => copyWith(color: MyColors.xFFE2E8F0);
  TextStyle get xFFEFEFEF => copyWith(color: MyColors.xFFEFEFEF);
  TextStyle get xFFF7F7F7 => copyWith(color: MyColors.xFFF7F7F7);
  TextStyle get xFFFDFDFD => copyWith(color: MyColors.xFFFDFDFD);
  TextStyle get xFFFFFFFF => copyWith(color: MyColors.xFFFFFFFF);
  TextStyle get xFF92A6FF => copyWith(color: MyColors.xFF92A6FF);
  TextStyle get xFF8299FF => copyWith(color: MyColors.xFF8299FF);
  TextStyle get xFF6682FF => copyWith(color: MyColors.xFF6682FF);
  TextStyle get xFF5CC691 => copyWith(color: MyColors.xFF5CC691);
  TextStyle get xFFFF9292 => copyWith(color: MyColors.xFFFF9292);
  TextStyle get xFFFF5252 => copyWith(color: MyColors.xFFFF5252);
  TextStyle get xFFFF0000 => copyWith(color: MyColors.xFFFF0000);
  TextStyle get xFF979797 => copyWith(color: MyColors.xFF979797);
}

extension FontFamilyExtension on TextStyle {
  TextStyle get notoSansKR => copyWith(fontFamily: MyFontFamily.notoSansKR);
  TextStyle get roboto => copyWith(fontFamily: MyFontFamily.roboto);
  TextStyle get notoSansJP => copyWith(fontFamily: MyFontFamily.notoSansJP);
}

extension TextStyleHeightExtension on TextStyle {
  TextStyle get h1_0 => copyWith(height: 1.0);
  TextStyle get h1_5 => copyWith(height: 1.5);
  TextStyle get h2_0 => copyWith(height: 2.0);
}

extension TextStyleOtherExtension on TextStyle {
  TextStyle get underLine => copyWith(
        decoration: TextDecoration.underline,
        decorationColor: MyColors.xFF6682FF,
      );
}
