import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/view/presentation_slides.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyPresentation()));
}

class MyPresentation extends StatelessWidget {
  const MyPresentation({super.key});

  @override
  Widget build(BuildContext context) => CupertinoApp(
        key: const Key('MainApp'),
        home: const PresentationSlides(),
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
}
