import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextStyle Extensions Tests', () {
    test('FontWeightExtension 적용 테스트', () {
      TextStyle style = TextStyle();

      expect(style.w300.fontWeight, MyFontWeight.w300);
      expect(style.w500.fontWeight, MyFontWeight.w500);
      expect(style.w700.fontWeight, MyFontWeight.w700);
    });

    test('FontColorExtension 적용 테스트', () {
      TextStyle style = TextStyle();

      expect(style.xFF000000.color, MyColors.xFF000000);
      expect(style.xFF7D7D7D.color, MyColors.xFF7D7D7D);
      expect(style.xFF959595.color, MyColors.xFF959595);
      expect(style.xFFA3A3A3.color, MyColors.xFFA3A3A3);
      expect(style.xFF9CA3AF.color, MyColors.xFF9CA3AF);
      expect(style.xFFC9C9C9.color, MyColors.xFFC9C9C9);
      expect(style.xFFD9D9D9.color, MyColors.xFFD9D9D9);
      expect(style.xFFE2E8F0.color, MyColors.xFFE2E8F0);
      expect(style.xFFEFEFEF.color, MyColors.xFFEFEFEF);
      expect(style.xFFF7F7F7.color, MyColors.xFFF7F7F7);
      expect(style.xFFFDFDFD.color, MyColors.xFFFDFDFD);
      expect(style.xFFFFFFFF.color, MyColors.xFFFFFFFF);
      expect(style.xFF92A6FF.color, MyColors.xFF92A6FF);
      expect(style.xFF8299FF.color, MyColors.xFF8299FF);
      expect(style.xFF6682FF.color, MyColors.xFF6682FF);
      expect(style.xFF5CC691.color, MyColors.xFF5CC691);
      expect(style.xFFFF9292.color, MyColors.xFFFF9292);
      expect(style.xFFFF5252.color, MyColors.xFFFF5252);
      expect(style.xFFFF0000.color, MyColors.xFFFF0000);
      expect(style.xFF979797.color, MyColors.xFF979797);
    });

    test('FontFamilyExtension 적용 테스트', () {
      TextStyle style = TextStyle();

      expect(style.notoSansKR.fontFamily, MyFontFamily.notoSansKR);
      expect(style.roboto.fontFamily, MyFontFamily.roboto);
      expect(style.notoSansJP.fontFamily, MyFontFamily.notoSansJP);
    });

    test('TextStyleHeightExtension 적용 테스트', () {
      TextStyle style = TextStyle();

      expect(style.h1_0.height, 1.0);
      expect(style.h1_5.height, 1.5);
      expect(style.h2_0.height, 2.0);
    });

    test('TextStyleOtherExtension 적용 테스트', () {
      TextStyle style = TextStyle();

      expect(style.underLine.decoration, TextDecoration.underline);
      expect(style.underLine.decorationColor, MyColors.xFF6682FF);
    });
  });
}
