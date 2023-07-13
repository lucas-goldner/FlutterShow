import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_show/presentation/config/pages_of_presentation.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu.dart';
import 'package:flutter_show/styles/fs_style_constants.dart';
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
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PagesOfPresentation.values.length,
                controller: controller.pageController,
                itemBuilder: (context, index) =>
                    PagesOfPresentation.values[index].slide,
              ),
            ),
            AnimatedPositioned(
              bottom: controller.menuOpen
                  ? 0
                  : -FSStyleConstants.getMenuHeight(size),
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: const Menu(),
            )
          ],
        ),
      ),
    );
  }
}
