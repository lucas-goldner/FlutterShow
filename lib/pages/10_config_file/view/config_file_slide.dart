import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_body.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/layout/layout_header.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/title.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigFileSlide extends HookConsumerWidget {
  const ConfigFileSlide({super.key});

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
                TextTitle(S.of(context).theMasterFile),
                const Spacer()
              ],
            ),
          ),
          Visibility(
            visible: index == 1,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: LayoutBody(
              Center(child: Assets.images.custom.ffigenConfig.image()),
            ),
          )
        ],
      ),
    );
  }
}
