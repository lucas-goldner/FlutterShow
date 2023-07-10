import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/fonts.gen.dart';

class FSTextStyles {
  static TextStyle title({Color? color, double? fontSize}) => TextStyle(
        fontSize: fontSize ?? 96,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.graphik,
        color: color ?? CupertinoColors.black,
      );

  static TextStyle regularText({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 52,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: FontFamily.graphik,
        color: color ?? const Color(0xFF121826),
      );

  static TextStyle footerText({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: FontFamily.graphik,
        color: color ?? const Color(0xFF121826),
      );
}
