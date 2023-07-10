import 'package:flutter/material.dart';
import 'package:flutter_show/components/views/slide_title.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/slides/01_title/widgets/title_slide_overlay.dart';
import 'package:flutter_show/styles/fs_gradients.dart';

class TitleSlide extends StatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FSGradients.backgroundPrimary,
      ),
      child: Stack(
        children: [
          SlideTitle(
            titleText: t.flutterShow,
            subTitleText: t.presentationsInFlutter,
            footerText: t.author,
          ),
          const TitleSlideOverlay()
        ],
      ),
    );
  }
}
