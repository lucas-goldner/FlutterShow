import 'package:flutter/material.dart';

@immutable
class Presentation {
  const Presentation({
    required this.animationIndex,
    required this.page,
    required this.locale,
    required this.brightness,
    required this.menuOpen,
    required this.pageController,
  });

  final int animationIndex;
  final int page;
  final Locale locale;
  final Brightness brightness;
  final bool menuOpen;
  final PageController pageController;

  Presentation copyWith({
    int? animationIndex,
    int? page,
    Locale? locale,
    bool? menuOpen,
    Brightness? brightness,
  }) {
    return Presentation(
      animationIndex: animationIndex ?? this.animationIndex,
      page: page ?? this.page,
      locale: locale ?? this.locale,
      brightness: brightness ?? this.brightness,
      menuOpen: menuOpen ?? this.menuOpen,
      pageController: pageController,
    );
  }
}
