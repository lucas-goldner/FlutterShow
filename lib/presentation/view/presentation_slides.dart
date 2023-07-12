import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_show/presentation/config/pages_of_presentation.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/presentation/widgets/menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationSlides extends HookConsumerWidget {
  const PresentationSlides({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(presentationController).pageController;
    final focusNode = FocusNode();
    final keyPressed = useState(false);

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
              backgroundColor: Colors.white,
              child: PageView.builder(
                itemCount: PagesOfPresentation.values.length,
                controller: pageController,
                itemBuilder: (context, index) =>
                    PagesOfPresentation.values[index].slide,
              ),
            ),
            const Menu(),
          ],
        ),
      ),
    );
  }
}
