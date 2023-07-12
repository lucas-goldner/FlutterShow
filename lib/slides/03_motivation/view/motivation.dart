import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/fluttershow_base.dart';
import 'package:fluttershow_keynote/slides/blank/keynote_blank_slide.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MotivationSlide extends HookConsumerWidget {
  const MotivationSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final index = ref.watch(presentationController).itemIndex;

    return DirectionalAnimation(
      KeynoteBlankSlide(
        headerWidget: Text(t.motiviation, style: FSTextStyles.title()),
        headerFlexUnits: 1,
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: index == 2,
              child: Text(t.step2close, style: FSTextStyles.regularText()),
            ),
            Visibility(
              visible: index != 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: index >= 0,
                    child: Row(
                      children: [
                        Text(t.step1, style: FSTextStyles.regularText()),
                        Padding(
                          padding: const EdgeInsets.only(top: 240),
                          child: Transform.rotate(
                            angle: -math.pi / 14.0,
                            child: const Arrow(
                              'Next',
                              size: Size(100, 100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: index >= 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child:
                              Text(t.step2, style: FSTextStyles.regularText()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 280),
                          child: Transform.rotate(
                            angle: -math.pi / 20.0,
                            child: const CurvyArrow(400, 160),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: index >= 3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Text(t.step3, style: FSTextStyles.regularText()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      100,
      PageDirectionalAnimations.bottom,
      curve: Curves.easeInSine,
    );
  }
}