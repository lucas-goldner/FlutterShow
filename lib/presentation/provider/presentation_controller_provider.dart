import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/presentation/config/contants.dart';
import 'package:flutter_show/presentation/config/key_actions.dart';
import 'package:flutter_show/presentation/config/mouse_style.dart';
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

  /// This function listens to all key events
  KeyEventResult handleKeyEvents(
    RawKeyEvent event,
    ValueNotifier<bool> keyPressed,
  ) {
    if (event is RawKeyDownEvent && !keyPressed.value) {
      if (KeyActions.goToLastSlide.keybindings
          .any((key) => key == event.physicalKey)) {
        goToLastItem();
        keyPressed.value = true;
        return KeyEventResult.handled;
      }

      if (KeyActions.goToNextSlide.keybindings
          .any((key) => key == event.physicalKey)) {
        goToNextItem();
        keyPressed.value = true;
        return KeyEventResult.handled;
      }

      if (KeyActions.openMenu.keybindings
          .any((key) => key == event.physicalKey)) {
        toggleMenu();
        keyPressed.value = true;
        return KeyEventResult.handled;
      }

      return KeyEventResult.ignored;
    } else if (event is RawKeyUpEvent) {
      keyPressed.value = false;
    }
    return KeyEventResult.ignored;
  }

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

  /// This function is used for the quicktravel on the Menu
  /// in order to switch between slides quickly
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

  void setMouseStyle(MouseStyle mouseStyle) => state = state.copyWith(
        mouseStyle: mouseStyle,
      );

  void toggleMenu() => state = state.copyWith(menuOpen: !state.menuOpen);
}

final presentationController =
    StateNotifierProvider<PresentationController, Presentation>(
  (ref) => PresentationController(),
);
