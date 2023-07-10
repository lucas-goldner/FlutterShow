import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/styles/fc_text_styles.dart';

class FooterText extends StatelessWidget {
  const FooterText(
    this.footerText, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlignment,
  });

  final String footerText;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      footerText,
      textAlign: textAlignment ?? TextAlign.center,
      style: FCTextStyles.footerText(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
