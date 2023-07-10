import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/main.dart';
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

  testWidgets('test render main test', (tester) async {
    await tester.pumpWidget(ProviderScope(child: makeTestableWidget()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(MyPresentation), findsOneWidget);
    expect(find.text(S.of(buildContext).presentationTitle), findsOneWidget);
  });
}
