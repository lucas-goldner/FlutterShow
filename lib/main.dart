import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/view/presentation_slides.dart';
import 'package:flutter_show/styles/theme/dark_theme.dart';
import 'package:flutter_show/styles/theme/light_theme.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyFlutterShow()));
}

class MyFlutterShow extends ConsumerWidget {
  const MyFlutterShow({this.slides, super.key});

  /// Used for widget tests, safe to ignore.
  @visibleForTesting
  final List<PresentationSlide>? slides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentation = ref.watch(presentationController);

    return CupertinoApp(
      key: const Key('FlutterShow'),
      locale: presentation.locale,
      theme:
          presentation.brightness == Brightness.dark ? darkTheme : lightTheme,
      home: FutureBuilder(
        future: presentation.cursorStyle.cursor,
        builder: (context, snapshot) => MouseRegion(
          cursor: snapshot.data ?? SystemMouseCursors.basic,
          child: PresentationSlides(slides: slides),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
