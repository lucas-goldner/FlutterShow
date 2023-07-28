import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:fluttershow_keynote/slides/title_and_photo_alt/keynote_title_and_photo_alt_slide_variants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgendaSlide extends ConsumerWidget {
  const AgendaSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final size = MediaQuery.sizeOf(context);
    final controller = ref.watch(presentationController);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: FSGradients.dynamicBackground(controller.brightness),
      ),
      child: KeynoteTitleAndPhotoAltSlideVariants.variantOne(
        image: Image.asset(
          'assets/images/title_and_photo_slide_alt/title_and_photo_image_alt.png',
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        titleText: t.agenda,
        subTitleText: t.party,
      ),
    );
  }
}
