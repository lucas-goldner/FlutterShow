import 'package:flutter/cupertino.dart';
import 'package:flutter_show/components/widgets/layout/layout_footer.dart';
import 'package:flutter_show/components/widgets/text/footer_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget() => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutFooter(
                  const FooterText('FooterText'),
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render footer text', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(FooterText), findsOneWidget);
    expect(find.text('FooterText'), findsOneWidget);
  });
}
