import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/slides/01_title/widgets/title_slide_overlay.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_keynote/fluttershow_keynote.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleSlide extends HookConsumerWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final brightness = ref.watch(presentationController).brightness;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: FSGradients.dynamicBackground(brightness),
      ),
      child: Stack(
        children: [
          KeynoteTitleSlide(
            titleText: t.flutterShow,
            subTitleText: t.presentationsInFlutter,
            footerText: t.author,
            titleGradient: FSGradients.titlePrimary,
            titleStyle: FSTextStyles.title(),
            subtitleStyle: FSTextStyles.regularText(),
            footerStyle: FSTextStyles.footerText(),
          ),
          const TitleSlideOverlay()
        ],
      ),
    );
  }
}