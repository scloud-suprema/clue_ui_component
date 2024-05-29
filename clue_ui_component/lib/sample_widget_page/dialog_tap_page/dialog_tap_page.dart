import 'package:clue_ui_component/components/clue_divider.dart';
import 'package:clue_ui_component/components/clue_drop_down_button.dart';
import 'package:clue_ui_component/components/clue_drop_down_check_button.dart';
import 'package:clue_ui_component/components/clue_text.dart';
import 'package:clue_ui_component/enums/server_error_code.dart';
import 'package:clue_ui_component/extensions/list_extension.dart';
import 'package:clue_ui_component/extensions/style_extension.dart';
import 'package:clue_ui_component/main.dart';
import 'package:clue_ui_component/overlay/clue_overlay.dart';
import 'package:clue_ui_component/themes/text_style.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DialogTapPage extends StatelessWidget {
  const DialogTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClueText('Global Loading', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () async {
                  ClueOverlay.showLoading(rootNavigatorKey);
                  await Future.delayed(const Duration(seconds: 2));
                  ClueOverlay.hideLoading(rootNavigatorKey);
                },
                child: const ClueText('show & hide Loading'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('Toast', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () async {
                  ClueOverlay.showSuccessToast('성공 입니다.', rootNavigatorKey);
                },
                child: const ClueText('성공 토스트 메시지'),
              ),
              OutlinedButton(
                onPressed: () async {
                  ClueOverlay.showErrorToast('실패 입니다.', rootNavigatorKey);
                },
                child: const ClueText('실패 토스트 메시지'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('Dialog', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () async {
                  var result = await ClueOverlay.showClueDialog(
                    dialog: ClueOkDialog(
                      title: '제목',
                      body: Center(
                        child: ClueText(
                          '해당 일정을 삭제하시겠습니끼?\n\n삭제시 기존 메일 내용은 더이상 \n유효 하지 않습니다. \n\n계속 하시겠습니까?',
                          style: MyTextStyle.size18.w500.xFF000000,
                          textAlign: TextAlign.center,
                          targetList: [
                            TargetModel(
                              text: '삭제시 기존 메일 내용은 더이상 \n유효 하지 않습니다.',
                              style: MyTextStyle.size18.w500.xFF6682FF,
                            ),
                          ],
                        ),
                      ),
                      okButtonText: '확인',
                    ),
                    navigatorKey: rootNavigatorKey,
                  );
                  if (result == DialogState.ok) {
                    ClueOverlay.showSuccessToast('DialogState.ok', rootNavigatorKey);
                  } else {
                    ClueOverlay.showErrorToast('DialogState.cancel', rootNavigatorKey);
                  }
                },
                child: const ClueText('OK Dialog'),
              ),
              OutlinedButton(
                onPressed: () async {
                  var result = await ClueOverlay.showClueDialog(
                    dialog: ClueOkCancelDialog(
                      title: '방문정보1234',
                      body: Center(
                        child: ClueText(
                          '해당 일정을 삭제하시겠습니끼?\n\n삭제시 기존 메일 내용은 더이상 \n유효 하지 않습니다. \n\n계속 하시겠습니까?',
                          style: MyTextStyle.size18.w500.xFF000000,
                          textAlign: TextAlign.center,
                          targetList: [
                            TargetModel(
                              text: '삭제시 기존 메일 내용은 더이상 \n유효 하지 않습니다.',
                              style: MyTextStyle.size18.w500.xFF6682FF,
                            ),
                          ],
                        ),
                      ),
                      okButtonText: '확인',
                      cancelButtonText: '취소',
                    ),
                    navigatorKey: rootNavigatorKey,
                  );
                  if (result == DialogState.ok) {
                    ClueOverlay.showSuccessToast('DialogState.ok', rootNavigatorKey);
                  } else {
                    ClueOverlay.showErrorToast('DialogState.cancel', rootNavigatorKey);
                  }
                },
                child: const ClueText('OK Cancel Dialog'),
              )
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('Calendar(Date)', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () async {
                  var results = await ClueOverlay.showCalendarSingle(initDateTime: DateTime.now(), navigatorKey: rootNavigatorKey);
                  if (results == null) {
                    ClueOverlay.showErrorToast('result : $results', rootNavigatorKey);
                  } else {
                    ClueOverlay.showSuccessToast('result : $results', rootNavigatorKey);
                  }
                },
                child: const ClueText('showCalendarSingle'),
              ),
              const Gap(8),
              OutlinedButton(
                onPressed: () async {
                  var results = await ClueOverlay.showCalendarMulti(initDateTime: [
                    DateTime.now().subtract(const Duration(days: 2)),
                    DateTime.now().subtract(const Duration(days: 1)),
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 1)),
                    DateTime.now().add(const Duration(days: 2)),
                  ], navigatorKey: rootNavigatorKey);
                  if (results == null) {
                    ClueOverlay.showErrorToast('result : $results', rootNavigatorKey);
                  } else {
                    ClueOverlay.showSuccessToast('result : $results', rootNavigatorKey);
                  }
                },
                child: const ClueText('showCalendarMulti'),
              ),
              const Gap(8),
              OutlinedButton(
                onPressed: () async {
                  var results = await ClueOverlay.showCalendarRange(initDateTime: (
                    startDate: DateTime.now().subtract(const Duration(days: 2)),
                    endDate: DateTime.now().add(const Duration(days: 2)),
                  ), navigatorKey: rootNavigatorKey);
                  if (results == null) {
                    ClueOverlay.showErrorToast('result : $results', rootNavigatorKey);
                  } else {
                    ClueOverlay.showSuccessToast('result : $results', rootNavigatorKey);
                  }
                },
                child: const ClueText('showCalendarRange'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('Calendar(Time)', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              OutlinedButton(
                onPressed: () async {
                  var results = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 22, minute: 33),
                    initialEntryMode: TimePickerEntryMode.inputOnly,
                  );
                  if (results == null) {
                    ClueOverlay.showErrorToast('result : $results', rootNavigatorKey);
                  } else {
                    ClueOverlay.showSuccessToast('result : $results', rootNavigatorKey);
                  }
                },
                child: const ClueText('showTimePicker'),
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueDropDownList', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ClueDropDownButton<ServerErrorCode, String>(
                width: 200,
                blockKeyList: const [ServerErrorCode.v9999],
                borderColor: MyColors.xFFFF5252,
                itemMap: {
                  ServerErrorCode.v0000: ServerErrorCode.v0000.locale,
                  ServerErrorCode.v1000: ServerErrorCode.v1000.locale,
                  ServerErrorCode.v9999: ServerErrorCode.v9999.locale,
                },
                onChanged: (key) {
                  ClueOverlay.showSuccessToast('key:$key', rootNavigatorKey);
                },
              ),
              ClueDropDownButton(
                width: 200,
                blockKeyList: const [1],
                itemMap: const [
                  '상태',
                  '상태1',
                  '상태2',
                  '상태3',
                  '상태4',
                  '상태5',
                  '상태6',
                ].toIndexKeyMap(),
                onChanged: (index) {
                  ClueOverlay.showSuccessToast('index:$index', rootNavigatorKey);
                },
              ),
            ],
          ),
          const Gap(16),
          const ClueDivider(),
          const Gap(16),
          ClueText('ClueDropDownCheckList', style: MyTextStyle.size20.w700),
          const Gap(8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ClueDropDownCheckButton(
                title: '방문 목적',
                width: 200,
                selectedKeyList: const [0, 2],
                blockKeyList: const [1],
                itemMap: [
                  '1층 공용부',
                  '2층 공용부',
                  '3층 공용부',
                ].toIndexKeyMap(),
                onChanged: (selectedIndexList, selectedValueList) {
                  ClueOverlay.showSuccessToast('index:$selectedIndexList / value:$selectedValueList', rootNavigatorKey);
                },
                allSelectText: '전체선택',
                notSelectText: '선택안함',
              ),
              ClueDropDownCheckButton(
                title: '방문 목적',
                width: 200,
                itemMap: const {
                  1515: '1층',
                  5551: '2층',
                  7757: '3층',
                  9999: '4층',
                },
                blockKeyList: const [1515],
                onChanged: (selectedIndexList, selectedValueList) {
                  ClueOverlay.showSuccessToast('index:$selectedIndexList / value:$selectedValueList', rootNavigatorKey);
                },
                allSelectText: '전체선택',
                notSelectText: '선택안함',
              ),
              // ClueDropDownCheckList<String>(
              //   title: '상태',
              //   width: 200,
              //   blockIndexList: const [4, 5],
              //   itemList: const [
              //     '방문 취소',
              //     '방문 기간',
              //     '방문 예정',
              //     '방문 완료1',
              //     '방문 완료2',
              //     '방문 완료3',
              //   ],
              //   onChanged: (selectedIndexList, selectedValueList) {
              //     ClueOverlay.showSuccessToast('index:$selectedIndexList / value:$selectedValueList');
              //   },
              // ),
              // ClueDropDownCheckList<String>(
              //   width: 200,
              //   itemList: const [
              //     '방문 취소',
              //     '방문 기간',
              //     '방문 예정',
              //   ],
              //   onChanged: (selectedIndexList, selectedValueList) {
              //     ClueOverlay.showSuccessToast('index:$selectedIndexList / value:$selectedValueList');
              //   },
              // ),
            ],
          ),
          const Gap(400),
        ],
      ),
    );
  }
}
