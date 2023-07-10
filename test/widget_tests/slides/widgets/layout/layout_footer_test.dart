import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/model/enum/layout_flex_units.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_footer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget({int? flexUnits}) => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutFooter(
                  const SizedBox(
                    key: Key('FooterItemKey'),
                  ),
                  flexUnits: flexUnits ?? LayoutFlexUnits.footer.flexUnits,
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render layout footer', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutFooter), findsOneWidget);
    expect(find.byKey(const Key('FooterItemKey')), findsOneWidget);
  });

  testWidgets('test render layout footer with default flexunits',
      (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutFooter), findsOneWidget);
    expect(find.byKey(const Key('FooterItemKey')), findsOneWidget);

    final layoutFooter =
        tester.firstWidget(find.byType(LayoutFooter)) as LayoutFooter;
    expect(layoutFooter.layoutFlexUnits, LayoutFlexUnits.footer.flexUnits);
  });

  testWidgets('test render layout footer with specific flexunits',
      (tester) async {
    await tester.pumpWidget(makeWidget(flexUnits: 6));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LayoutFooter), findsOneWidget);
    expect(find.byKey(const Key('FooterItemKey')), findsOneWidget);

    final layoutFooter =
        tester.firstWidget(find.byType(LayoutFooter)) as LayoutFooter;
    expect(layoutFooter.layoutFlexUnits, 6);
  });
}
