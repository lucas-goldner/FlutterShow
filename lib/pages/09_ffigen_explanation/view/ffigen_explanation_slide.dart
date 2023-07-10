import 'package:flutter/widgets.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/list/animatable_list_text.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FFIGenExplanationSlide extends HookConsumerWidget {
  const FFIGenExplanationSlide({super.key});

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
            Row(
              children: [
                const SizedBox(
                  width: 80,
                ),
                TextTitle(S.of(context).ffigen),
                const Spacer()
              ],
            ),
          ),
          LayoutBody(
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: AnimatableListText(
                [
                  S.of(context).ffiExplain,
                  S.of(context).ffigenexplain,
                  S.of(context).requiresConfig,
                  S.of(context).compatibleLanguages
                ],
                index,
                textAlign: TextAlign.start,
                padding: const EdgeInsets.symmetric(vertical: 8),
                dotted: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
