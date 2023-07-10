import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/gradient_text.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget() => ProviderScope(
        child: makeDefaultTestableWidget(
          const CupertinoPageScaffold(
            child: Column(
              children: [
                GradientText('GradientText', gradient: FCGradients.titlePrimary)
              ],
            ),
          ),
        ),
      );

  testWidgets('test render gradient text', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(GradientText), findsOneWidget);
    expect(find.text('GradientText'), findsOneWidget);
  });
}
