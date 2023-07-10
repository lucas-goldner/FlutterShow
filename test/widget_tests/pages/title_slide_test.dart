import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_show/components/widgets/text/footer_text.dart';
import 'package:flutter_show/components/widgets/text/regular_text.dart';
import 'package:flutter_show/components/widgets/text/title.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/main.dart';
import 'package:flutter_show/presentation/view/presentation_slides.dart';
import 'package:flutter_show/slides/01_title/view/title_slide.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  late BuildContext buildContext;

  Widget makeTestableWidget() => CupertinoApp(
        key: const Key('MainApp'),
        home: Builder(
          builder: (context) {
            buildContext = context;
            return const MyPresentation();
          },
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en'),
      );

  testWidgets('Test render title slide', (tester) async {
    await tester.pumpWidget(ProviderScope(child: makeTestableWidget()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
    expect(find.byType(TitleSlide), findsOneWidget);
  });

  testWidgets('Test render find title', (tester) async {
    await tester.pumpWidget(ProviderScope(child: makeTestableWidget()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
    expect(find.byType(TitleSlide), findsOneWidget);
    expect(find.text(S.of(buildContext).flutterShow), findsOneWidget);
    expect(find.byType(TextTitle), findsOneWidget);
  });

  testWidgets('Test render find subtitle', (tester) async {
    await tester.pumpWidget(ProviderScope(child: makeTestableWidget()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
    expect(find.byType(TitleSlide), findsOneWidget);
    expect(
      find.text(S.of(buildContext).presentationsInFlutter),
      findsOneWidget,
    );
    expect(find.byType(RegularText), findsOneWidget);
  });

  testWidgets('Test render find footer', (tester) async {
    await tester.pumpWidget(ProviderScope(child: makeTestableWidget()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
    expect(find.byType(TitleSlide), findsOneWidget);
    expect(find.text(S.of(buildContext).author), findsOneWidget);
    expect(find.byType(FooterText), findsOneWidget);
  });
}
