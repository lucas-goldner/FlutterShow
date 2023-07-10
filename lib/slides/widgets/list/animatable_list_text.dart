import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/presentation/widgets/fade_animation.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';

class AnimatableListText extends StatelessWidget {
  const AnimatableListText(
    this.texts,
    this.currentIndex, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.dotted,
    this.padding,
  });

  final int currentIndex;
  final List<String> texts;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? dotted;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: texts.length,
        itemBuilder: (context, index) => Padding(
          padding: padding ?? EdgeInsets.zero,
          child: currentIndex >= index
              ? FadeAnimation(
                  RegularText(
                    dotted ?? false ? '\u2022 ${texts[index]}' : texts[index],
                    color: color,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    textAlign: textAlign,
                  ),
                  100,
                )
              : const SizedBox.shrink(),
        ),
      );
}
