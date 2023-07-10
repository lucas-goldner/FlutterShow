import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SolutionSlide extends HookConsumerWidget {
  const SolutionSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;
    final height = MediaQuery.of(context).size.height;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FCGradients.backgroundPrimary,
      ),
      child: Stack(
        children: [
          Visibility(
            visible: index >= 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Assets.images.custom.cmheadphone.image(
                height: height,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Visibility(
            visible: index >= 1,
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 80, top: 200),
                  child: Assets.images.custom.airpods.image(
                    height: 320,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
