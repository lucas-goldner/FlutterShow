import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';

class TitleSlideOverlay extends StatelessWidget {
  const TitleSlideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutHeader(
          Row(
            children: [
              Assets.images.custom.bitfactoryLogoSmall.image(),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child:
                    Assets.images.shared.flutterIcon.svg(width: 80, height: 80),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Assets.images.shared.flutterconLogo
                    .svg(width: 80, height: 40),
              ),
            ],
          ),
          flexUnits: 1,
        ),
        LayoutBody(
          Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child:
                              Assets.images.titleSlide.flutterconTowerBase.svg(
                            height: 400,
                            width: 400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 64),
                        child: Assets.images.titleSlide.flutterconTower.svg(
                          height: 300,
                          width: 300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 200),
                        child: Assets.images.titleSlide.flutterconParticleCircle
                            .svg(
                              height: 100,
                              width: 100,
                            )
                            .animate(
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .rotate(
                              curve: Curves.easeIn,
                              duration: const Duration(seconds: 12),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          flexUnits: 6,
        ),
      ],
    );
  }
}
