import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/slides/03_motivation/widgets/code.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/components/model/enum/directional_animation_direction.dart';
import 'package:fluttershow_base/components/widgets/fluttershow_base_components.dart';
import 'package:fluttershow_keynote/slides/blank/keynote_blank_slide.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MotivationSlide extends ConsumerWidget {
  const MotivationSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = S.of(context);
    final controller = ref.watch(presentationController);

    return DirectionalAnimation(
      delay: 100,
      direction: DirectionalAnimationDirection.bottom,
      curve: Curves.easeInExpo,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: FSGradients.dynamicBackground(controller.brightness),
        ),
        child: KeynoteBlankSlide(
          headerWidget: Text(t.motiviation, style: FSTextStyles.title()),
          headerFlexUnits: 1,
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: controller.animationIndex == 2,
                child: const Code(),
              ),
              Visibility(
                visible: controller.animationIndex != 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: controller.animationIndex >= 0,
                      child: Row(
                        children: [
                          Text(t.step1, style: FSTextStyles.regularText()),
                          Transform.rotate(
                            angle: -math.pi / 14.0,
                            child: const Arrow(
                              size: Size(100, 100),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: controller.animationIndex >= 1,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              t.step2,
                              style: FSTextStyles.regularText(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 320),
                            child: Transform.rotate(
                              angle: -math.pi / 20.0,
                              child: const CurvyArrow(400, 160),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: controller.animationIndex >= 3,
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
      ),
    );
  }
}
