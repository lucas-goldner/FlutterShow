import 'package:flutter/material.dart';
import 'package:flutter_show/presentation/model/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test presentation copyWith', () {
    test('test presentation copyWith animationIndex', () {
      final pre = Presentation(
        animationIndex: 0,
        page: 0,
        locale: const Locale('en'),
        brightness: Brightness.dark,
        menuOpen: false,
        pageController: PageController(),
      );

      expect(
        2,
        pre.copyWith(animationIndex: 2).animationIndex,
      );
    });

    test('test presentation copyWith page', () {
      final pre = Presentation(
        animationIndex: 0,
        page: 0,
        locale: const Locale('en'),
        brightness: Brightness.dark,
        menuOpen: false,
        pageController: PageController(),
      );

      expect(1, pre.copyWith(page: 1).page);
    });

    test('test presentation copyWith locale', () {
      final pre = Presentation(
        animationIndex: 0,
        page: 0,
        locale: const Locale('en'),
        brightness: Brightness.dark,
        menuOpen: false,
        pageController: PageController(),
      );

      expect(
        const Locale('de').languageCode,
        pre.copyWith(locale: const Locale('de')).locale.languageCode,
      );
    });

    test('test presentation copyWith brightness', () {
      final pre = Presentation(
        animationIndex: 0,
        page: 0,
        locale: const Locale('en'),
        brightness: Brightness.dark,
        menuOpen: false,
        pageController: PageController(),
      );

      expect(
        Brightness.light,
        pre.copyWith(brightness: Brightness.light).brightness,
      );
    });

    test('test presentation copyWith menuOpen', () {
      final pre = Presentation(
        animationIndex: 0,
        page: 0,
        locale: const Locale('en'),
        brightness: Brightness.dark,
        menuOpen: false,
        pageController: PageController(),
      );

      expect(
        true,
        pre.copyWith(menuOpen: true).menuOpen,
      );
    });
  });
}
