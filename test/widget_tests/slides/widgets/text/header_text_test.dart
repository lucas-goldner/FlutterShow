import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helper/make_default_testable_widget.dart';

void main() {
  Widget makeWidget() => ProviderScope(
        child: makeDefaultTestableWidget(
          CupertinoPageScaffold(
            child: Column(
              children: [
                LayoutHeader(
                  const TextTitle('Title'),
                ),
              ],
            ),
          ),
        ),
      );

  testWidgets('test render title text', (tester) async {
    await tester.pumpWidget(makeWidget());
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(TextTitle), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
  });
}
