import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/presentation/config/cursor_style.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('Test presentation controller provider', () {
    test('test initial state page is 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.page, 0);
    });

    test('test go to last page when 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.page, 0);
      controller.toLastPage();
      expect(controller.state.page, 0);
    });

    test('test togglemenu', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.menuOpen, false);
      controller.toggleMenu();
      expect(controller.state.menuOpen, true);
      controller.toggleMenu();
      expect(controller.state.menuOpen, false);
    });

    test('test brightness', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.brightness, Brightness.light);
      controller.setBrightness(Brightness.dark);
      expect(controller.state.brightness, Brightness.dark);
    });

    test('test locale', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.locale, const Locale('en'));
      controller.setLocale(const Locale('de'));
      expect(controller.state.locale, const Locale('de'));
    });

    test('test cursor style', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.cursorStyle, CursorStyle.basic);
      controller.setCursorStyle(CursorStyle.custom);
      expect(controller.state.cursorStyle, CursorStyle.custom);
    });

    test('test toggle mouse visibility', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.cursorStyle, CursorStyle.basic);
      controller.toggleMouseVisibility();
      expect(controller.state.cursorStyle, CursorStyle.hidden);
      controller.toggleMouseVisibility();
      expect(controller.state.cursorStyle, CursorStyle.basic);
    });

    test('test open menu and show cursor when hidden before', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.cursorStyle, CursorStyle.basic);
      expect(controller.state.menuOpen, false);
      controller.toggleMouseVisibility();
      expect(controller.state.cursorStyle, CursorStyle.hidden);
      controller.toggleMenu();
      expect(controller.state.cursorStyle, CursorStyle.basic);
      expect(controller.state.menuOpen, true);
    });
  });

  group('Test presentation controller provider key event related tests', () {
    const oKey = 31;
    const mKey = 46;

    test('test toggle mouse visibility', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.cursorStyle, CursorStyle.basic);
      controller.handleKeyEvents(
        const RawKeyDownEvent(
          data: RawKeyEventDataMacOs(
            keyCode: oKey,
          ),
        ),
      );
      expect(controller.state.cursorStyle, CursorStyle.hidden);
    });

    test('test toggle menu', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final controller = container
          .read<PresentationController>(presentationController.notifier);
      expect(controller.state.menuOpen, false);
      controller.handleKeyEvents(
        const RawKeyDownEvent(
          data: RawKeyEventDataMacOs(
            keyCode: mKey,
          ),
        ),
      );
      expect(controller.state.menuOpen, true);
    });
  });
}
