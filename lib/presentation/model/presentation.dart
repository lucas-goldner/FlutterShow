import 'package:flutter/material.dart';

@immutable
class Presentation {
  const Presentation(
    this.itemIndex,
    this.page,
    this.locale,
    this.brightness,
    this.pageController,
  );

  final int itemIndex;
  final int page;
  final Locale locale;
  final Brightness brightness;
  final PageController pageController;

  Presentation copyWith({
    int? itemIndex,
    int? page,
    Locale? locale,
    Brightness? brightness,
  }) {
    return Presentation(
      itemIndex ?? this.itemIndex,
      page ?? this.page,
      locale ?? this.locale,
      brightness ?? this.brightness,
      pageController,
    );
  }
}
