import 'package:flutter/material.dart';
import 'package:flutter_show/components/views/slide_title_and_photo_alt.dart';
import 'package:flutter_show/components/widgets/transitions/fade_animation.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgendaSlide extends HookConsumerWidget {
  const AgendaSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final index = ref.watch(presentationController).itemIndex;

    return FadeAnimation(
      DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FSGradients.backgroundPrimary,
        ),
        child: SlideTitleAndPhotoAlt(
          const SizedBox.shrink(),
          t.agenda,
          [t.design, t.code, t.test, t.present, t.party],
          itemListdotted: true,
          itemListtextAlign: TextAlign.start,
          itemsPadding: const EdgeInsets.symmetric(vertical: 8),
          animateItems: true,
          currentIndex: index,
        ),
      ),
      100,
    );
  }
}
