import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_footer.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget() => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutFooter(
                  const RegularText('RegularText'),
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render regular text', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(RegularText), findsOneWidget);
    expect(find.text('RegularText'), findsOneWidget);
  });
}
