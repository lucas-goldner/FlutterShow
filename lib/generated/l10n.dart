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

  /// `FlutterShow`
  String get flutterShow {
    return Intl.message(
      'FlutterShow',
      name: 'flutterShow',
      desc: '',
      args: [],
    );
  }

  /// `Presentations made easy in Flutter`
  String get presentationsInFlutter {
    return Intl.message(
      'Presentations made easy in Flutter',
      name: 'presentationsInFlutter',
      desc: '',
      args: [],
    );
  }

  /// `Made by Lucas Goldner`
  String get author {
    return Intl.message(
      'Made by Lucas Goldner',
      name: 'author',
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

  /// `Party 🎉`
  String get party {
    return Intl.message(
      'Party 🎉',
      name: 'party',
      desc: '',
      args: [],
    );
  }

  /// `Motiviation`
  String get motiviation {
    return Intl.message(
      'Motiviation',
      name: 'motiviation',
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

  /// `Really bad`
  String get reallyBad {
    return Intl.message(
      'Really bad',
      name: 'reallyBad',
      desc: '',
      args: [],
    );
  }

  /// `Annoying`
  String get annoying {
    return Intl.message(
      'Annoying',
      name: 'annoying',
      desc: '',
      args: [],
    );
  }

  /// `Lazy`
  String get lazy {
    return Intl.message(
      'Lazy',
      name: 'lazy',
      desc: '',
      args: [],
    );
  }

  /// `Boring`
  String get boring {
    return Intl.message(
      'Boring',
      name: 'boring',
      desc: '',
      args: [],
    );
  }

  /// `Its not Flutter`
  String get notFlutter {
    return Intl.message(
      'Its not Flutter',
      name: 'notFlutter',
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

  /// `Great`
  String get great {
    return Intl.message(
      'Great',
      name: 'great',
      desc: '',
      args: [],
    );
  }

  /// `Awesome`
  String get awesome {
    return Intl.message(
      'Awesome',
      name: 'awesome',
      desc: '',
      args: [],
    );
  }

  /// `Outstanding`
  String get outstanding {
    return Intl.message(
      'Outstanding',
      name: 'outstanding',
      desc: '',
      args: [],
    );
  }

  /// `Amazing`
  String get amazing {
    return Intl.message(
      'Amazing',
      name: 'amazing',
      desc: '',
      args: [],
    );
  }

  /// `Made with Flutter💙`
  String get madeWithFlutter {
    return Intl.message(
      'Made with Flutter💙',
      name: 'madeWithFlutter',
      desc: '',
      args: [],
    );
  }

  /// `Thanks!`
  String get thanks {
    return Intl.message(
      'Thanks!',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `https://github.com/lucas-goldner/FlutterShow`
  String get repoLink {
    return Intl.message(
      'https://github.com/lucas-goldner/FlutterShow',
      name: 'repoLink',
      desc: '',
      args: [],
    );
  }

  /// `Side Widget`
  String get sideWidget {
    return Intl.message(
      'Side Widget',
      name: 'sideWidget',
      desc: '',
      args: [],
    );
  }

  /// `Step One`
  String get step1 {
    return Intl.message(
      'Step One',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `Step Two`
  String get step2 {
    return Intl.message(
      'Step Two',
      name: 'step2',
      desc: '',
      args: [],
    );
  }

  /// `Step Two closer look`
  String get step2close {
    return Intl.message(
      'Step Two closer look',
      name: 'step2close',
      desc: '',
      args: [],
    );
  }

  /// `Step Three`
  String get step3 {
    return Intl.message(
      'Step Three',
      name: 'step3',
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
