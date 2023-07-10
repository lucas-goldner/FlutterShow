import 'package:flutter/cupertino.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';

class RegularText extends StatelessWidget {
  const RegularText(
    this.bodyText, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String bodyText;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      textAlign: textAlign ?? TextAlign.center,
      style: FSTextStyles.regularText(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
