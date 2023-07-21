import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OutroSlide extends ConsumerWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(presentationController);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: FSGradients.dynamicBackground(controller.brightness),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/custom/qr.png',
                height: 400,
                width: 400,
              ),
              horizontalMargin32,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).thanks,
                    textAlign: TextAlign.left,
                    style: FSTextStyles.title(),
                  ),
                  Text(
                    S.of(context).madeWith,
                    textAlign: TextAlign.left,
                    style: FSTextStyles.regularText(),
                  ),
                  Image.asset(
                    'assets/images/custom/fluttershow.png',
                  )
                ],
              ),
            ],
          ),
          verticalMargin32,
          Text(
            S.of(context).repoLink,
            style: FSTextStyles.regularText(
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
