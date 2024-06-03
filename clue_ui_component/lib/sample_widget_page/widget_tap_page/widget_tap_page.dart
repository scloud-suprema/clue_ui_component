import 'dart:developer';

import 'package:clue_ui_component/components/clue_circle_icon_button.dart';
import 'package:clue_ui_component/components/clue_circle_text_field.dart';
import 'package:clue_ui_component/components/clue_decorated_button.dart';
import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_drop_down_button.dart';
import 'package:clue_ui_component/components/clue_drop_down_check_button.dart';
import 'package:clue_ui_component/components/clue_list_tile.dart';
import 'package:clue_ui_component/components/clue_popup_menu_button.dart';
import 'package:clue_ui_component/components/clue_side_bar_component.dart';
import 'package:clue_ui_component/components/clue_square_text_field.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/components/clue_time_period_button.dart';
import 'package:clue_ui_component/extensions/list_extension.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/main.dart';
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/themes/text_style.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WidgetTapPage extends StatelessWidget {
  const WidgetTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClueText('ClueText', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const ClueText(
                '서비스 설정',
              ),
              const ClueText(
                '이름',
                isRequired: true,
              ),
              ClueText(
                '브랜치(3)',
                style: MyTextStyle.size20.w500,
                targetList: [
                  TargetModel(
                    text: '(3)',
                    style: MyTextStyle.size20.w500.xFF6682FF,
                  ),
                ],
              ),
              ClueText(
                '빌딩(1)',
                style: MyTextStyle.size20.w500,
                targetList: [
                  TargetModel(
                    text: '(1)',
                    style: MyTextStyle.size20.w500.xFF6682FF,
                  ),
                ],
              ),
              ClueText(
                '이 곳은 방문자 서비스 사이트 입니다.\n출입 보안 서비스는 공간 관리 사이트를 접속하세요.',
                style: MyTextStyle.size20.w500,
                targetList: [
                  TargetModel(
                    text: '공간 관리 사이트',
                    style: MyTextStyle.size20.w500.xFF6682FF.underLine,
                    onTap: () {
                      // linkUrl('https://flutter.dev');
                    },
                  ),
                  TargetModel(
                    text: '서비스',
                    matchOptions: [MatchOption.zero, MatchOption.first],
                    style: MyTextStyle.size20.w500.xFFFF5252,
                  ),
                ],
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ElevatedButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const ClueText('수정'),
              ),
              const ElevatedButton(
                onPressed: null,
                child: ClueText('삭제'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {},
                child: const ClueText('로그인'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: null,
                child: const ClueText('확인'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('OutlinedButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const ClueText('수정'),
              ),
              const OutlinedButton(
                onPressed: null,
                child: ClueText('삭제'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {},
                child: const ClueText('로그인'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: null,
                child: const ClueText('확인'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('IconButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              IconButton(onPressed: () {}, icon: MyImages.setting),
              IconButton(onPressed: null, icon: MyImages.search),
              IconButton(onPressed: () {}, icon: MyImages.monitoring),
              IconButton(onPressed: null, icon: MyImages.schedule),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueCircleButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ClueCircleButton(onPressed: null, child: MyImages.whiteClose),
              ClueCircleButton(onPressed: () {}, child: MyImages.whiteMinus),
              ClueCircleButton(onPressed: null, child: MyImages.whitePlus),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueDecoratedButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ClueDecoratedButton.icon30(
                onPressed: () {},
                child: MyImages.pageLeft,
              ),
              ClueDecoratedButton.icon30(
                onPressed: () {},
                child: MyImages.pageRight,
              ),
              ClueDecoratedButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                onPressed: () {},
                child: ClueText(
                  '오늘',
                  style: MyTextStyle.size14.w500,
                ),
              ),
              ClueDecoratedButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                onPressed: () {},
                child: ClueText(
                  'Today',
                  style: MyTextStyle.size14.w500,
                ),
              ),
              Tooltip(
                message: 'QR 선택',
                child: ClueDecoratedButton.icon40(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  borderColor: MyColors.xFF6682FF,
                  onPressed: () {},
                  child: MyImages.authQRBlue,
                ),
              ),
              Tooltip(
                message: 'QR 선택',
                child: ClueDecoratedButton.icon40(
                  onPressed: null,
                  child: MyImages.authQRBlack,
                ),
              ),
              Tooltip(
                message: '얼굴 선택',
                child: ClueDecoratedButton.icon40(
                  borderColor: MyColors.xFF6682FF,
                  onPressed: () {},
                  child: MyImages.authFaceBlue,
                ),
              ),
              Tooltip(
                message: '얼굴 선택',
                child: ClueDecoratedButton.icon40(
                  onPressed: null,
                  child: MyImages.authFaceBlack,
                ),
              ),
              ClueDecoratedButton.icon40(
                onPressed: () {},
                child: MyImages.add,
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('TimePeriodButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClueTimePeriodButton(
                initValue: const TimeOfDay(hour: 0, minute: 59),
                onChanged: (value) {
                  log(value.toString());
                },
                timePeriodStatus: 'am',
              ),
              const Gap(16),
              ClueTimePeriodButton(
                initValue: const TimeOfDay(hour: 0, minute: 59),
                onChanged: (value) {
                  log(value.toString());
                },
                borderColor: MyColors.xFFFF5252,
                timePeriodStatus: 'pm',
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('CluePopupMenuButton', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              CluePopupMenuButton(
                itemList: [
                  Row(
                    children: [
                      MyImages.monitoring,
                      const SizedBox(width: 16),
                      ClueText('선택 삭제'),
                    ],
                  ),
                  Row(
                    children: [
                      MyImages.user,
                      const SizedBox(width: 16),
                      const ClueText('선택 취소'),
                    ],
                  ),
                ],
                child: MyImages.calendar,
                onTap: (index) {
                  log(index.toString());
                },
              ),
              CluePopupMenuButton(
                itemList: [
                  Row(
                    children: [
                      MyImages.monitoring,
                      const SizedBox(width: 16),
                      const ClueText('선택 삭제'),
                    ],
                  ),
                  Row(
                    children: [
                      MyImages.user,
                      const SizedBox(width: 16),
                      const ClueText('선택 취소'),
                    ],
                  ),
                  Row(
                    children: [
                      MyImages.schedule,
                      const SizedBox(width: 16),
                      const ClueText('선택 취소'),
                    ],
                  ),
                  Row(
                    children: [
                      MyImages.door,
                      const SizedBox(width: 16),
                      const ClueText('선택 취소'),
                    ],
                  ),
                  Row(
                    children: [
                      MyImages.device,
                      const SizedBox(width: 16),
                      const ClueText('선택 취소'),
                    ],
                  ),
                ],
                child: MyImages.setting,
                onTap: (index) {
                  log(index.toString());
                },
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueCircleTextField', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  initialValue: '수정불가',
                  enabled: false,
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  maxLength: 30,
                  showCounterText: true,
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  hintText: '힌트 텍스트',
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  initialValue: '기본 텍스트',
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  errorText: '정확히 입력해주세요.',
                  useErrorText: true,
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  initialValue: 'a123456',
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: 150,
                child: ClueCircleTextField(
                  initialValue: 'a123456',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: MyImages.search,
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueSquareTextField', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  initialValue: '수정불가',
                  enabled: false,
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  maxLength: 30,
                  showCounterText: true,
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  hintText: '힌트 텍스트',
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  initialValue: '기본 텍스트',
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  errorText: '오류 텍스트',
                ),
              ),
              const SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  initialValue: 'a123456',
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: 150,
                child: ClueSquareTextField(
                  initialValue: 'a123456',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: MyImages.search,
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueListTile', style: MyTextStyle.size20.w700),
          const Gap(8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              const ClueListTile(
                leftWidget: ClueText(
                  '호스트',
                  isRequired: true,
                ),
                centerWidget: ClueSquareTextField(
                  initialValue: '신현범(robbie@suprema.co.kr)',
                ),
              ),
              const Gap(16),
              ClueListTile(
                leftWidget: const ClueText(
                  '방문목적',
                  isRequired: true,
                ),
                centerWidget: ClueDropDownButton(
                  width: 200,
                  itemMap: const [
                    '회의',
                    '회의1',
                    '회의2',
                    '회의3',
                    '회의4',
                    '회의5',
                    '회의6',
                  ].toIndexKeyMap(),
                  onChanged: (key) {
                    ClueOverlay.showSuccessToast(
                      'key:$key',
                    );
                  },
                ),
              ),
              const Gap(16),
              ClueListTile(
                leftWidget: const ClueText(
                  '출입구역',
                  isRequired: true,
                ),
                centerWidget: ClueDropDownCheckButton(
                  width: 200,
                  selectedKeyList: const [1, 3],
                  itemMap: const [
                    '1층 공용부',
                    '2층 공용부',
                    '3층 공용부',
                    '4층 공용부',
                    '5층 공용부',
                    '6층 공용부',
                  ].toIndexKeyMap(),
                  onChanged: (selectedIndexList, selectedValueList) {
                    ClueOverlay.showSuccessToast(
                      'index:$selectedIndexList / value:$selectedValueList',
                    );
                  },
                  allSelectText: 'all',
                  notSelectText: 'not_selected',
                ),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueSideBarComponent', style: MyTextStyle.size20.w700),
          const Gap(8),
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(border: Border.all()),
            child: ClueSideBarComponent(
              title: '제목',
              titleOnTap: () {},
              logo: const FlutterLogo(),
              logoTitle: '로고 제목',
              infoList: const [
                ClueSideBarInfo(title: '사이드 제목1', subTitle: '사이드 서브 제목1'),
                ClueSideBarInfo(title: '사이드 제목2', subTitle: '사이드 서브 제목2'),
              ],
              itemList: [
                ClueSideBarItem(
                  icon: MyImages.schedule,
                  title: '아이템 이름1',
                  onPressed: () {},
                ),
                ClueSideBarItem(
                  icon: MyImages.door,
                  title: '아이템 이름2',
                  onPressed: () {},
                ),
              ],
              child: const Placeholder(),
            ),
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('CluePaint(Sample)', style: MyTextStyle.size20.w700),
          const Gap(8),
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CustomPaint(
                        painter: CirclePaint(
                          angle: 0,
                          circleLength: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 75),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 100,
                    height: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 100,
                    height: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('CluePaint2(Sample)', style: MyTextStyle.size20.w700),
          const Gap(8),
          SizedBox(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: SeatDecorator(),
            ),
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
        ],
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  final double pi = 3.141592;

  /// 선 색깔
  final Color color;

  /// 시작점(0~365)
  final double angle;

  /// 길이(백분율)
  final double circleLength;

  CirclePaint({
    this.angle = 0,
    this.circleLength = 100,
    this.color = MyColors.xFFD9D9D9,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: size.width, height: size.height);
    canvas.drawArc(
      rect,
      (angle * pi) - (pi / 2),
      sweepAngle(),
      false,
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double sweepAngle() => 2 * (circleLength / 100) * pi;
}

class SeatDecorator extends CustomPainter {
  SeatDecorator({this.strokeWidth = 8});
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint redPaint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth;

    Paint bluePaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth;

    double radius = 5;
    double radiusSize = 13;

    Path path = Path();
    path.moveTo(radiusSize, 0);
    path.lineTo(size.width - radiusSize, 0);
    canvas.drawPath(path, bluePaint);

    Path topRightArc = Path()
      ..moveTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius));
    canvas.drawPath(topRightArc, redPaint);

    Path path2 = Path();
    path2.moveTo(size.width, radiusSize);
    path2.lineTo(size.width, size.height - radiusSize);
    canvas.drawPath(path2, bluePaint);

    Path bottomRightArc = Path()
      ..moveTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius));
    canvas.drawPath(bottomRightArc, redPaint);

    Path path3 = Path();
    path3.moveTo(radiusSize, size.height);
    path3.lineTo(size.width - radiusSize, size.height);
    canvas.drawPath(path3, bluePaint);

    Path bottomLeftArc = Path()
      ..moveTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius));
    canvas.drawPath(bottomLeftArc, redPaint);

    Path path4 = Path();
    path4.moveTo(0, size.height - radiusSize);
    path4.lineTo(0, radiusSize);
    canvas.drawPath(path4, bluePaint);

    Path topLeftArc = Path()
      ..moveTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));
    canvas.drawPath(topLeftArc, redPaint);
  }

  @override
  bool shouldRepaint(covariant SeatDecorator oldDelegate) => oldDelegate.strokeWidth != strokeWidth;
}
