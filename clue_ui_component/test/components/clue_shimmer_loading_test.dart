import 'package:clue_ui_component/components/clue_shimmer_loading.dart';
import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  testWidgets('ClueShimmerLoading 위젯 테스트', (WidgetTester tester) async {
    // 위젯 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClueShimmerLoading.top(),
        ),
      ),
    );

    // Shimmer 위젯이 있는지 확인
    expect(find.byType(Shimmer), findsOneWidget);

    // 메인 Container가 있는지 확인
    expect(find.byType(Container), findsNWidgets(3));

    // LayoutBuilder가 있는지 확인
    expect(find.byType(LayoutBuilder), findsOneWidget);

    // Row가 있는지 확인
    expect(find.byType(Row), findsOneWidget);

    // 내부 Container들이 있는지 확인
    expect(find.byType(Container), findsNWidgets(3));

    // 메인 Container의 데코레이션이 올바른지 확인
    final container = tester.widget<Container>(find.byType(Container).first);
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.border, Border.all(color: const Color(0xFFE2E8F0)));
    expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(5)));

    // 메인 Container의 크기와 패딩이 올바른지 확인
    expect(container.constraints, BoxConstraints.tightFor(height: 100));
    expect(container.padding, const EdgeInsets.all(16));

    // 내부 Container들의 색상이 올바른지 확인
    final innerContainers = tester.widgetList<Container>(find.byType(Container)).skip(1).toList();
    expect(innerContainers[0].color, MyColors.xFFFFFFFF);
    expect(innerContainers[1].color, MyColors.xFFFFFFFF);
  });
}
