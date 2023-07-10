import 'package:flutter/widgets.dart';
import 'package:flutter_show/components/widgets/text/gradient_text.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
    this.titleText, {
    Gradient? gradient,
    super.key,
  }) : passedGradient = gradient ?? FSGradients.titlePrimary;

  final String titleText;
  final Gradient passedGradient;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      titleText,
      gradient: passedGradient,
      style: FSTextStyles.title(),
    );
  }
}
