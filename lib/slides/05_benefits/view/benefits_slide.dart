import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:fluttershow_keynote/slides/title_and_bullets/keynote_title_and_bullets_slide_variants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BenefitsSlide extends ConsumerWidget {
  const BenefitsSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;
    final t = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FSGradients.background,
      ),
      child: KeynoteTitleAndBulletsSlideVariants.variantOne(
        titleText: t.benefits,
        subTitleText: t.great,
        bulletPoints: [t.awesome, t.amazing, t.outstanding, t.madeWithFlutter],
        currentIndex: index,
      ),
    );
  }
}
