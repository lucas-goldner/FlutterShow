import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutroSlide extends StatelessWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FSGradients.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/custom/qr.png',
                  height: 400,
                  width: 400,
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      S.of(context).thanks,
                      style: FSTextStyles.title(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 12),
                      child: SvgPicture.asset(
                        'assets/images/shared/flutter_icon.svg',
                        height: 100,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Text(
              S.of(context).repoLink,
              style: FSTextStyles.regularText(
                fontSize: 32,
              ),
            )
          ],
        ),
      );
}
