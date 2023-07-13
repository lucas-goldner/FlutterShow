import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:fluttershow_base/components/widgets/fluttershow_base_components.dart';
import 'package:fluttershow_keynote/slides/title_and_photo_alt/keynote_title_and_photo_alt_slide_variations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgendaSlide extends ConsumerWidget {
  const AgendaSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final size = MediaQuery.sizeOf(context);

    return FadeAnimation(
      delay: 100,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FSGradients.background,
        ),
        child: KeynoteTitleAndPhotoAltSlideVariations.variantOne(
          image: Image.asset(
            'assets/images/title_and_photo_slide_alt/title_and_photo_image_alt.png',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          title: t.agenda,
          subtitle: t.party,
        ),
      ),
    );
  }
}
