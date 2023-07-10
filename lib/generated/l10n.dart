// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FFIGen - The solution ?`
  String get presentationTitle {
    return Intl.message(
      'FFIGen - The solution ?',
      name: 'presentationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Comparing ways of accessing native functions`
  String get presentationSubtitle {
    return Intl.message(
      'Comparing ways of accessing native functions',
      name: 'presentationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Lucas Goldner, 10.05.2023`
  String get presentationFooter {
    return Intl.message(
      'Lucas Goldner, 10.05.2023',
      name: 'presentationFooter',
      desc: '',
      args: [],
    );
  }

  /// `Agenda`
  String get agenda {
    return Intl.message(
      'Agenda',
      name: 'agenda',
      desc: '',
      args: [],
    );
  }

  /// `Prologue`
  String get prologue {
    return Intl.message(
      'Prologue',
      name: 'prologue',
      desc: '',
      args: [],
    );
  }

  /// `Method / Eventchannels`
  String get methodEventChannels {
    return Intl.message(
      'Method / Eventchannels',
      name: 'methodEventChannels',
      desc: '',
      args: [],
    );
  }

  /// `FFIGen Setup`
  String get ffigenSetup {
    return Intl.message(
      'FFIGen Setup',
      name: 'ffigenSetup',
      desc: '',
      args: [],
    );
  }

  /// `Run FFIGen`
  String get runFfigen {
    return Intl.message(
      'Run FFIGen',
      name: 'runFfigen',
      desc: '',
      args: [],
    );
  }

  /// `Benefits and downsides`
  String get benefitsAndDownsides {
    return Intl.message(
      'Benefits and downsides',
      name: 'benefitsAndDownsides',
      desc: '',
      args: [],
    );
  }

  /// `Pushups: {count} / 5`
  String pushups(Object count) {
    return Intl.message(
      'Pushups: $count / 5',
      name: 'pushups',
      desc: '',
      args: [count],
    );
  }

  /// `Motivation`
  String get motivation {
    return Intl.message(
      'Motivation',
      name: 'motivation',
      desc: '',
      args: [],
    );
  }

  /// `Method Channel`
  String get methodChannel {
    return Intl.message(
      'Method Channel',
      name: 'methodChannel',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get flutter {
    return Intl.message(
      'Flutter',
      name: 'flutter',
      desc: '',
      args: [],
    );
  }

  /// `Event Channel`
  String get eventChannels {
    return Intl.message(
      'Event Channel',
      name: 'eventChannels',
      desc: '',
      args: [],
    );
  }

  /// `Invokes functions`
  String get invokeFunctions {
    return Intl.message(
      'Invokes functions',
      name: 'invokeFunctions',
      desc: '',
      args: [],
    );
  }

  /// `Receives value`
  String get receiveValue {
    return Intl.message(
      'Receives value',
      name: 'receiveValue',
      desc: '',
      args: [],
    );
  }

  /// `Starts listening`
  String get startsListening {
    return Intl.message(
      'Starts listening',
      name: 'startsListening',
      desc: '',
      args: [],
    );
  }

  /// `Implements FlutterStreamHandler interface`
  String get implementsFlutterStreamHandler {
    return Intl.message(
      'Implements FlutterStreamHandler interface',
      name: 'implementsFlutterStreamHandler',
      desc: '',
      args: [],
    );
  }

  /// `Receives Events from Stream`
  String get receivesEvents {
    return Intl.message(
      'Receives Events from Stream',
      name: 'receivesEvents',
      desc: '',
      args: [],
    );
  }

  /// `Typical way`
  String get TypicalWay {
    return Intl.message(
      'Typical way',
      name: 'TypicalWay',
      desc: '',
      args: [],
    );
  }

  /// `Eventchannel - Flutter setup`
  String get eventChannelsFlutter {
    return Intl.message(
      'Eventchannel - Flutter setup',
      name: 'eventChannelsFlutter',
      desc: '',
      args: [],
    );
  }

  /// `Eventchannel - iOS setup`
  String get eventChannelsiOS {
    return Intl.message(
      'Eventchannel - iOS setup',
      name: 'eventChannelsiOS',
      desc: '',
      args: [],
    );
  }

  /// `FFIGen`
  String get ffigen {
    return Intl.message(
      'FFIGen',
      name: 'ffigen',
      desc: '',
      args: [],
    );
  }

  /// `FFI -> Foreign function interface`
  String get ffiExplain {
    return Intl.message(
      'FFI -> Foreign function interface',
      name: 'ffiExplain',
      desc: '',
      args: [],
    );
  }

  /// `Bindings generator for FFI bindings`
  String get ffigenexplain {
    return Intl.message(
      'Bindings generator for FFI bindings',
      name: 'ffigenexplain',
      desc: '',
      args: [],
    );
  }

  /// `Generation requires config`
  String get requiresConfig {
    return Intl.message(
      'Generation requires config',
      name: 'requiresConfig',
      desc: '',
      args: [],
    );
  }

  /// `Compatible with various languages`
  String get compatibleLanguages {
    return Intl.message(
      'Compatible with various languages',
      name: 'compatibleLanguages',
      desc: '',
      args: [],
    );
  }

  /// `The master file`
  String get theMasterFile {
    return Intl.message(
      'The master file',
      name: 'theMasterFile',
      desc: '',
      args: [],
    );
  }

  /// `Include framework`
  String get includeFramework {
    return Intl.message(
      'Include framework',
      name: 'includeFramework',
      desc: '',
      args: [],
    );
  }

  /// `Using the bindings`
  String get usingTheBindings {
    return Intl.message(
      'Using the bindings',
      name: 'usingTheBindings',
      desc: '',
      args: [],
    );
  }

  /// `Downsides`
  String get downsides {
    return Intl.message(
      'Downsides',
      name: 'downsides',
      desc: '',
      args: [],
    );
  }

  /// `Benefits`
  String get benefits {
    return Intl.message(
      'Benefits',
      name: 'benefits',
      desc: '',
      args: [],
    );
  }

  /// `Initial setup can take time`
  String get downsideSetup {
    return Intl.message(
      'Initial setup can take time',
      name: 'downsideSetup',
      desc: '',
      args: [],
    );
  }

  /// `Output can be difficult`
  String get downsideOutput {
    return Intl.message(
      'Output can be difficult',
      name: 'downsideOutput',
      desc: '',
      args: [],
    );
  }

  /// `Less 'control' than using methodchannels`
  String get downsideControl {
    return Intl.message(
      'Less \'control\' than using methodchannels',
      name: 'downsideControl',
      desc: '',
      args: [],
    );
  }

  /// `Possible to will not work (ObjC and Swift)`
  String get downsideWontwork {
    return Intl.message(
      'Possible to will not work (ObjC and Swift)',
      name: 'downsideWontwork',
      desc: '',
      args: [],
    );
  }

  /// `Fast development`
  String get benefitFast {
    return Intl.message(
      'Fast development',
      name: 'benefitFast',
      desc: '',
      args: [],
    );
  }

  /// `Only one config file`
  String get benefitConfig {
    return Intl.message(
      'Only one config file',
      name: 'benefitConfig',
      desc: '',
      args: [],
    );
  }

  /// `Highly customizable`
  String get benefitCustomizable {
    return Intl.message(
      'Highly customizable',
      name: 'benefitCustomizable',
      desc: '',
      args: [],
    );
  }

  /// `Testable`
  String get benefitTestable {
    return Intl.message(
      'Testable',
      name: 'benefitTestable',
      desc: '',
      args: [],
    );
  }

  /// `Supports various languages`
  String get benefitManyLanguages {
    return Intl.message(
      'Supports various languages',
      name: 'benefitManyLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Thanks`
  String get thanks {
    return Intl.message(
      'Thanks',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `https://github.com/lucas-goldner/fluttercon_2023_presentation`
  String get repoLink {
    return Intl.message(
      'https://github.com/lucas-goldner/fluttercon_2023_presentation',
      name: 'repoLink',
      desc: '',
      args: [],
    );
  }

  /// `Dart`
  String get dart {
    return Intl.message(
      'Dart',
      name: 'dart',
      desc: '',
      args: [],
    );
  }

  /// `Swift`
  String get swift {
    return Intl.message(
      'Swift',
      name: 'swift',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
