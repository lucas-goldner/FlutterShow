import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/presentation/config/contants.dart';
import 'package:flutter_show/presentation/config/cursor_style.dart';
import 'package:flutter_show/presentation/config/key_actions.dart';
import 'package:flutter_show/presentation/config/presentation_slides.dart';
import 'package:flutter_show/presentation/model/presentation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationController extends StateNotifier<Presentation> {
  PresentationController()
      : super(
          Presentation(
            animationIndex: 0,
            page: 0,
            locale: const Locale('en'),
            menuOpen: false,
            brightness: PlatformDispatcher.instance.platformBrightness,
            pageController: PageController(),
          ),
        );

  KeyEventResult handleKeyEvents(
    RawKeyEvent event,
  ) {
    if (event is RawKeyDownEvent) {
      if (_hasTriggeredKeyAction(
        keyAction: KeyActions.goToLastSlide,
        physicalKeyboardKey: event.physicalKey,
      )) {
        goToLastItem();
        return KeyEventResult.handled;
      }

      if (_hasTriggeredKeyAction(
        keyAction: KeyActions.goToNextSlide,
        physicalKeyboardKey: event.physicalKey,
      )) {
        goToNextItem();
        return KeyEventResult.handled;
      }

      if (_hasTriggeredKeyAction(
        keyAction: KeyActions.openMenu,
        physicalKeyboardKey: event.physicalKey,
      )) {
        toggleMenu();
        return KeyEventResult.handled;
      }

      if (_hasTriggeredKeyAction(
        keyAction: KeyActions.showHideMouse,
        physicalKeyboardKey: event.physicalKey,
      )) {
        toggleMouseVisibility();
        return KeyEventResult.handled;
      }

      return KeyEventResult.ignored;
    }

    return KeyEventResult.ignored;
  }

  bool _hasTriggeredKeyAction({
    required KeyActions keyAction,
    required PhysicalKeyboardKey physicalKeyboardKey,
  }) =>
      keyAction.keybindings.any((key) => key == physicalKeyboardKey);

  /// This function is used in to increase the `animationIndex` to
  /// show or animate the next widget. If it hits the slides `animationSteps`
  /// it will switch to the next slide.
  void goToNextItem() {
    state = state.copyWith(animationIndex: state.animationIndex + 1);

    if (state.animationIndex >=
        PagesOfPresentation.values.toList()[state.page].slide.animationSteps) {
      nextPage();
    }
  }

  /// This function is used in to decrease the `animationIndex` to
  /// hide the current shown widget. If it hits the slides 0
  /// it will switch to the last slide.
  void goToLastItem() {
    if (state.animationIndex == 0) {
      toLastPage();
    } else {
      state = state.copyWith(animationIndex: state.animationIndex - 1);
    }
  }

  void nextPage() {
    if (state.page == PagesOfPresentation.values.length - 1) {
      state = state.copyWith(
        page: PagesOfPresentation.values.length - 1,
        animationIndex: 0,
      );
    } else {
      state.pageController.nextPage(
        duration: const Duration(
          milliseconds: AppConstants.pageControllerAnimationDuration,
        ),
        curve: AppConstants.pageControllerAnimationCurve,
      );
      state = state.copyWith(page: state.page + 1, animationIndex: 0);
    }
  }

  void toLastPage() {
    if (state.page == 0) {
      state = state.copyWith(page: 0, animationIndex: 0);
    } else {
      state.pageController.previousPage(
        duration: const Duration(
          milliseconds: AppConstants.pageControllerAnimationDuration,
        ),
        curve: AppConstants.pageControllerAnimationCurve,
      );
      final itemsOnPage = PagesOfPresentation.values
          .toList()[state.page - 1]
          .slide
          .animationSteps;

      state = state.copyWith(page: state.page - 1, animationIndex: itemsOnPage);
    }
  }

  void switchToPage(int index) {
    state = state.copyWith(page: index, animationIndex: 0);
    state.pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: AppConstants.pageControllerAnimationDuration,
      ),
      curve: AppConstants.pageControllerAnimationCurve,
    );
  }

  void setBrightness(Brightness brightness) => state = state.copyWith(
        brightness: brightness,
      );

  void setLocale(Locale locale) => state = state.copyWith(
        locale: locale,
      );

  void setCursorStyle(CursorStyle cursorStyle) {
    state = state.copyWith(
      cursorStyle: cursorStyle,
    );
  }

  void toggleMouseVisibility() {
    state = state.copyWith(
      cursorStyle: state.cursorStyle == CursorStyle.basic
          ? CursorStyle.hidden
          : CursorStyle.basic,
    );
  }

  void toggleMenu() {
    if (_hasOpenedMenuAndToggledVisibilityForCursor()) {
      return;
    }

    state = state.copyWith(
      menuOpen: !state.menuOpen,
    );
  }

  bool _hasOpenedMenuAndToggledVisibilityForCursor() {
    if (!state.menuOpen && state.cursorStyle == CursorStyle.hidden) {
      state = state.copyWith(
        cursorStyle: CursorStyle.basic,
        menuOpen: true,
      );
      return true;
    }
    return false;
  }
}

final presentationController =
    StateNotifierProvider<PresentationController, Presentation>(
  (ref) => PresentationController(),
);
