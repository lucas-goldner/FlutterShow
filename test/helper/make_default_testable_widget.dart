import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/main.dart';

Widget makeDefaultTestableWidget(Widget? widget) => CupertinoApp(
      key: const Key('MainApp'),
      home: widget ?? const MyFluttershow(),
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
