import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/styles/fs_gradients.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                children: [
                  Text(
                    S.of(context).thanks,
                    style: FSTextStyles.title(),
                  ),
                  SvgPicture.asset(
                    'assets/images/shared/flutter_icon.svg',
                    height: 100,
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
