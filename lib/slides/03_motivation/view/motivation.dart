import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttershow_base/fluttershow_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MotivationSlide extends HookConsumerWidget {
  const MotivationSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;

    return DirectionalAnimation(
      DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FSGradients.backgroundPrimary,
        ),
        child: Column(
          children: [
            LayoutHeader(
              Column(
                children: [
                  const Spacer(),
                  Text(S.of(context).motiviation, style: FSTextStyles.title()),
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
                    child: SvgPicture.asset(
                      'assets/images/shared/flutter_icon.svg',
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
                              SvgPicture.asset(
                                'assets/images/shared/flutter_icon.svg',
                                height: 400,
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
                                child: SvgPicture.asset(
                                  'assets/images/shared/flutter_icon.svg',
                                  height: 520,
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
                          child: SvgPicture.asset(
                            'assets/images/shared/flutter_icon.svg',
                            height: 60,
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
