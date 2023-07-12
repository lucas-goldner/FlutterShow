import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu_option.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/fluttershow_base.dart';
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

    return Align(
      alignment: Alignment.bottomCenter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.black.withOpacity(0.5),
        ),
        child: SizedBox(
          width: size.width,
          height: size.height / 4,
          child: Padding(
            padding: allPadding16,
            child: Row(
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
