import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';

class OutroSlide extends StatelessWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FCGradients.backgroundPrimary,
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
                    TextTitle('${S.of(context).thanks}!'),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 12),
                      child: Assets.images.custom.bitfactoryLogoLong.image(
                        fit: BoxFit.contain,
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
