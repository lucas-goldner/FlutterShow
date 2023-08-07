import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_show/presentation/config/presentation_slides.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu.dart';
import 'package:flutter_show/styles/fs_style_constants.dart';
import 'package:fluttershow_base/components/widgets/presentation/page_builder_presentation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationSlides extends HookConsumerWidget {
  const PresentationSlides({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(presentationController);
    final focusNode = FocusNode();
    final keyPressed = useState(false);
    final size = MediaQuery.sizeOf(context);

    void toNextItem() => ref
        .read<PresentationController>(presentationController.notifier)
        .goToNextItem();

    KeyEventResult handleKeyEvent(RawKeyEvent event) => ref
        .read<PresentationController>(presentationController.notifier)
        .handleKeyEvents(event, keyPressed);

    void onSlidePress() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }

      toNextItem();
    }

    void onSecondaryTap() => ref
        .read<PresentationController>(presentationController.notifier)
        .toLastPage();

    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: handleKeyEvent,
      child: GestureDetector(
        onTap: onSlidePress,
        onSecondaryTap: onSecondaryTap,
        child: Stack(
          children: [
            CupertinoPageScaffold(
              child:

                  /// Use the prebuild widgets such as [PageBuilderPresentation]
                  /// for your presentation format.
                  ///
                  /// Notice: Some of the preview slides are wrapped with a
                  /// custom animation, these presentation widgets can be seen
                  /// as the `default` way of animating between slides.
                  PageBuilderPresentation(
                presentationPages: PagesOfPresentation.values.slides,
                pageController: controller.pageController,
              ),

              /// You are a fan of fading? Try this one!
              ///
              //     FadingPresentation(
              //   pageIndex: controller.page,
              //   presentationPages: PagesOfPresentation.values.slides,
              //   pageController: controller.pageController,
              // ),

              /// Prefer seeing your slides popping onto the screen?
              ///
              //     ScalingPresentation(
              //   pageIndex: controller.page,
              //   presentationPages: PagesOfPresentation.values.slides,
              //   pageController: controller.pageController,
              // ),

              /// Or craft something amazing yourself
              /// using the default implementation as a template.
              ///
              // PageView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: PagesOfPresentation.values.length,
              //   controller: controller.pageController,
              //   itemBuilder: (context, index) =>
              //       PagesOfPresentation.values[index].slide,
              // ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: controller.menuOpen
                      ? 0
                      : FSStyleConstants.getMenuHeight(size),
                  child: const Menu(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
