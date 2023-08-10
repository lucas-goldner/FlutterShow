import 'package:flutter/services.dart';

enum KeyActions {
  goToLastSlide([
    PhysicalKeyboardKey.keyA,
    PhysicalKeyboardKey.arrowLeft,
    PhysicalKeyboardKey.arrowDown
  ]),
  goToNextSlide([
    PhysicalKeyboardKey.keyD,
    PhysicalKeyboardKey.arrowRight,
    PhysicalKeyboardKey.arrowUp
  ]),
  openMenu([
    PhysicalKeyboardKey.keyM,
  ]),
  showHideMouse([
    PhysicalKeyboardKey.keyO,
  ]);

  const KeyActions(this.keybindings);

  final List<PhysicalKeyboardKey> keybindings;
}
