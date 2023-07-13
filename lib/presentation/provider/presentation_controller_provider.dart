import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show/presentation/config/key_actions.dart';
import 'package:flutter_show/presentation/config/pages_of_presentation.dart';
import 'package:flutter_show/presentation/model/presentation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationController extends StateNotifier<Presentation> {
  PresentationController()
      : super(
          Presentation(
            itemIndex: 0,
            page: 0,
            locale: const Locale('en'),
            menuOpen: false,
            brightness: PlatformDispatcher.instance.platformBrightness,
            pageController: PageController(),
          ),
        );

  KeyEventResult handleKeyEvents(
    RawKeyEvent event,
    ValueNotifier<bool> keyPressed,
  ) {
    if (event is RawKeyDownEvent && !keyPressed.value) {
      if (KeyActions.goToLastSlide.keybindings
          .any((key) => key == event.physicalKey)) {
        gotoLastItem();
        keyPressed.value = true;
        return KeyEventResult.handled;
      }

      if (KeyActions.goNextSlide.keybindings
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

  void goToNextItem() {
    state = state.copyWith(itemIndex: state.itemIndex + 1);

    if (state.itemIndex >=
        PagesOfPresentation.values.toList()[state.page].items) {
      nextPage();
    }
  }

  void gotoLastItem() {
    if (state.itemIndex == 0) {
      toLastPage();
    } else {
      state = state.copyWith(itemIndex: state.itemIndex - 1);
    }
  }

  void nextPage() {
    if (state.page == PagesOfPresentation.values.length - 1) {
      state = state.copyWith(
        page: PagesOfPresentation.values.length - 1,
        itemIndex: 0,
      );
    } else {
      state = state.copyWith(page: state.page + 1, itemIndex: 0);
      state.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void toLastPage() {
    if (state.page == 0) {
      state = state.copyWith(page: 0, itemIndex: 0);
    } else {
      final itemsOnPage =
          PagesOfPresentation.values.toList()[state.page - 1].items;
      state = state.copyWith(page: state.page - 1, itemIndex: itemsOnPage);
      state.pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void switchToPage(int index) {
    state = state.copyWith(page: index, itemIndex: 0);
    state.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void updateCurrentPage(int index) {
    state = state.copyWith(page: index, itemIndex: 0);
  }

  void setBrightness(Brightness brightness) {
    state = state.copyWith(
      brightness: brightness,
    );
  }

  void toggleMenu() => state = state.copyWith(menuOpen: !state.menuOpen);
}

final presentationController =
    StateNotifierProvider<PresentationController, Presentation>(
  (ref) => PresentationController(),
);
