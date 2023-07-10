import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/generated/fonts.gen.dart';

class FCTextStyles {
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
        color: color ?? const Color.fromARGB(255, 18, 24, 38),
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
        color: color ?? const Color.fromARGB(255, 18, 24, 38),
      );
}
