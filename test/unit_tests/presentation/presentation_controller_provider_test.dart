import 'package:flutter/material.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('Test presentation controller provider', () {
    test('test initial state page is 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );
    });

    test('test go to last page when 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );

      container
          .read<PresentationController>(presentationController.notifier)
          .toLastPage();

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );
    });

    test('test togglemenu', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .menuOpen,
        false,
      );

      container
          .read<PresentationController>(presentationController.notifier)
          .toggleMenu();

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .menuOpen,
        true,
      );
    });

    test('test brightness', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .brightness,
        Brightness.light,
      );

      container
          .read<PresentationController>(presentationController.notifier)
          .setBrightness(Brightness.dark);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .brightness,
        Brightness.dark,
      );
    });
  });
}
