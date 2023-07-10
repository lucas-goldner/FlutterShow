import 'package:flutter/cupertino.dart';
import 'package:flutter_show/components/widgets/text/regular_text.dart';
import 'package:flutter_show/components/widgets/text/title.dart';
import 'package:flutter_show/generated/assets.gen.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/styles/fs_gradients.dart';

class OutroSlide extends StatelessWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FSGradients.backgroundPrimary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.custom.qr
                    .image(height: 400, width: 400, fit: BoxFit.contain),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    TextTitle(S.of(context).thanks),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 12),
                      child: Assets.images.shared.flutterIcon.svg(
                        height: 100,
                      ),
                    )
                  ],
                ),
              ],
            ),
            RegularText(
              S.of(context).repoLink,
              fontSize: 32,
            )
          ],
        ),
      );
}
