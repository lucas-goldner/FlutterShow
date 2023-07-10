import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/model/enum/layout_flex_units.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget({int? flexUnits}) => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutBody(
                  const SizedBox(
                    key: Key('BodyItemKey'),
                  ),
                  flexUnits: flexUnits ?? LayoutFlexUnits.body.flexUnits,
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render layout body', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutBody), findsOneWidget);
    expect(find.byKey(const Key('BodyItemKey')), findsOneWidget);
  });

  testWidgets('test render layout body with default flexunits', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutBody), findsOneWidget);
    expect(find.byKey(const Key('BodyItemKey')), findsOneWidget);

    final layoutBody =
        tester.firstWidget(find.byType(LayoutBody)) as LayoutBody;
    expect(layoutBody.layoutFlexUnits, LayoutFlexUnits.body.flexUnits);
  });

  testWidgets('test render layout body with specific flexunits',
      (tester) async {
    await tester.pumpWidget(makeWidget(flexUnits: 6));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutBody), findsOneWidget);
    expect(find.byKey(const Key('BodyItemKey')), findsOneWidget);

    final layoutBody =
        tester.firstWidget(find.byType(LayoutBody)) as LayoutBody;
    expect(layoutBody.layoutFlexUnits, 6);
  });
}
