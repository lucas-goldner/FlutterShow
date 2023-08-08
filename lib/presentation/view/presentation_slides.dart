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
    final presentation = ref.watch(presentationController);
    final controller =
        ref.read<PresentationController>(presentationController.notifier);
    final focusNode = useFocusNode();
    final size = MediaQuery.sizeOf(context);

    void onSlidePress() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }

      controller.goToNextItem();
    }

    void onSecondaryTap() => controller.toLastPage();

    return Focus(
      autofocus: true,
      focusNode: focusNode,
      onKey: (focus, onKey) => controller.handleKeyEvents(onKey),
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
                pageController: presentation.pageController,
              ),

              /// You are a fan of fading? Try this one!
              ///
              //     FadingPresentation(
              //   pageIndex: presentation.page,
              //   presentationPages: PagesOfPresentation.values.slides,
              //   pageController: presentation.pageController,
              // ),

              /// Prefer seeing your slides popping onto the screen?
              ///
              //     ScalingPresentation(
              //   pageIndex: presentation.page,
              //   presentationPages: PagesOfPresentation.values.slides,
              //   pageController: presentation.pageController,
              // ),

              /// Or craft something amazing yourself
              /// using the default implementation as a template.
              ///
              // PageView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: PagesOfPresentation.values.length,
              //   controller: presentation.pageController,
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
                  height: presentation.menuOpen
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
