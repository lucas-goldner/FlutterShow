import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/presentation/model/enum/pages_of_presentation.dart';
import 'package:fluttercon_2023_presentation/presentation/model/presentation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationController extends StateNotifier<Presentation> {
  PresentationController()
      : super(Presentation(0, 0, const Locale('en'), PageController()));

  void goToNextItem() {
    state = state.copyWith(itemIndex: state.itemIndex + 1);

    if (state.itemIndex >=
        PagesOfPresentation.values.toList()[state.page].items) {
      nextPage();
    }
  }

  void toLastItem() {
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
}

final presentationController =
    StateNotifierProvider<PresentationController, Presentation>((ref) {
  return PresentationController();
});
