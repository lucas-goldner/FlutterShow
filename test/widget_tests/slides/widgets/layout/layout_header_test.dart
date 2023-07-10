import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/model/enum/layout_flex_units.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget({int? flexUnits}) => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutHeader(
                  const SizedBox(
                    key: Key('HeaderItemKey'),
                  ),
                  flexUnits: flexUnits ?? LayoutFlexUnits.header.flexUnits,
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render layout header', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutHeader), findsOneWidget);
    expect(find.byKey(const Key('HeaderItemKey')), findsOneWidget);
  });

  testWidgets('test render layout header with default flexunits',
      (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutHeader), findsOneWidget);
    expect(find.byKey(const Key('HeaderItemKey')), findsOneWidget);

    final layoutHeader =
        tester.firstWidget(find.byType(LayoutHeader)) as LayoutHeader;
    expect(layoutHeader.layoutFlexUnits, LayoutFlexUnits.header.flexUnits);
  });

  testWidgets('test render layout header with specific flexunits',
      (tester) async {
    await tester.pumpWidget(makeWidget(flexUnits: 6));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutHeader), findsOneWidget);
    expect(find.byKey(const Key('HeaderItemKey')), findsOneWidget);

    final layoutHeader =
        tester.firstWidget(find.byType(LayoutHeader)) as LayoutHeader;
    expect(layoutHeader.layoutFlexUnits, 6);
  });
}
