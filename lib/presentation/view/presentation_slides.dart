import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttercon_2023_presentation/presentation/model/enum/key_actions.dart';
import 'package:fluttercon_2023_presentation/presentation/model/enum/pages_of_presentation.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/airpods_data_provider.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationSlides extends HookConsumerWidget {
  const PresentationSlides({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(presentationController).pageController;
    final focusNode = FocusNode();
    final keyPressed = useState(false);

    void toNextItem() {
      if (pageController.page == PagesOfPresentation.titleSlide.index) {
        ref
            .read<AirpodsDataProvider>(airpodsDataProvider.notifier)
            .initializeConnection();
      }

      ref
          .read<PresentationController>(presentationController.notifier)
          .goToNextItem();
    }

    KeyEventResult handleKeyEvent(RawKeyEvent event) {
      if (event is RawKeyDownEvent && !keyPressed.value) {
        if (KeyActions.goToLastSlide.keybindings
            .any((key) => key == event.physicalKey)) {
          ref
              .read<PresentationController>(presentationController.notifier)
              .toLastItem();
          keyPressed.value = true;
          return KeyEventResult.handled;
        }

        if (KeyActions.goNextSlide.keybindings
            .any((key) => key == event.physicalKey)) {
          toNextItem();
          keyPressed.value = true;
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      } else if (event is RawKeyUpEvent) {
        keyPressed.value = false;
      }
      return KeyEventResult.ignored;
    }

    void onSlidePress() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }

      toNextItem();
    }

    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: handleKeyEvent,
      child: GestureDetector(
        onTap: onSlidePress,
        onSecondaryTap: () => ref
            .read<PresentationController>(presentationController.notifier)
            .toLastPage(),
        child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          child: PageView.builder(
            itemCount: PagesOfPresentation.values.length,
            controller: pageController,
            itemBuilder: (context, index) =>
                PagesOfPresentation.values[index].slide,
          ),
        ),
      ),
    );
  }
}
