import 'package:flutter/cupertino.dart';

class FSColors {
  static const Color regularTextColor = Color(0xFF121826);
  static const Color regularTextColorDark = Color(0xFFD0D0D0);
  static Color dynamicColor(
    Brightness brightness, {
    Color? darkColor,
    Color? lightColor,
  }) =>
      brightness == Brightness.dark
          ? darkColor ?? regularTextColorDark
          : lightColor ?? regularTextColor;
}
