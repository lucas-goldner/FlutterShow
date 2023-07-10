import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CMHeadphoneProviderSlide extends HookConsumerWidget {
  const CMHeadphoneProviderSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FCGradients.backgroundPrimary,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextTitle(S.of(context).usingTheBindings),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              child: Assets.images.custom.cmheadphoneProvider.image(
                fit: BoxFit.contain,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: index == 0 ? 0.0 : 1.0,
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        RegularText(S.of(context).dart),
                        Assets.images.custom.cmheadphoneProviderShort.image(
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        RegularText(S.of(context).swift),
                        Assets.images.custom.cmHeadphoneProviderIos.image(
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
