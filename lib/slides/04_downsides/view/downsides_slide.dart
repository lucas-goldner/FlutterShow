import 'package:flutter/cupertino.dart';
import 'package:flutter_show/components/widgets/layout/layout_body.dart';
import 'package:flutter_show/components/widgets/layout/layout_header.dart';
import 'package:flutter_show/components/widgets/list/animatable_list_text.dart';
import 'package:flutter_show/components/widgets/text/title.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
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
                TextTitle(
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
                [
                  t.annoying,
                  t.lazy,
                  t.boring,
                  t.notFlutter,
                ],
                index,
                textAlign: TextAlign.start,
                dotted: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
