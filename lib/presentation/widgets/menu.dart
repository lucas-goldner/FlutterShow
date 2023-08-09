import 'package:flutter/cupertino.dart';
import 'package:flutter_show/generated/l10n.dart';
import 'package:flutter_show/presentation/config/cursor_style.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu_multiselect.dart';
import 'package:flutter_show/presentation/widgets/menu_option.dart';
import 'package:flutter_show/presentation/widgets/slide_show.dart';
import 'package:flutter_show/styles/fs_colors.dart';
import 'package:flutter_show/styles/fs_style_constants.dart';
import 'package:flutter_show/styles/fs_text_styles.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Menu extends HookConsumerWidget {
  const Menu({this.slides, super.key});

  /// Used for widget tests, safe to ignore.
  @visibleForTesting
  final List<PresentationSlide>? slides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentation = ref.watch(presentationController);
    final size = MediaQuery.sizeOf(context);
    final t = S.of(context);

    void switchTheme({required bool value}) => ref
        .watch(presentationController.notifier)
        .setBrightness(value ? Brightness.dark : Brightness.light);

    void switchLocale({required Locale value}) =>
        ref.watch(presentationController.notifier).setLocale(value);

    void switchMouseStyle({required CursorStyle value}) =>
        ref.watch(presentationController.notifier).setCursorStyle(value);

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
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: SingleChildScrollView(
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
                            value: presentation.brightness == Brightness.dark,
                            callback: switchTheme,
                          ),
                          verticalMargin8,
                          MenuMultiSelect(
                            optionName: t.language,
                            value: presentation.locale.languageCode,
                            options: S.delegate.supportedLocales
                                .map((locale) => (locale.languageCode, locale))
                                .toList(),
                            callback: (value) =>
                                switchLocale(value: value.$2 as Locale),
                          ),
                          verticalMargin16,
                          MenuMultiSelect(
                            optionName: t.mouse,
                            value: presentation.cursorStyle,
                            options: CursorStyle.values
                                .map(
                                  (mouseStyle) => (
                                    mouseStyle.getLocalizedName(context),
                                    mouseStyle,
                                  ),
                                )
                                .toList(),
                            callback: (value) => switchMouseStyle(
                              value: value.$2 as CursorStyle,
                            ),
                          ),
                          verticalMargin16,
                          CupertinoButton.filled(
                            onPressed: toggleMenu,
                            child: Text(
                              t.close,
                              style: TextStyle(
                                color: FSColors.dynamicColor(
                                  presentation.brightness,
                                  darkColor: CupertinoColors.white,
                                ),
                              ),
                            ),
                          ),
                          verticalMargin8,
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
                            SlideShow(
                              slides: slides,
                            ),
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
      ),
    );
  }
}
