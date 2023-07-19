import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/slides/01_title/widgets/title_slide_overlay.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_keynote/fluttershow_keynote.dart';
import 'package:fluttershow_keynote/slides/title_slide/keynote_title_slide.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleSlide extends ConsumerWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final controller = ref.watch(presentationController);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: FSGradients.dynamicBackground(controller.brightness),
      ),
      child: Stack(
        children: [
          /// [KeynoteTitleSlide] is a one of `fluttershow_keynote`s widgets
          /// that can be used to create slides.
          /// In this case `KeynoteTitleSlide` is used, but if you
          /// would like to use "preset" then use one of the variants.
          /// Try it out below by commenting in
          /// [KeynoteTitleSlideVariants.variantOne] and commenting out
          /// [KeynoteTitleSlide]
          ///
          /// If you want to read more about the `base`
          /// and `variant` slides visit:
          /// https://flutter-show-docs.vercel.app/docs/fluttershow_keynote/

          /// As you can see we also have access [KeynoteTextstyles] which
          /// have a lot of predefined textstyles. You can also create your
          /// own textstyles in [FSTextStyles] or use the declared `themes`.

          KeynoteTitleSlide(
            titleText: t.flutterShow,
            subTitleText: t.presentationsInFlutter,
            footerText: t.author,
            titleGradient: FSGradients.titlePrimary,
            titleStyle: KeynoteTextstyles.title(),
            subtitleStyle: KeynoteTextstyles.subtitle(),
            footerStyle: FSTextStyles.footerText(),
          ),

          /// Try me first and then `variantTwo()`!
          ///
          // KeynoteTitleSlideVariants.variantOne(
          //   titleText: t.flutterShow,
          //   subTitleText: t.presentationsInFlutter,
          //   footerText: t.author,
          // ),

          const TitleSlideOverlay()
        ],
      ),
    );
  }
}
