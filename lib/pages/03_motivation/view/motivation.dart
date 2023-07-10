import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/presentation/widgets/directional_animation.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/components/arrows/curvy_arrow.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:fluttercon_2023_presentation/styles/transitions/page_directional_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MotivationSlide extends HookConsumerWidget {
  const MotivationSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;

    return DirectionalAnimation(
      DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FCGradients.backgroundPrimary,
        ),
        child: Column(
          children: [
            LayoutHeader(
              Column(
                children: [
                  const Spacer(),
                  TextTitle(S.of(context).motivation),
                ],
              ),
              flexUnits: 1,
            ),
            LayoutBody(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: index == 2,
                    child: Assets.images.custom.motionData.image(
                      fit: BoxFit.contain,
                    ),
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
                              Assets.images.custom.giraph.image(
                                height: 400,
                                fit: BoxFit.contain,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 400),
                                child: CurvyArrow(400, 160),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index >= 1,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 80),
                                child: Assets.images.custom.motionData.image(
                                  height: 520,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 400),
                                child: Transform.rotate(
                                  angle: -math.pi / 48.0,
                                  child: const CurvyArrow(400, 160),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index >= 3,
                          child: Assets.images.custom.pushup.image(
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      100,
      PageDirectionalAnimations.bottom,
      curve: Curves.easeInSine,
    );
  }
}
