import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/presentation/model/presentation.dart';

void main() {
  group('Test presentation model', () {
    test('test presentation copyWith page', () {
      final pre = Presentation(0, 0, const Locale('en'), PageController());

      expect(1, pre.copyWith(page: 1).page);
    });

    test('test presentation copyWith locale', () {
      final pre = Presentation(0, 0, const Locale('en'), PageController());

      expect(
        const Locale('de').languageCode,
        pre.copyWith(locale: const Locale('de')).locale.languageCode,
      );
    });

    test('test presentation copyWith entire presentation', () {
      final pre = Presentation(0, 0, const Locale('en'), PageController());
      final newPre = pre.copyWith(page: 1, locale: const Locale('de'));

      expect(
        const Locale('de').languageCode,
        newPre.locale.languageCode,
      );
      expect(1, newPre.page);
    });
  });

  test('test presentation copyWith itemIndex', () {
    final pre = Presentation(0, 0, const Locale('en'), PageController());

    expect(
      2,
      pre.copyWith(itemIndex: 2).itemIndex,
    );
  });
}
