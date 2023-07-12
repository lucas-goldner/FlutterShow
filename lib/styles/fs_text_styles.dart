import 'package:flutter/cupertino.dart';
import 'package:flutter_show/presentation/config/contants.dart';

class FSTextStyles {
  static TextStyle title({Color? color, double? fontSize}) => TextStyle(
        fontSize: fontSize ?? 96,
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.fontGraphik,
        color: color,
      );

  static TextStyle regularText({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 52,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: AppConstants.fontGraphik,
        color: color,
      );

  static TextStyle footerText({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: AppConstants.fontGraphik,
        color: color,
      );
}
