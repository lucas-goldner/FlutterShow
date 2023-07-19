import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/view/presentation_slides.dart';
import 'package:flutter_show/styles/theme/dark_theme.dart';
import 'package:flutter_show/styles/theme/light_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyFlutterShow()));
}

class MyFlutterShow extends ConsumerWidget {
  const MyFlutterShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(presentationController);

    return CupertinoApp(
      key: const Key('FlutterShow'),
      theme: controller.brightness == Brightness.dark ? darkTheme : lightTheme,
      home: const PresentationSlides(),
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
