import 'package:flutter/material.dart';
import 'package:flutter_show/components/widgets/layout/layout_footer.dart';
import 'package:flutter_show/components/widgets/layout/layout_header.dart';
import 'package:flutter_show/components/widgets/text/footer_text.dart';
import 'package:flutter_show/components/widgets/text/regular_text.dart';
import 'package:flutter_show/components/widgets/text/title.dart';

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
                  child: TextTitle(titleText),
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
