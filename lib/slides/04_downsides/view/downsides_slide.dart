import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:fluttershow_keynote/slides/title_and_bullets/keynote_title_and_bullets_slide_variants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DownsidesSlide extends HookConsumerWidget {
  const DownsidesSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;
    final t = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FSGradients.backgroundPrimary,
      ),
      child: KeynoteTitleAndBulletsSlideVariants.variantTwo(
        titleText: t.downsides,
        subTitleText: t.reallyBad,
        bulletPoints: [t.annoying, t.boring, t.lazy, t.notFlutter],
        currentIndex: index,
      ),
    );
  }
}
