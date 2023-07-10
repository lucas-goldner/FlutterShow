import 'package:flutter/services.dart';

enum KeyActions {
  goToLastSlide([
    PhysicalKeyboardKey.keyA,
    PhysicalKeyboardKey.arrowLeft,
    PhysicalKeyboardKey.arrowDown
  ]),
  goNextSlide([
    PhysicalKeyboardKey.keyD,
    PhysicalKeyboardKey.arrowRight,
    PhysicalKeyboardKey.arrowUp
  ]);

  const KeyActions(this.keybindings);

  final List<PhysicalKeyboardKey> keybindings;
}
