import 'package:clue_ui_component/images.dart';
import 'package:clue_ui_component/sample_widget_page/sample_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageTapPage extends StatelessWidget {
  const ImageTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          // ImageWidget(
          //   code: 'MyImages.appIcon',
          //   myImage: MyImages.appIcon,
          // ),
          // ImageWidget(
          //   code: 'MyImages.headerLogo',
          //   myImage: MyImages.headerLogo,
          // ),
          ImageWidget(
            code: 'MyImages.footerLogo',
            myImage: MyImages.footerLogo,
          ),
          ImageWidget(
            code: 'MyImages.checkboxOn',
            myImage: MyImages.checkboxOn,
          ),
          ImageWidget(
            code: 'MyImages.checkboxOff',
            myImage: MyImages.checkboxOff,
          ),
          ImageWidget(
            code: 'MyImages.calendar',
            myImage: MyImages.calendar,
          ),
          ImageWidget(
            code: 'MyImages.refresh',
            myImage: MyImages.refresh,
          ),
          ImageWidget(
            code: 'MyImages.pageLeft',
            myImage: MyImages.pageLeft,
          ),
          ImageWidget(
            code: 'MyImages.pageRight',
            myImage: MyImages.pageRight,
          ),
          ImageWidget(
            code: 'MyImages.circleRightArrow',
            myImage: MyImages.circleRightArrow,
          ),
          ImageWidget(
            code: 'MyImages.circleLeftArrow',
            myImage: MyImages.circleLeftArrow,
          ),
          ImageWidget(
            code: 'MyImages.grayDownArrow',
            myImage: MyImages.grayDownArrow,
          ),
          ImageWidget(
            code: 'MyImages.authFaceBlack',
            myImage: MyImages.authFaceBlack,
          ),
          ImageWidget(
            code: 'MyImages.authFaceBlue',
            myImage: MyImages.authFaceBlue,
          ),
          ImageWidget(
            code: 'MyImages.authQRBlack',
            myImage: MyImages.authQRBlack,
          ),
          ImageWidget(
            code: 'MyImages.authQRBlue',
            myImage: MyImages.authQRBlue,
          ),
          ImageWidget(
            code: 'MyImages.circleBlueCheck',
            myImage: MyImages.circleBlueCheck,
          ),
          ImageWidget(
            code: 'MyImages.circleRedNotice',
            myImage: MyImages.circleRedNotice,
          ),
          ImageWidget(
            code: 'MyImages.monitoring',
            myImage: MyImages.monitoring,
          ),
          ImageWidget(
            code: 'MyImages.monitoringOn',
            myImage: MyImages.monitoringOn,
          ),
          ImageWidget(
            code: 'MyImages.user',
            myImage: MyImages.user,
          ),
          ImageWidget(
            code: 'MyImages.userOn',
            myImage: MyImages.userOn,
          ),
          ImageWidget(
            code: 'MyImages.schedule',
            myImage: MyImages.schedule,
          ),
          ImageWidget(
            code: 'MyImages.scheduleOn',
            myImage: MyImages.scheduleOn,
          ),
          ImageWidget(
            code: 'MyImages.door',
            myImage: MyImages.door,
          ),
          ImageWidget(
            code: 'MyImages.doorOn',
            myImage: MyImages.doorOn,
          ),
          ImageWidget(
            code: 'MyImages.device',
            myImage: MyImages.device,
          ),
          ImageWidget(
            code: 'MyImages.deviceOn',
            myImage: MyImages.deviceOn,
          ),
          ImageWidget(
            code: 'MyImages.video',
            myImage: MyImages.video,
          ),
          ImageWidget(
            code: 'MyImages.videoOn',
            myImage: MyImages.videoOn,
          ),
          ImageWidget(
            code: 'MyImages.setting',
            myImage: MyImages.setting,
          ),
          ImageWidget(
            code: 'MyImages.settingOn',
            myImage: MyImages.settingOn,
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.code,
    required this.myImage,
  }) : super(key: key);

  final String code;
  final SvgPicture myImage;

  @override
  Widget build(BuildContext context) {
    return CopyTooltipWidget(
      code: code,
      child: SizedBox(
        width: 60,
        height: 60,
        child: myImage,
      ),
    );
  }
}
