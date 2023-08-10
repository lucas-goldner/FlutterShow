import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/main.dart';
import 'package:flutter_show/presentation/widgets/menu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  const keyOne = Key('Slide-1');
  const keyTwo = Key('Slide-2');
  final widgetOneFinder = find.byKey(keyOne);
  final widgetTwoFinder = find.byKey(keyTwo);
  final presentationSlidesToTest = <PresentationSlide>[
    const PresentationSlide(
      slideWidget: SizedBox(
        key: keyOne,
      ),
    ),
    const PresentationSlide(
      slideWidget: SizedBox(
        key: keyTwo,
      ),
      title: 'Slide-2-Preview',
    ),
  ];

  Future<void> pumpPresentation(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MyFlutterShow(slides: presentationSlidesToTest),
      ),
    );
  }

  group('Test menu', () {
    testWidgets('test open menu', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await simulateKeyDownEvent(
        LogicalKeyboardKey.keyM,
        physicalKey: PhysicalKeyboardKey.keyM,
      );
      await tester.pumpAndSettle();
      final menuFinder = find.byType(Menu);
      expect(menuFinder, findsOneWidget);
    });

    testWidgets('test menu travel to slide', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await simulateKeyDownEvent(
        LogicalKeyboardKey.keyM,
        physicalKey: PhysicalKeyboardKey.keyM,
      );
      await tester.pumpAndSettle();
      final menuFinder = find.byType(Menu);
      expect(menuFinder, findsOneWidget);
      final slideTwoFinder = find.text('Slide-2-Preview');
      await tester.tap(slideTwoFinder);
      await tester.pumpAndSettle();
      expect(widgetTwoFinder, findsOneWidget);
    });
  });
}
