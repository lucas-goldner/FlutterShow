import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_footer.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/footer_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';

class SlideTitle extends StatelessWidget {
  const SlideTitle({
    required this.titleText,
    super.key,
    this.subTitleText,
    this.footerText,
    this.titleColors,
    this.textColor,
  });

  final String titleText;
  final String? subTitleText;
  final String? footerText;
  final List<Color>? titleColors;
  final Color? textColor;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LayoutHeader(
            Column(
              children: [
                const Spacer(),
                Flexible(
                  child: TextTitle(titleText)
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .shimmer(
                        duration: const Duration(seconds: 2, milliseconds: 500),
                        colors: titleColors ??
                            FCGradients.animatedTitlePrimary.colors,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: RegularText(
                    subTitleText ?? '',
                    color: textColor,
                  ),
                ),
              ],
            ),
            flexUnits: 8,
          ),
          LayoutFooter(
            Column(
              children: [
                const Spacer(),
                Center(
                  child: FooterText(
                    footerText ?? '',
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
            flexUnits: 2,
          ),
        ],
      );
}
