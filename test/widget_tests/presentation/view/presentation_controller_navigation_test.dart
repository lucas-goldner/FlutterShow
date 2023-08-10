import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/main.dart';
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
    ),
  ];
  Future<void> pumpPresentation(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MyFlutterShow(slides: presentationSlidesToTest),
      ),
    );
  }

  group('Test navigation using taps', () {
    testWidgets('test navigate to the next page', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await tester.tap(presentation);
      await tester.pumpAndSettle();
      expect(widgetTwoFinder, findsOneWidget);
    });

    testWidgets('test navigate to the next page and back', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await tester.tap(presentation);
      await tester.pumpAndSettle();
      expect(widgetOneFinder, findsNothing);
      expect(widgetTwoFinder, findsOneWidget);
      await tester.tap(
        widgetTwoFinder,
        buttons: kSecondaryButton,
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();
      expect(widgetTwoFinder, findsNothing);
      expect(widgetOneFinder, findsOneWidget);
    });
  });

  group('Test navigation using keys', () {
    testWidgets('test navigate to the next page', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await simulateKeyDownEvent(
        LogicalKeyboardKey.arrowRight,
        physicalKey: PhysicalKeyboardKey.arrowRight,
      );
      await tester.pumpAndSettle();
      expect(widgetTwoFinder, findsOneWidget);
    });

    testWidgets('test navigate to the next page and back', (tester) async {
      await pumpPresentation(tester);
      final presentation = find.byType(MyFlutterShow);
      expect(presentation, findsOneWidget);
      expect(widgetOneFinder, findsOneWidget);
      await simulateKeyDownEvent(
        LogicalKeyboardKey.arrowRight,
        physicalKey: PhysicalKeyboardKey.arrowRight,
      );
      await tester.pumpAndSettle();
      expect(widgetOneFinder, findsNothing);
      expect(widgetTwoFinder, findsOneWidget);
      await simulateKeyDownEvent(
        LogicalKeyboardKey.arrowLeft,
        physicalKey: PhysicalKeyboardKey.arrowLeft,
      );
      await tester.pumpAndSettle();
      expect(widgetOneFinder, findsOneWidget);
      expect(widgetTwoFinder, findsNothing);
    });
  });
}
