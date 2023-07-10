import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/components/arrows/arrow.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MethodChannelsSlide extends HookConsumerWidget {
  const MethodChannelsSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FCGradients.backgroundPrimary,
      ),
      child: Column(
        children: [
          LayoutHeader(
            Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                TextTitle(S.of(context).TypicalWay),
              ],
            ),
            flexUnits: 2,
          ),
          LayoutBody(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Visibility(
                      visible: index >= 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            RegularText(S.of(context).flutter),
                            const SizedBox(
                              width: 60,
                            ),
                            Arrow(
                              S.of(context).invokeFunctions,
                              height: 48,
                            ),
                            const SizedBox(
                              width: 72,
                            ),
                            RegularText(S.of(context).methodChannel),
                            const SizedBox(
                              width: 60,
                            ),
                            Arrow(
                              S.of(context).receiveValue,
                              height: 48,
                            ),
                            const SizedBox(
                              width: 120,
                            ),
                            RegularText(S.of(context).flutter),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
            flexUnits: 8,
          ),
        ],
      ),
    );
  }
}
