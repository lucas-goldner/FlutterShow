import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:fluttershow_base/fluttershow_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DownsidesSlide extends HookConsumerWidget {
  const DownsidesSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(presentationController).itemIndex;
    final t = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FSGradients.backgroundPrimary,
      ),
      child: Column(
        children: [
          LayoutHeader(
            Row(
              children: [
                const SizedBox(
                  width: 80,
                ),
                GradientText(
                  t.downsides,
                  gradient: FSGradients.downsidesGradient,
                ),
              ],
            ),
          ),
          LayoutBody(
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: AnimatableListText(
                texts: [
                  t.annoying,
                  t.lazy,
                  t.boring,
                  t.notFlutter,
                ],
                currentIndex: index,
                textAlign: TextAlign.start,
                bullet: ListBullets.circle_outline,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
