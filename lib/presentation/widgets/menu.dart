import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu_option.dart';
import 'package:flutter_show/presentation/widgets/slide_show.dart';
import 'package:flutter_show/styles/fs_style_constants.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Menu extends HookConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentation = ref.watch(presentationController);
    final size = MediaQuery.sizeOf(context);
    final t = S.of(context);

    void switchTheme({required bool value}) => ref
        .watch(presentationController.notifier)
        .setBrightness(value ? Brightness.light : Brightness.dark);

    void toggleMenu() =>
        ref.watch(presentationController.notifier).toggleMenu();

    return Align(
      alignment: Alignment.bottomCenter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: CupertinoColors.black.withOpacity(0.5),
        ),
        child: SizedBox(
          width: size.width,
          height: FSStyleConstants.getMenuHeight(size),
          child: Padding(
            padding: allPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.menu,
                          style: FSTextStyles.footerText(),
                        ),
                        MenuOption(
                          description: t.darkMode,
                          value: presentation.brightness != Brightness.dark,
                          callback: switchTheme,
                        ),
                        verticalMargin8,
                        CupertinoButton.filled(
                          onPressed: toggleMenu,
                          child: const Text('Close'),
                        )
                      ],
                    ),
                    horizontalMargin12,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: horizontalPadding8,
                            child: Text(
                              t.slides,
                              style: FSTextStyles.footerText(),
                            ),
                          ),
                          const SlideShow(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
