import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

@visibleForTesting
Future<void> simulateKeyEvent(String? character, LogicalKeyboardKey key) async {
  void handleKey(RawKeyEvent event) {
    expect(event.character, equals(character));
  }

  RawKeyboard.instance.addListener(handleKey);
  await simulateKeyDownEvent(key);
  RawKeyboard.instance.removeListener(handleKey);
}
